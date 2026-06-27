from collections import Counter
import math


def compute_document_frequencies(term_counts_by_document: list[Counter[str]]) -> Counter[str]:
    document_frequencies: Counter[str] = Counter()
    for term_counts in term_counts_by_document:
        for term in term_counts:
            document_frequencies[term] += 1
    return document_frequencies


def compute_idf(
    term_counts_by_document: list[Counter[str]],
) -> dict[str, float]:
    document_count = len(term_counts_by_document)
    document_frequencies = compute_document_frequencies(term_counts_by_document)

    return {
        term: math.log((1 + document_count) / (1 + document_frequency)) + 1
        for term, document_frequency in document_frequencies.items()
    }


def compute_tfidf_scores(
    term_counts_by_document: list[Counter[str]],
) -> list[dict[str, float]]:
    idf = compute_idf(term_counts_by_document)
    scores_by_document: list[dict[str, float]] = []

    for term_counts in term_counts_by_document:
        total_terms = sum(term_counts.values())
        if total_terms == 0:
            scores_by_document.append({})
            continue

        scores = {}
        for term, count in term_counts.items():
            tf = count / total_terms
            scores[term] = tf * idf[term] * _ngram_boost(term)
        scores_by_document.append(scores)

    return scores_by_document


def _ngram_boost(term: str) -> float:
    token_count = len(term.split())
    return 1 + (0.15 * max(token_count - 1, 0))
