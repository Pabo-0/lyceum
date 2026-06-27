import re
import unicodedata

from document_processing.stopwords import DOMAIN_GENERIC_TERMS, STOPWORDS
from document_processing.tokenizer import tokenize


PUNCTUATION_PATTERN = re.compile(r"[^\w\s-]", re.UNICODE)
WHITESPACE_PATTERN = re.compile(r"\s+")


def normalize_term(term: str) -> str:
    normalized = strip_accents(term.lower())
    normalized = PUNCTUATION_PATTERN.sub(" ", normalized)
    normalized = normalized.replace("_", " ")
    normalized = WHITESPACE_PATTERN.sub(" ", normalized).strip()
    normalized = trim_edge_stopwords(normalized)
    return normalized


def strip_accents(value: str) -> str:
    decomposed = unicodedata.normalize("NFKD", value)
    return "".join(character for character in decomposed if not unicodedata.combining(character))


def trim_edge_stopwords(term: str) -> str:
    tokens = term.split()
    while tokens and tokens[0] in STOPWORDS:
        tokens.pop(0)
    while tokens and tokens[-1] in STOPWORDS:
        tokens.pop()
    return " ".join(tokens)


def is_valid_term(term: str) -> bool:
    tokens = term.split()
    if not tokens or len(tokens) > 3:
        return False
    if any(token.isdigit() for token in tokens):
        return False
    if all(token in STOPWORDS for token in tokens):
        return False
    if term in DOMAIN_GENERIC_TERMS:
        return False
    if len(tokens) == 1 and len(tokens[0]) < 3:
        return False
    if len(tokens) == 1 and tokens[0] in STOPWORDS:
        return False
    return any(token not in STOPWORDS for token in tokens)


def normalize_tokens(text: str) -> list[str]:
    normalized_text = strip_accents(text.lower())
    return [normalize_term(token) for token in tokenize(normalized_text)]
