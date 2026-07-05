from collections import defaultdict
from dataclasses import dataclass
import re

from document_processing.models import (
    ConceptDeduplicationResult,
    DocumentSection,
    ParagraphChunk,
    StructuralAnalysis,
)
from document_processing.ngram_generator import generate_candidate_terms
from document_processing.stopwords import STOPWORDS
from document_processing.term_normalizer import is_valid_term, normalize_term, normalize_tokens
from document_processing.tokenizer import tokenize


TITLE_WEAK_TOKENS = {
    "acciones",
    "actividad",
    "actividades",
    "avanzar",
    "ayuda",
    "ayudan",
    "comienza",
    "coinciden",
    "durante",
    "estudiante",
    "estudiantes",
    "incluye",
    "observa",
    "ocurre",
    "permite",
    "puede",
    "pueden",
    "realmente",
    "si",
}
TITLE_LINK_NOUNS = {
    "aprendizaje",
    "analisis",
    "conceptos",
    "estudio",
    "lectura",
    "practica",
    "progreso",
    "texto",
}
LEADING_NUMBERING_PATTERN = re.compile(r"^\s*\d+(?:\.\d+)*\.?\s*")


@dataclass(frozen=True)
class ChunkTitle:
    title: str
    source: str
    reason: str
    candidates: list[str]


@dataclass(frozen=True)
class _Candidate:
    term: str
    display: str
    score: float
    source: str


@dataclass(frozen=True)
class _SectionTitle:
    title: str


def build_chunk_titles(
    structure: StructuralAnalysis,
    concept_deduplication: ConceptDeduplicationResult,
) -> dict[str, ChunkTitle]:
    """Select one compact, user-facing title for each chunk.

    Concepts are used only as naming hints. They are not added as graph nodes.
    """
    concepts_by_id = {
        concept.concept_id: concept
        for concept in concept_deduplication.concepts
    }
    mentions_by_chunk = _group_mentions_by_chunk(concept_deduplication)
    used_terms: set[str] = set()
    titles: dict[str, ChunkTitle] = {}

    for section in structure.sections:
        section_terms = {
            normalize_term(section.title),
            *generate_candidate_terms(section.title).keys(),
        }
        for chunk in section.chunks:
            title = _build_title_for_chunk(
                chunk=chunk,
                section=section,
                concepts_by_id=concepts_by_id,
                mentions=mentions_by_chunk.get(chunk.chunk_id, []),
                used_terms=used_terms,
                section_terms=section_terms,
            )
            titles[chunk.chunk_id] = title
            used_terms.add(normalize_term(title.title))

    for chunk in structure.orphan_chunks:
        title = _build_title_for_chunk(
            chunk=chunk,
            section=None,
            concepts_by_id=concepts_by_id,
            mentions=mentions_by_chunk.get(chunk.chunk_id, []),
            used_terms=used_terms,
            section_terms=set(),
        )
        titles[chunk.chunk_id] = title
        used_terms.add(normalize_term(title.title))

    return titles


def build_chunk_title_from_text(
    text: str,
    section_title: str | None = None,
    used_terms: set[str] | None = None,
) -> ChunkTitle:
    used = used_terms or set()
    section_terms = (
        {normalize_term(section_title), *generate_candidate_terms(section_title).keys()}
        if section_title
        else set()
    )
    candidates = _dedupe_candidates(_local_candidates(text))
    preferred = _choose_candidate(candidates, used, section_terms)
    candidate_terms = [candidate.display for candidate in candidates[:5]]

    if preferred:
        return ChunkTitle(
            title=_format_candidate_title(
                preferred.display,
                _SectionTitle(section_title) if section_title else None,
            ),
            source=preferred.source,
            reason="Selected as the clearest cue for this compact reading chunk.",
            candidates=candidate_terms,
        )

    fallback = _fallback_title_from_text(text, section_title)
    return ChunkTitle(
        title=fallback,
        source="text_fallback",
        reason="No unique candidate survived deduplication; using a short text cue.",
        candidates=candidate_terms,
    )


def _group_mentions_by_chunk(
    concept_deduplication: ConceptDeduplicationResult,
) -> dict[str, list]:
    mentions_by_chunk: defaultdict[str, list] = defaultdict(list)
    for mention in concept_deduplication.mentions:
        mentions_by_chunk[mention.chunk_id].append(mention)
    return mentions_by_chunk


def _build_title_for_chunk(
    chunk: ParagraphChunk,
    section: DocumentSection | None,
    concepts_by_id: dict,
    mentions: list,
    used_terms: set[str],
    section_terms: set[str],
) -> ChunkTitle:
    candidates = _dedupe_candidates(
        [
            *_concept_candidates(mentions, concepts_by_id),
            *_local_candidates(chunk.text),
        ]
    )
    preferred = _choose_candidate(candidates, used_terms, section_terms)
    candidate_terms = [candidate.display for candidate in candidates[:5]]

    if preferred:
        return ChunkTitle(
            title=_format_candidate_title(preferred.display, section),
            source=preferred.source,
            reason=_candidate_reason(preferred, chunk),
            candidates=candidate_terms,
        )

    fallback = _fallback_title_from_text(chunk.text, section.title if section else None)
    return ChunkTitle(
        title=fallback,
        source="text_fallback",
        reason="No unique candidate survived deduplication; using a short text cue.",
        candidates=candidate_terms,
    )


