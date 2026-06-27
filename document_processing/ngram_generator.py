from collections import Counter

from document_processing.config import DEFAULT_CONCEPT_NGRAM_RANGE
from document_processing.term_normalizer import is_valid_term, normalize_term, normalize_tokens


def generate_candidate_terms(
    text: str,
    ngram_range: tuple[int, int] = DEFAULT_CONCEPT_NGRAM_RANGE,
) -> Counter[str]:
    min_n, max_n = ngram_range
    if min_n < 1 or max_n < min_n:
        raise ValueError("ngram_range must be a valid positive range")

    tokens = [token for token in normalize_tokens(text) if token]
    candidates: Counter[str] = Counter()

    for ngram_size in range(min_n, max_n + 1):
        if len(tokens) < ngram_size:
            continue
        for index in range(0, len(tokens) - ngram_size + 1):
            raw_term = " ".join(tokens[index : index + ngram_size])
            term = normalize_term(raw_term)
            if is_valid_term(term):
                candidates[term] += 1

    return candidates
