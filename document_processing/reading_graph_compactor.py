from dataclasses import dataclass
from math import ceil

from document_processing.config import (
    DEFAULT_GRAPH_CHUNK_TARGET_WORDS,
    DEFAULT_GRAPH_MAX_SECTION_NODES,
)
from document_processing.models import DocumentSection, ParagraphChunk, StructuralAnalysis


@dataclass(frozen=True)
class ReadingGraphChunk:
    chunk_id: str
    text: str
    markdown: str
    order: int
    start_line: int
    end_line: int
    word_count: int
    character_count: int
    chunk_type: str
    source_chunk_ids: list[str]
    source_section_ids: list[str]
    source_section_titles: list[str]


@dataclass(frozen=True)
class ReadingGraphSection:
    section_id: str
    parent_section_id: str | None
    title: str
    markdown: str
    level: int
    order: int
    heading_type: str
    numbering: str | None
    start_line: int
    end_line: int
    source_section_ids: list[str]
    source_section_titles: list[str]
    compaction_method: str
    chunks: list[ReadingGraphChunk]


@dataclass(frozen=True)
class ReadingGraphStructure:
    sections: list[ReadingGraphSection]
    section_count: int
    chunk_count: int
    max_visible_sections: int
    compaction_method: str


def compact_structure_for_reading_graph(
    structure: StructuralAnalysis,
    document_title: str,
    document_word_count: int,
) -> ReadingGraphStructure:
    skipped_root_ids = _find_skippable_root_section_ids(document_title, structure)
    content_sections = [
        section
        for section in structure.sections
        if section.section_id not in skipped_root_ids
    ]
    max_visible_sections = _max_visible_sections(document_word_count)

    if not content_sections:
        sections = _build_orphan_content_section(structure, document_word_count)
        return _result(sections, max_visible_sections, "orphan_content")

    should_compact_sections = len(content_sections) > max_visible_sections
    if should_compact_sections:
        sections = _build_compacted_sections(
            content_sections,
            skipped_root_ids,
            max_visible_sections,
        )
        method = "section_budget_compaction"
    else:
        sections = _build_uncompacted_sections(content_sections, skipped_root_ids)
        method = "preserve_detected_sections"

    sections = _compact_chunks_in_sections(sections)
    return _result(sections, max_visible_sections, method)


def _build_uncompacted_sections(
    content_sections: list[DocumentSection],
    skipped_root_ids: set[str],
) -> list[ReadingGraphSection]:
    visible_ids = {section.section_id for section in content_sections}
    sections: list[ReadingGraphSection] = []

    for section in content_sections:
        parent_id = section.parent_section_id
        if parent_id in skipped_root_ids or parent_id not in visible_ids:
            parent_id = None
        chunks = [
            _source_chunk_to_reading_chunk(
                chunk,
                order=chunk.order,
                section=section,
                chunk_id=chunk.chunk_id,
            )
            for chunk in section.chunks
        ]
        sections.append(
            ReadingGraphSection(
                section_id=section.section_id,
                parent_section_id=parent_id,
                title=section.title,
                markdown=section.markdown or section.title,
                level=section.level,
                order=section.order,
                heading_type=section.heading_type,
                numbering=section.numbering,
                start_line=section.start_line,
                end_line=section.end_line,
                source_section_ids=[section.section_id],
                source_section_titles=[section.title],
                compaction_method="preserved_section",
                chunks=chunks,
            )
        )

    return sections


