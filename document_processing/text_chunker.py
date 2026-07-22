import re
from math import ceil
from dataclasses import dataclass

from document_processing.config import DEFAULT_CHUNK_MAX_WORDS
from document_processing.tokenizer import tokenize


SENTENCE_BREAK_PATTERN = re.compile(r"(?<=[.!?])\s+")


@dataclass(frozen=True)
class ChunkPiece:
    text: str
    markdown: str
    word_count: int
    chunk_type: str


def split_text_into_chunks(
    text: str,
    max_words: int = DEFAULT_CHUNK_MAX_WORDS,
    markdown: str | None = None,
) -> list[ChunkPiece]:
    cleaned = _clean_plain_text(text)
    markdown_text = _clean_markdown(markdown if markdown is not None else text)
    if not cleaned and not markdown_text:
        return []
    if max_words < 1:
        raise ValueError("max_words must be greater than 0")

    text_for_analysis = cleaned or _clean_plain_text(markdown_text)
    word_count = count_words(text_for_analysis)
    chunk_type = _detect_markdown_chunk_type(markdown_text)
    if word_count <= max_words or _should_keep_markdown_together(markdown_text):
        return [
            ChunkPiece(
                text=text_for_analysis,
                markdown=markdown_text or text_for_analysis,
                word_count=word_count,
                chunk_type=chunk_type,
            )
        ]

    chunks = _split_by_sentences(text_for_analysis, max_words)
    if not chunks:
        chunks = _split_by_words(text_for_analysis, max_words)

    chunks = _balance_small_tail(chunks, max_words)

    return [
        ChunkPiece(
            text=chunk,
            markdown=chunk,
            word_count=count_words(chunk),
            chunk_type="split_paragraph",
        )
        for chunk in chunks
    ]


def count_words(text: str) -> int:
    return len(tokenize(text))


def _clean_plain_text(text: str) -> str:
    return " ".join(str(text or "").split())


def _clean_markdown(markdown: str | None) -> str:
    return str(markdown or "").replace("\r\n", "\n").replace("\r", "\n").strip("\n")


def _should_keep_markdown_together(markdown: str) -> bool:
    return (
        _contains_fenced_code(markdown)
        or _contains_block_math(markdown)
        or _contains_markdown_table(markdown)
        or _contains_list_block(markdown)
        or _contains_blockquote(markdown)
        or _contains_horizontal_rule(markdown)
    )


def _detect_markdown_chunk_type(markdown: str) -> str:
    if _contains_fenced_code(markdown):
        return "code"
    if _contains_markdown_table(markdown):
        return "table"
    if _contains_block_math(markdown):
        return "formula"
    return "paragraph"


def _contains_fenced_code(markdown: str) -> bool:
    return any(line.strip().startswith("```") for line in markdown.splitlines())


def _contains_block_math(markdown: str) -> bool:
    return sum(1 for line in markdown.splitlines() if line.strip() == "$$") >= 2


def _contains_markdown_table(markdown: str) -> bool:
    lines = markdown.splitlines()
    return any(
        _is_table_row(lines[index]) and _is_table_divider(lines[index + 1])
        for index in range(0, max(len(lines) - 1, 0))
    )


def _is_table_row(line: str) -> bool:
    return "|" in line and len(_split_table_row(line)) > 1


def _is_table_divider(line: str) -> bool:
    cells = _split_table_row(line)
    return len(cells) > 1 and all(
        re.fullmatch(r":?-{3,}:?", cell.strip()) is not None
        for cell in cells
    )


def _split_table_row(line: str) -> list[str]:
    return line.strip().removeprefix("|").removesuffix("|").split("|")


def _contains_list_block(markdown: str) -> bool:
    return any(
        re.match(r"^\s*(?:[-*+]\s+|\d+\.\s+)", line)
        for line in markdown.splitlines()
    )


def _contains_blockquote(markdown: str) -> bool:
    return any(line.lstrip().startswith(">") for line in markdown.splitlines())


def _contains_horizontal_rule(markdown: str) -> bool:
    return any(
        re.fullmatch(r"\s*([-*_])(?:\s*\1){2,}\s*", line) is not None
        for line in markdown.splitlines()
    )


def _split_by_sentences(text: str, max_words: int) -> list[str]:
    sentences = [
        sentence.strip()
        for sentence in SENTENCE_BREAK_PATTERN.split(text)
        if sentence.strip()
    ]
    if len(sentences) <= 1:
        return []

    sentence_word_counts = [count_words(sentence) for sentence in sentences]
    total_words = sum(sentence_word_counts)
    chunk_count = ceil(total_words / max_words)
    target_words = ceil(total_words / chunk_count)
    chunks: list[str] = []
    current: list[str] = []
    current_words = 0

    for sentence, sentence_words in zip(sentences, sentence_word_counts):
        if sentence_words > max_words:
            if current:
                chunks.append(" ".join(current))
                current = []
                current_words = 0
            chunks.extend(_split_by_words(sentence, max_words))
            continue

        would_exceed = current_words + sentence_words > target_words
        if current and would_exceed:
            chunks.append(" ".join(current))
            current = [sentence]
            current_words = sentence_words
        else:
            current.append(sentence)
            current_words += sentence_words

    if current:
        chunks.append(" ".join(current))

    return chunks


def _split_by_words(text: str, max_words: int) -> list[str]:
    words = text.split()
    if len(words) <= max_words:
        return [text]

    chunk_count = ceil(len(words) / max_words)
    target_size = ceil(len(words) / chunk_count)
    return [
        " ".join(words[index : index + target_size])
        for index in range(0, len(words), target_size)
    ]


def _balance_small_tail(chunks: list[str], max_words: int) -> list[str]:
    if len(chunks) < 2:
        return chunks

    minimum_tail_words = max(12, min(40, max_words // 3))
    last_words = count_words(chunks[-1])
    previous_words = count_words(chunks[-2])
    if last_words >= minimum_tail_words:
        return chunks

    merged_words = previous_words + last_words
    if merged_words <= int(max_words * 1.15):
        return [
            *chunks[:-2],
            f"{chunks[-2]} {chunks[-1]}",
        ]

    return chunks
