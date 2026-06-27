from collections import Counter, defaultdict
from dataclasses import dataclass
from hashlib import sha256

from document_processing.config import (
    DEFAULT_MAX_CONCEPTS_PER_CHUNK,
    DEFAULT_MAX_CONCEPTS_PER_DOCUMENT,
    DEFAULT_MIN_CONCEPT_SCORE,
)
from document_processing.models import (
    Concept,
    ConceptExtractionResult,
    ConceptMention,
    DocumentSection,
    StructuralAnalysis,
)
from document_processing.ngram_generator import generate_candidate_terms
from document_processing.tfidf import compute_document_frequencies, compute_tfidf_scores


EXTRACTION_METHOD = "tfidf_frequency_ngram"


@dataclass(frozen=True)
class ChunkConceptSource:
    section_id: str | None
    context_titles: tuple[str, ...]
    chunk_id: str
    text: str


def extract_concepts(
    structure: StructuralAnalysis,
    max_concepts: int = DEFAULT_MAX_CONCEPTS_PER_DOCUMENT,
    max_concepts_per_chunk: int = DEFAULT_MAX_CONCEPTS_PER_CHUNK,
    min_score: float = DEFAULT_MIN_CONCEPT_SCORE,
) -> ConceptExtractionResult:
    chunk_sources = _collect_chunk_sources(structure)
    term_counts_by_chunk = [_build_chunk_term_counts(source) for source in chunk_sources]
    tfidf_by_chunk = compute_tfidf_scores(term_counts_by_chunk)
    document_frequencies = compute_document_frequencies(term_counts_by_chunk)

    aggregate_frequency: Counter[str] = Counter()
    aggregate_score: defaultdict[str, float] = defaultdict(float)
    section_ids_by_term: defaultdict[str, set[str]] = defaultdict(set)
    chunk_ids_by_term: defaultdict[str, set[str]] = defaultdict(set)

    for source, term_counts, tfidf_scores in zip(
        chunk_sources,
        term_counts_by_chunk,
        tfidf_by_chunk,
    ):
        for term, count in term_counts.items():
            aggregate_frequency[term] += count
            aggregate_score[term] += tfidf_scores.get(term, 0) * (1 + count)
            chunk_ids_by_term[term].add(source.chunk_id)
            if source.section_id:
                section_ids_by_term[term].add(source.section_id)

    ranked_terms = sorted(
        (
            (term, score)
            for term, score in aggregate_score.items()
            if score >= min_score
            and _passes_candidate_quality(
                term,
                aggregate_frequency[term],
                document_frequencies[term],
            )
        ),
        key=lambda item: (-item[1], item[0]),
    )[:max_concepts]

    concepts = [
        Concept(
            concept_id=_build_concept_id(term),
            name=term,
            normalized_name=term,
            score=round(score, 6),
            frequency=aggregate_frequency[term],
            document_frequency=document_frequencies[term],
            section_frequency=len(section_ids_by_term[term]),
            chunk_frequency=len(chunk_ids_by_term[term]),
            extraction_method=EXTRACTION_METHOD,
        )
        for term, score in ranked_terms
    ]
    selected_terms = {concept.normalized_name for concept in concepts}
    mentions = _build_mentions(
        chunk_sources,
        term_counts_by_chunk,
        tfidf_by_chunk,
        selected_terms,
        max_concepts_per_chunk,
    )

    return ConceptExtractionResult(
        concepts=concepts,
        mentions=mentions,
        concept_count=len(concepts),
        mention_count=len(mentions),
        extraction_methods=[EXTRACTION_METHOD],
    )


def _collect_chunk_sources(structure: StructuralAnalysis) -> list[ChunkConceptSource]:
    chunk_sources: list[ChunkConceptSource] = []
    sections_by_id = {section.section_id: section for section in structure.sections}

    for section in structure.sections:
        context_titles = _build_section_context_titles(section.section_id, sections_by_id)
        for chunk in section.chunks:
            chunk_sources.append(
                ChunkConceptSource(
                    section_id=section.section_id,
                    context_titles=context_titles,
                    chunk_id=chunk.chunk_id,
                    text=chunk.text,
                )
            )

    for chunk in structure.orphan_chunks:
        chunk_sources.append(
            ChunkConceptSource(
                section_id=None,
                context_titles=(),
                chunk_id=chunk.chunk_id,
                text=chunk.text,
            )
        )

    return sorted(chunk_sources, key=lambda source: source.chunk_id)


def _build_mentions(
    chunk_sources: list[ChunkConceptSource],
    term_counts_by_chunk: list[Counter[str]],
    tfidf_by_chunk: list[dict[str, float]],
    selected_terms: set[str],
    max_concepts_per_chunk: int,
) -> list[ConceptMention]:
    mentions: list[ConceptMention] = []

    for source, term_counts, tfidf_scores in zip(
        chunk_sources,
        term_counts_by_chunk,
        tfidf_by_chunk,
    ):
        ranked_terms = sorted(
            (
                (term, tfidf_scores.get(term, 0))
                for term in term_counts
                if term in selected_terms
            ),
            key=lambda item: (-item[1], item[0]),
        )[:max_concepts_per_chunk]

        for term, score in ranked_terms:
            concept_id = _build_concept_id(term)
            mentions.append(
                ConceptMention(
                    mention_id=_build_mention_id(concept_id, source.chunk_id),
                    concept_id=concept_id,
                    normalized_name=term,
                    text=term,
                    section_id=source.section_id,
                    chunk_id=source.chunk_id,
                    score=round(score, 6),
                    occurrence_count=term_counts[term],
                    extraction_method=EXTRACTION_METHOD,
                )
            )

    return mentions


def _build_chunk_term_counts(source: ChunkConceptSource) -> Counter[str]:
    term_counts = generate_candidate_terms(source.text)
    for title in source.context_titles:
        term_counts.update(generate_candidate_terms(title))
    return term_counts


def _passes_candidate_quality(
    term: str,
    frequency: int,
    document_frequency: int,
) -> bool:
    token_count = len(term.split())
    if token_count >= 2 and frequency < 2 and document_frequency < 2:
        return False
    return True


def _build_section_context_titles(
    section_id: str,
    sections_by_id: dict[str, DocumentSection],
) -> tuple[str, ...]:
    titles: list[str] = []
    current = sections_by_id.get(section_id)
    while current:
        titles.append(current.title)
        parent_id = current.parent_section_id
        current = sections_by_id.get(parent_id) if parent_id else None
    return tuple(reversed(titles))


def _build_concept_id(normalized_name: str) -> str:
    digest = sha256(normalized_name.encode("utf-8")).hexdigest()[:12]
    return f"concept-{digest}"


def _build_mention_id(concept_id: str, chunk_id: str) -> str:
    digest = sha256(f"{concept_id}:{chunk_id}".encode("utf-8")).hexdigest()[:12]
    return f"mention-{digest}"
