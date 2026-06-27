from collections import defaultdict
from dataclasses import dataclass
from hashlib import sha256

from document_processing.models import (
    CanonicalConcept,
    Concept,
    ConceptDeduplicationResult,
    ConceptExtractionResult,
    ConceptMention,
    NormalizedConceptMention,
)
from document_processing.stopwords import STOPWORDS
from document_processing.term_normalizer import is_valid_term, normalize_term


NORMALIZATION_METHOD = "lowercase_stopword_trim_simple_singular"
PREFIX_PATTERNS = (
    ("concepto", "de"),
    ("conceptos", "de"),
    ("idea", "de"),
    ("ideas", "de"),
    ("tema", "de"),
    ("temas", "de"),
)
SINGULAR_EXCEPTIONS = {
    "analisis",
    "hipotesis",
    "sintesis",
    "tesis",
}


@dataclass
class _ConceptGroup:
    canonical_name: str
    raw_concepts: list[Concept]
    mentions: list[ConceptMention]


def deduplicate_concepts(
    extraction: ConceptExtractionResult,
) -> ConceptDeduplicationResult:
    raw_concept_by_id = {
        concept.concept_id: concept
        for concept in extraction.concepts
    }
    groups: dict[str, _ConceptGroup] = {}
    raw_to_canonical: dict[str, str] = {}

    for concept in extraction.concepts:
        canonical_name = canonicalize_concept_name(concept.normalized_name)
        if not canonical_name:
            canonical_name = concept.normalized_name
        canonical_id = _build_canonical_concept_id(canonical_name)
        raw_to_canonical[concept.concept_id] = canonical_id
        if canonical_id not in groups:
            groups[canonical_id] = _ConceptGroup(
                canonical_name=canonical_name,
                raw_concepts=[],
                mentions=[],
            )
        groups[canonical_id].raw_concepts.append(concept)

    for mention in extraction.mentions:
        canonical_id = raw_to_canonical.get(mention.concept_id)
        if canonical_id and canonical_id in groups:
            groups[canonical_id].mentions.append(mention)

    canonical_concepts = [
        _build_canonical_concept(canonical_id, group)
        for canonical_id, group in groups.items()
    ]
    canonical_concepts.sort(key=lambda concept: (-concept.score, concept.canonical_name))

    normalized_mentions = _build_normalized_mentions(
        extraction.mentions,
        raw_to_canonical,
        raw_concept_by_id,
    )
    variant_count = sum(
        max(len(concept.variant_terms) - 1, 0)
        for concept in canonical_concepts
    )

    return ConceptDeduplicationResult(
        concepts=canonical_concepts,
        mentions=normalized_mentions,
        concept_count=len(canonical_concepts),
        mention_count=len(normalized_mentions),
        variant_count=variant_count,
        normalization_methods=[NORMALIZATION_METHOD],
    )


def canonicalize_concept_name(name: str) -> str:
    normalized = normalize_term(name)
    tokens = [token for token in normalized.split() if token not in STOPWORDS]
    tokens = _remove_generic_prefix(tokens)
    singular_tokens = [_simple_singularize(token) for token in tokens]
    canonical = " ".join(token for token in singular_tokens if token)
    if not canonical:
        return ""
    canonical = normalize_term(canonical)
    return canonical if is_valid_term(canonical) else ""


def _remove_generic_prefix(tokens: list[str]) -> list[str]:
    for prefix in PREFIX_PATTERNS:
        if tuple(tokens[: len(prefix)]) == prefix:
            return tokens[len(prefix) :]
    return tokens


def _simple_singularize(token: str) -> str:
    if token in SINGULAR_EXCEPTIONS:
        return token
    if token.endswith("ciones") and len(token) > 7:
        return f"{token[:-6]}cion"
    if token.endswith("ces") and len(token) > 5:
        return f"{token[:-3]}z"
    if token.endswith("es") and len(token) > 5:
        return token[:-2]
    if token.endswith("s") and len(token) > 4:
        return token[:-1]
    return token


def _build_canonical_concept(
    canonical_id: str,
    group: _ConceptGroup,
) -> CanonicalConcept:
    raw_concepts = group.raw_concepts
    mentions = group.mentions
    section_ids = {
        mention.section_id
        for mention in mentions
        if mention.section_id
    }
    chunk_ids = {mention.chunk_id for mention in mentions}
    raw_section_frequency = max(
        (concept.section_frequency for concept in raw_concepts),
        default=0,
    )
    raw_chunk_frequency = max(
        (concept.chunk_frequency for concept in raw_concepts),
        default=0,
    )
    variant_terms = sorted({concept.normalized_name for concept in raw_concepts})

    return CanonicalConcept(
        concept_id=canonical_id,
        canonical_name=group.canonical_name,
        display_name=_choose_display_name(raw_concepts, group.canonical_name),
        variant_terms=variant_terms,
        raw_concept_ids=sorted(concept.concept_id for concept in raw_concepts),
        score=round(sum(concept.score for concept in raw_concepts), 6),
        frequency=sum(concept.frequency for concept in raw_concepts),
        mention_count=len(mentions),
        section_frequency=max(len(section_ids), raw_section_frequency),
        chunk_frequency=max(len(chunk_ids), raw_chunk_frequency),
        normalization_method=NORMALIZATION_METHOD,
    )


def _build_normalized_mentions(
    mentions: list[ConceptMention],
    raw_to_canonical: dict[str, str],
    raw_concept_by_id: dict[str, Concept],
) -> list[NormalizedConceptMention]:
    normalized_mentions: list[NormalizedConceptMention] = []
    seen_keys: defaultdict[tuple[str, str], int] = defaultdict(int)

    for mention in mentions:
        canonical_id = raw_to_canonical.get(mention.concept_id)
        if not canonical_id:
            continue
        raw_concept = raw_concept_by_id.get(mention.concept_id)
        canonical_name = (
            canonicalize_concept_name(raw_concept.normalized_name)
            if raw_concept
            else mention.normalized_name
        )
        seen_keys[(canonical_id, mention.chunk_id)] += 1
        suffix = seen_keys[(canonical_id, mention.chunk_id)]

        normalized_mentions.append(
            NormalizedConceptMention(
                mention_id=_build_normalized_mention_id(
                    canonical_id,
                    mention.chunk_id,
                    suffix,
                ),
                concept_id=canonical_id,
                raw_concept_id=mention.concept_id,
                raw_normalized_name=mention.normalized_name,
                text=canonical_name,
                section_id=mention.section_id,
                chunk_id=mention.chunk_id,
                score=mention.score,
                occurrence_count=mention.occurrence_count,
                extraction_method=mention.extraction_method,
                normalization_method=NORMALIZATION_METHOD,
            )
        )

    return normalized_mentions


def _choose_display_name(raw_concepts: list[Concept], fallback: str) -> str:
    if not raw_concepts:
        return fallback
    best = sorted(
        raw_concepts,
        key=lambda concept: (-concept.score, len(concept.normalized_name), concept.normalized_name),
    )[0]
    return best.normalized_name


def _build_canonical_concept_id(canonical_name: str) -> str:
    digest = sha256(canonical_name.encode("utf-8")).hexdigest()[:12]
    return f"canonical-concept-{digest}"


def _build_normalized_mention_id(
    canonical_id: str,
    chunk_id: str,
    suffix: int,
) -> str:
    digest = sha256(f"{canonical_id}:{chunk_id}:{suffix}".encode("utf-8")).hexdigest()[:12]
    return f"canonical-mention-{digest}"
