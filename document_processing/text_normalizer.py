import re
import unicodedata

from document_processing.models import NormalizationReport
from document_processing.paragraph_splitter import split_paragraphs


CONTROL_CHARACTER_PATTERN = re.compile(r"[\x00-\x08\x0b\x0c\x0e-\x1f\x7f]")
HORIZONTAL_SPACE_PATTERN = re.compile(r"[ \t]+")
PARAGRAPH_BREAK_PATTERN = re.compile(r"\n\s*\n+")


def normalize_line_endings(content: str) -> str:
    return content.replace("\r\n", "\n").replace("\r", "\n")


def normalize_unicode(content: str) -> str:
    return unicodedata.normalize("NFKC", content)


def remove_problematic_characters(content: str) -> str:
    return CONTROL_CHARACTER_PATTERN.sub("", content)


def normalize_horizontal_spaces(content: str) -> str:
    lines = []
    for line in content.split("\n"):
        cleaned_line = HORIZONTAL_SPACE_PATTERN.sub(" ", line).strip()
        lines.append(cleaned_line)
    return "\n".join(lines)


def normalize_paragraph_breaks(content: str) -> str:
    compacted = PARAGRAPH_BREAK_PATTERN.sub("\n\n", content.strip())
    return f"{compacted}\n" if compacted else ""


def normalize_text(content: str) -> str:
    normalized = normalize_line_endings(content)
    normalized = normalize_unicode(normalized)
    normalized = remove_problematic_characters(normalized)
    normalized = normalize_horizontal_spaces(normalized)
    normalized = normalize_paragraph_breaks(normalized)
    return normalized


def build_normalization_report(
    original_content: str,
    normalized_content: str,
) -> NormalizationReport:
    return NormalizationReport(
        original_character_count=len(original_content),
        normalized_character_count=len(normalized_content),
        original_paragraph_count=len(split_paragraphs(original_content)),
        normalized_paragraph_count=len(split_paragraphs(normalized_content)),
        removed_character_count=max(len(original_content) - len(normalized_content), 0),
    )