def _build_compacted_sections(
    content_sections: list[DocumentSection],
    skipped_root_ids: set[str],
    max_visible_sections: int,
) -> list[ReadingGraphSection]:
    sections_by_id = {
        section.section_id: section
        for section in content_sections
    }
    top_sections = [
        section
        for section in content_sections
        if _nearest_visible_ancestor(section, sections_by_id, skipped_root_ids) is None
    ]

    if not top_sections:
        top_sections = content_sections[:max_visible_sections]

    source_groups = _group_adjacent_sections(top_sections, max_visible_sections)
    compacted_sections: list[ReadingGraphSection] = []

    for order, group in enumerate(source_groups, start=1):
        source_sections = _collect_sections_for_group(group, sections_by_id)
        source_ids = [section.section_id for section in source_sections]
        source_titles = [section.title for section in source_sections]
        chunks = _collect_chunks(source_sections)
        title = _group_title(group, order)
        compacted_sections.append(
            ReadingGraphSection(
                section_id=f"graph-section-{order}",
                parent_section_id=None,
                title=title,
                markdown=_markdown_heading(title, 1),
                level=1,
                order=order,
                heading_type="compacted",
                numbering=None,
                start_line=min(section.start_line for section in source_sections),
                end_line=max(section.end_line for section in source_sections),
                source_section_ids=source_ids,
                source_section_titles=source_titles,
                compaction_method="merged_adjacent_sections",
                chunks=[
                    _source_chunk_to_reading_chunk(
                        chunk,
                        order=chunk.order,
                        section=_section_for_chunk(chunk, source_sections),
                        chunk_id=chunk.chunk_id,
                    )
                    for chunk in chunks
                ],
            )
        )

    return compacted_sections


def _compact_chunks_in_sections(
    sections: list[ReadingGraphSection],
) -> list[ReadingGraphSection]:
    next_chunk_order = 0
    compacted_sections: list[ReadingGraphSection] = []

    for section in sections:
        compacted_chunks = _merge_chunks(section.chunks)
        numbered_chunks: list[ReadingGraphChunk] = []
        for chunk in compacted_chunks:
            next_chunk_order += 1
            numbered_chunks.append(
                ReadingGraphChunk(
                    chunk_id=f"graph-chunk-{next_chunk_order}",
                    text=chunk.text,
                    markdown=chunk.markdown,
                    order=next_chunk_order,
                    start_line=chunk.start_line,
                    end_line=chunk.end_line,
                    word_count=chunk.word_count,
                    character_count=chunk.character_count,
                    chunk_type=chunk.chunk_type,
                    source_chunk_ids=chunk.source_chunk_ids,
                    source_section_ids=chunk.source_section_ids,
                    source_section_titles=chunk.source_section_titles,
                )
            )
        compacted_sections.append(
            ReadingGraphSection(
                section_id=section.section_id,
                parent_section_id=section.parent_section_id,
                title=section.title,
                markdown=section.markdown,
                level=section.level,
                order=section.order,
                heading_type=section.heading_type,
                numbering=section.numbering,
                start_line=section.start_line,
                end_line=section.end_line,
                source_section_ids=section.source_section_ids,
                source_section_titles=section.source_section_titles,
                compaction_method=section.compaction_method,
                chunks=numbered_chunks,
            )
        )

    return compacted_sections


def _merge_chunks(chunks: list[ReadingGraphChunk]) -> list[ReadingGraphChunk]:
    if len(chunks) <= 1:
        return chunks

    merged: list[ReadingGraphChunk] = []
    current: list[ReadingGraphChunk] = []
    current_words = 0

    for chunk in chunks:
        would_exceed = current_words + chunk.word_count > DEFAULT_GRAPH_CHUNK_TARGET_WORDS
        if current and would_exceed and current_words >= DEFAULT_GRAPH_CHUNK_TARGET_WORDS * 0.55:
            merged.append(_join_chunks(current))
            current = [chunk]
            current_words = chunk.word_count
            continue
        current.append(chunk)
        current_words += chunk.word_count

    if current:
        merged.append(_join_chunks(current))

    return _balance_small_tail(merged)


