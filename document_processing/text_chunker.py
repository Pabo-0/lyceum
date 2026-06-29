import re
from math import ceil
from dataclasses import dataclass

from document_processing.config import DEFAULT_CHUNK_MAX_WORDS
from document_processing.tokenizer import tokenize


SENTENCE_BREAK_PATTERN = re.compile(r"(?<=[.!?])\s+")


@dataclass(frozen=True)
class ChunkPiece:
    text: str
    word_count: int
    chunk_type: str


def split_text_into_chunks(
    text: str,
    max_words: int = DEFAULT_CHUNK_MAX_WORDS,
) -> list[ChunkPiece]:
    cleaned = " ".join(text.split())
    if not cleaned:
        return []
    if max_words < 1:
        raise ValueError("max_words must be greater than 0")

    word_count = count_words(cleaned)
    if word_count <= max_words:
        return [
            ChunkPiece(
                text=cleaned,
                word_count=word_count,
                chunk_type="paragraph",
            )
        ]

    chunks = _split_by_sentences(cleaned, max_words)
    if not chunks:
        chunks = _split_by_words(cleaned, max_words)

    chunks = _balance_small_tail(chunks, max_words)

    return [
        ChunkPiece(
            text=chunk,
            word_count=count_words(chunk),
            chunk_type="split_paragraph",
        )
        for chunk in chunks
    ]


def count_words(text: str) -> int:
    return len(tokenize(text))


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