def _concept_candidates(mentions: list, concepts_by_id: dict) -> list[_Candidate]:
    candidates: list[_Candidate] = []
    for mention in mentions:
        concept = concepts_by_id.get(mention.concept_id)
        term = normalize_term(mention.text)
        if not term or not is_valid_term(term):
            continue

        concept_score = concept.score if concept else 0
        chunk_penalty = (concept.chunk_frequency if concept else 1) * 0.03
        score = (
            mention.score
            + concept_score * 0.08
            + mention.occurrence_count * 0.04
            + len(term.split()) * 0.12
            - chunk_penalty
        )
        candidates.append(
            _Candidate(
                term=term,
                display=concept.display_name if concept else term,
                score=score,
                source="concept_hint",
            )
        )
    return candidates


def _local_candidates(text: str) -> list[_Candidate]:
    term_counts, first_positions = _title_term_counts(text)
    candidates: list[_Candidate] = []
    for term, count in term_counts.items():
        token_count = len(term.split())
        position_boost = 0.7 / (1 + first_positions[term])
        if token_count == 1:
            score = min(count, 2) * 0.3 + position_boost
        elif token_count == 2:
            score = count + 0.8 + position_boost
        else:
            score = count + 1.1 + position_boost
        candidates.append(
            _Candidate(
                term=term,
                display=term,
                score=score,
                source="local_ngram",
            )
        )
    return candidates


def _title_term_counts(text: str) -> tuple[dict[str, int], dict[str, int]]:
    tokens = [token for token in normalize_tokens(text) if token]
    counts: defaultdict[str, int] = defaultdict(int)
    first_positions: dict[str, int] = {}

    for size in (1, 2, 3):
        if len(tokens) < size:
            continue
        for index in range(0, len(tokens) - size + 1):
            term = normalize_term(" ".join(tokens[index : index + size]))
            if not is_valid_term(term):
                continue
            if _has_weak_title_token(term):
                continue
            counts[term] += 1
            first_positions.setdefault(term, index)

    return dict(counts), first_positions


def _dedupe_candidates(candidates: list[_Candidate]) -> list[_Candidate]:
    selected: list[_Candidate] = []
    sorted_candidates = sorted(
        candidates,
        key=lambda candidate: (
            -candidate.score,
            -len(candidate.term.split()),
            candidate.term,
        ),
    )

    for candidate in sorted_candidates:
        if not candidate.term or not is_valid_term(candidate.term):
            continue
        if any(_terms_are_too_close(candidate.term, existing.term) for existing in selected):
            continue
        selected.append(candidate)

    return selected


def _choose_candidate(
    candidates: list[_Candidate],
    used_terms: set[str],
    section_terms: set[str],
) -> _Candidate | None:
    for candidate in candidates:
        if _matches_any(candidate.term, used_terms):
            continue
        if normalize_term(candidate.term) in section_terms and len(candidates) > 1:
            continue
        return candidate

    for candidate in candidates:
        if not _matches_any(candidate.term, used_terms):
            return candidate

    return None


def _matches_any(term: str, others: set[str]) -> bool:
    return any(_terms_are_too_close(term, other) for other in others if other)


def _terms_are_too_close(left: str, right: str) -> bool:
    left_tokens = set(normalize_term(left).split())
    right_tokens = set(normalize_term(right).split())
    if not left_tokens or not right_tokens:
        return False
    if left_tokens == right_tokens:
        return True
    shorter, longer = sorted([left_tokens, right_tokens], key=len)
    if len(shorter) == 1 and shorter.issubset(longer):
        return True
    overlap = len(left_tokens & right_tokens) / len(left_tokens | right_tokens)
    return overlap >= 0.67


def _candidate_reason(candidate: _Candidate, chunk: ParagraphChunk) -> str:
    if chunk.chunk_type == "split_paragraph":
        return (
            "Selected as the clearest local cue for a paragraph fragment created "
            "by the chunk size limit."
        )
    return "Selected as the clearest local cue for this paragraph."


def _fallback_title_from_text(text: str, section_title: str | None) -> str:
    tokens = [
        token
        for token in tokenize(text)
        if normalize_term(token) and normalize_term(token) not in STOPWORDS
    ][:4]
    if tokens:
        return _humanize_title(" ".join(tokens))
    if section_title:
        return f"{_humanize_title(section_title)} - fragmento"
    return "Fragmento de lectura"


def _format_candidate_title(value: str, section: DocumentSection | None) -> str:
    term = normalize_term(value)
    if section:
        section_term = normalize_term(_clean_section_title(section.title))
        term_tokens = term.split()
        section_tokens = section_term.split()
        if (
            len(section_tokens) == 1
            and len(term_tokens) >= 2
            and term_tokens[0] == section_tokens[0]
            and term_tokens[1] in TITLE_LINK_NOUNS
        ):
            return _humanize_title(f"{section_tokens[0]} del {' '.join(term_tokens[1:])}")
    return _humanize_title(term)


def _clean_section_title(title: str) -> str:
    return LEADING_NUMBERING_PATTERN.sub("", title).strip()


def _has_weak_title_token(term: str) -> bool:
    return any(token in TITLE_WEAK_TOKENS for token in term.split())


def _humanize_title(value: str) -> str:
    text = normalize_term(value)
    if not text:
        return "Fragmento de lectura"
    return text[0].upper() + text[1:]
