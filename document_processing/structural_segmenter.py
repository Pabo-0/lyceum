from dataclasses import replace

from document_processing.config import DEFAULT_CHUNK_MAX_WORDS
from document_processing.heading_detector import HeadingCandidate, detect_heading
from document_processing.models import (
    DocumentSection,
    ParagraphChunk,
    StructuralAnalysis,
)
from document_processing.text_chunker import split_text_into_chunks


def segment_structure(
    content: str,
    max_chunk_words: int = DEFAULT_CHUNK_MAX_WORDS,
) -> StructuralAnalysis:
    lines = content.splitlines()
    section_builders: list[_SectionBuilder] = []
    orphan_chunks: list[ParagraphChunk] = []
    section_stack: list[_SectionBuilder] = []
    paragraph_buffer: list[str] = []
    paragraph_start_line: int | None = None
    first_content_seen = False
    chunk_order = 0

    def flush_paragraph(end_line: int) -> None:
        nonlocal chunk_order, paragraph_buffer, paragraph_start_line
        if not paragraph_buffer:
            return

        text = " ".join(part.strip() for part in paragraph_buffer if part.strip())
        markdown = "\n".join(part.rstrip() for part in paragraph_buffer if part.strip())
        if text:
            parent = section_stack[-1] if section_stack else None
            for piece in split_text_into_chunks(
                text,
                max_words=max_chunk_words,
                markdown=markdown,
            ):
                chunk_order += 1
                chunk = ParagraphChunk(
                    chunk_id=f"chunk-{chunk_order}",
                    parent_section_id=parent.section_id if parent else None,
                    text=piece.text,
                    markdown=piece.markdown,
                    order=chunk_order,
                    start_line=paragraph_start_line or end_line,
                    end_line=end_line,
                    word_count=piece.word_count,
                    character_count=len(piece.markdown or piece.text),
                    chunk_type=piece.chunk_type,
                )
                if parent:
                    parent.chunks.append(chunk)
                else:
                    orphan_chunks.append(chunk)

        paragraph_buffer = []
        paragraph_start_line = None

    for index, line in enumerate(lines, start=1):
        stripped = line.strip()
        if not stripped:
            flush_paragraph(index - 1)
            continue

        heading = detect_heading(stripped, is_first_content_line=not first_content_seen)
        first_content_seen = True
        if heading:
            flush_paragraph(index - 1)
            builder = _create_section_builder(
                heading=heading,
                order=len(section_builders) + 1,
                line_number=index,
                markdown=line.rstrip() or heading.title,
                section_stack=section_stack,
            )
            while section_stack and section_stack[-1].level >= builder.level:
                section_stack.pop()
            builder.parent_section_id = section_stack[-1].section_id if section_stack else None
            section_stack.append(builder)
            section_builders.append(builder)
            continue

        if paragraph_start_line is None:
            paragraph_start_line = index
        paragraph_buffer.append(line.rstrip())

    flush_paragraph(len(lines))
    sections = [_finalize_section(builder, len(lines)) for builder in section_builders]
    subsection_count = sum(1 for section in sections if section.parent_section_id is not None)

    return StructuralAnalysis(
        sections=sections,
        orphan_chunks=orphan_chunks,
        section_count=len(sections),
        subsection_count=subsection_count,
        chunk_count=chunk_order,
    )


class _SectionBuilder:
    def __init__(
        self,
        section_id: str,
        title: str,
        markdown: str,
        level: int,
        order: int,
        heading_type: str,
        numbering: str | None,
        start_line: int,
        parent_section_id: str | None,
    ) -> None:
        self.section_id = section_id
        self.title = title
        self.markdown = markdown
        self.level = level
        self.order = order
        self.heading_type = heading_type
        self.numbering = numbering
        self.start_line = start_line
        self.parent_section_id = parent_section_id
        self.chunks: list[ParagraphChunk] = []


def _create_section_builder(
    heading: HeadingCandidate,
    order: int,
    line_number: int,
    markdown: str,
    section_stack: list[_SectionBuilder],
) -> _SectionBuilder:
    level = _effective_heading_level(heading, section_stack)
    parent = _find_parent_for_level(section_stack, level)
    return _SectionBuilder(
        section_id=f"section-{order}",
        title=heading.title,
        markdown=markdown,
        level=level,
        order=order,
        heading_type=heading.heading_type,
        numbering=heading.numbering,
        start_line=line_number,
        parent_section_id=parent.section_id if parent else None,
    )


def _effective_heading_level(
    heading: HeadingCandidate,
    section_stack: list[_SectionBuilder],
) -> int:
    if not section_stack or heading.heading_type != "numbered":
        return heading.level

    root = section_stack[0]
    if root.level == 1 and root.heading_type in {"markdown", "title_line"}:
        return heading.level + 1

    return heading.level


def _find_parent_for_level(
    section_stack: list[_SectionBuilder],
    level: int,
) -> _SectionBuilder | None:
    for section in reversed(section_stack):
        if section.level < level:
            return section
    return None


def _finalize_section(builder: _SectionBuilder, document_end_line: int) -> DocumentSection:
    end_line = builder.chunks[-1].end_line if builder.chunks else builder.start_line
    chunks = [
        replace(chunk, parent_section_id=builder.section_id)
        for chunk in builder.chunks
    ]
    return DocumentSection(
        section_id=builder.section_id,
        parent_section_id=builder.parent_section_id,
        title=builder.title,
        markdown=builder.markdown,
        level=builder.level,
        order=builder.order,
        heading_type=builder.heading_type,
        numbering=builder.numbering,
        start_line=builder.start_line,
        end_line=max(end_line, min(builder.start_line, document_end_line)),
        chunks=chunks,
    )