def _balance_small_tail(chunks: list[ReadingGraphChunk]) -> list[ReadingGraphChunk]:
    if len(chunks) < 2:
        return chunks

    last = chunks[-1]
    previous = chunks[-2]
    minimum_tail_words = max(70, DEFAULT_GRAPH_CHUNK_TARGET_WORDS // 3)
    if last.word_count >= minimum_tail_words:
        return chunks
    if previous.word_count + last.word_count <= int(DEFAULT_GRAPH_CHUNK_TARGET_WORDS * 1.25):
        return [
            *chunks[:-2],
            _join_chunks([previous, last]),
        ]
    return chunks


def _join_chunks(chunks: list[ReadingGraphChunk]) -> ReadingGraphChunk:
    text = "\n\n".join(chunk.text for chunk in chunks if chunk.text)
    markdown = "\n\n".join(
        chunk.markdown or chunk.text
        for chunk in chunks
        if chunk.markdown or chunk.text
    )
    source_chunk_ids: list[str] = []
    source_section_ids: list[str] = []
    source_section_titles: list[str] = []

    for chunk in chunks:
        source_chunk_ids.extend(chunk.source_chunk_ids)
        source_section_ids.extend(chunk.source_section_ids)
        source_section_titles.extend(chunk.source_section_titles)

    return ReadingGraphChunk(
        chunk_id=chunks[0].chunk_id,
        text=text,
        markdown=markdown,
        order=chunks[0].order,
        start_line=min(chunk.start_line for chunk in chunks),
        end_line=max(chunk.end_line for chunk in chunks),
        word_count=sum(chunk.word_count for chunk in chunks),
        character_count=len(markdown or text),
        chunk_type=(
            "merged_paragraphs"
            if len(source_chunk_ids) > 1
            else chunks[0].chunk_type
        ),
        source_chunk_ids=_unique(source_chunk_ids),
        source_section_ids=_unique(source_section_ids),
        source_section_titles=_unique(source_section_titles),
    )


def _source_chunk_to_reading_chunk(
    chunk: ParagraphChunk,
    order: int,
    section: DocumentSection,
    chunk_id: str,
) -> ReadingGraphChunk:
    return ReadingGraphChunk(
        chunk_id=chunk_id,
        text=chunk.text,
        markdown=chunk.markdown or chunk.text,
        order=order,
        start_line=chunk.start_line,
        end_line=chunk.end_line,
        word_count=chunk.word_count,
        character_count=chunk.character_count,
        chunk_type=chunk.chunk_type,
        source_chunk_ids=[chunk.chunk_id],
        source_section_ids=[section.section_id],
        source_section_titles=[section.title],
    )


def _build_orphan_content_section(
    structure: StructuralAnalysis,
    document_word_count: int,
) -> list[ReadingGraphSection]:
    chunks = [
        ReadingGraphChunk(
            chunk_id=chunk.chunk_id,
            text=chunk.text,
            markdown=chunk.markdown or chunk.text,
            order=chunk.order,
            start_line=chunk.start_line,
            end_line=chunk.end_line,
            word_count=chunk.word_count,
            character_count=chunk.character_count,
            chunk_type=chunk.chunk_type,
            source_chunk_ids=[chunk.chunk_id],
            source_section_ids=[],
            source_section_titles=[],
        )
        for chunk in structure.orphan_chunks
    ]
    return [
        ReadingGraphSection(
            section_id="graph-section-1",
            parent_section_id=None,
            title="Contenido principal",
            markdown="Contenido principal",
            level=1,
            order=1,
            heading_type="synthetic",
            numbering=None,
            start_line=1,
            end_line=max((chunk.end_line for chunk in chunks), default=1),
            source_section_ids=[],
            source_section_titles=[],
            compaction_method=f"orphan_content_{document_word_count}_words",
            chunks=chunks,
        )
    ]


def _max_visible_sections(document_word_count: int) -> int:
    budget = ceil(max(document_word_count, 1) / 550) + 1
    return max(2, min(DEFAULT_GRAPH_MAX_SECTION_NODES, budget))


def _nearest_visible_ancestor(
    section: DocumentSection,
    sections_by_id: dict[str, DocumentSection],
    skipped_root_ids: set[str],
) -> DocumentSection | None:
    parent_id = section.parent_section_id
    while parent_id:
        if parent_id in skipped_root_ids:
            return None
        parent = sections_by_id.get(parent_id)
        if not parent:
            return None
        return parent
    return None


def _group_adjacent_sections(
    sections: list[DocumentSection],
    max_groups: int,
) -> list[list[DocumentSection]]:
    if len(sections) <= max_groups:
        return [[section] for section in sections]

    group_count = max(1, max_groups)
    group_size = ceil(len(sections) / group_count)
    return [
        sections[index : index + group_size]
        for index in range(0, len(sections), group_size)
    ]


def _collect_sections_for_group(
    group: list[DocumentSection],
    sections_by_id: dict[str, DocumentSection],
) -> list[DocumentSection]:
    group_ids = {section.section_id for section in group}
    collected = [
        section
        for section in sections_by_id.values()
        if section.section_id in group_ids
        or _has_ancestor_in(section, group_ids, sections_by_id)
    ]
    return sorted(collected, key=lambda section: section.order)


def _has_ancestor_in(
    section: DocumentSection,
    ancestor_ids: set[str],
    sections_by_id: dict[str, DocumentSection],
) -> bool:
    parent_id = section.parent_section_id
    while parent_id:
        if parent_id in ancestor_ids:
            return True
        parent = sections_by_id.get(parent_id)
        parent_id = parent.parent_section_id if parent else None
    return False


def _collect_chunks(sections: list[DocumentSection]) -> list[ParagraphChunk]:
    chunks: list[ParagraphChunk] = []
    for section in sections:
        chunks.extend(section.chunks)
    return sorted(chunks, key=lambda chunk: chunk.order)


def _section_for_chunk(
    chunk: ParagraphChunk,
    sections: list[DocumentSection],
) -> DocumentSection:
    sections_by_id = {
        section.section_id: section
        for section in sections
    }
    if chunk.parent_section_id and chunk.parent_section_id in sections_by_id:
        return sections_by_id[chunk.parent_section_id]
    return sections[0]


def _group_title(group: list[DocumentSection], order: int) -> str:
    if len(group) == 1:
        return group[0].title
    first = _clean_numbering(group[0].title)
    last = _clean_numbering(group[-1].title)
    return f"Bloque {order}: {first} - {last}"


def _markdown_heading(title: str, level: int) -> str:
    heading_level = max(1, min(level, 6))
    return f"{'#' * heading_level} {title}"


def _clean_numbering(title: str) -> str:
    parts = title.split(maxsplit=1)
    if parts and parts[0].rstrip(".").replace(".", "").isdigit() and len(parts) > 1:
        return parts[1]
    return title


def _find_skippable_root_section_ids(
    document_title: str,
    structure: StructuralAnalysis,
) -> set[str]:
    normalized_document_title = _normalize_title(document_title)
    return {
        section.section_id
        for section in structure.sections
        if (
            section.level == 1
            and section.parent_section_id is None
            and not section.chunks
            and _normalize_title(section.title) == normalized_document_title
        )
    }


def _normalize_title(title: str) -> str:
    return " ".join(title.strip().lower().split())


def _unique(values: list[str]) -> list[str]:
    seen: set[str] = set()
    unique_values: list[str] = []
    for value in values:
        if value in seen:
            continue
        seen.add(value)
        unique_values.append(value)
    return unique_values


def _result(
    sections: list[ReadingGraphSection],
    max_visible_sections: int,
    method: str,
) -> ReadingGraphStructure:
    return ReadingGraphStructure(
        sections=sections,
        section_count=len(sections),
        chunk_count=sum(len(section.chunks) for section in sections),
        max_visible_sections=max_visible_sections,
        compaction_method=method,
    )
