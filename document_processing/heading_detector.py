import re
from dataclasses import dataclass


MARKDOWN_HEADING_PATTERN = re.compile(r"^\s{0,3}(#{1,6})\s+(.+?)\s*$")
NUMBERED_HEADING_PATTERN = re.compile(r"^\s*(\d+(?:\.\d+)*)(?:\.)?\s+(.+?)\s*$")
KEYWORD_HEADINGS = {
    "conclusion",
    "conclusiones",
    "definicion",
    "ejemplo",
    "idea importante",
    "introduccion",
    "objetivo",
    "resumen",
    "resumen de temas importantes",
}


@dataclass(frozen=True)
class HeadingCandidate:
    title: str
    level: int
    heading_type: str
    numbering: str | None = None


def detect_heading(line: str, is_first_content_line: bool = False) -> HeadingCandidate | None:
    stripped = line.strip()
    if not stripped:
        return None

    markdown_match = MARKDOWN_HEADING_PATTERN.match(stripped)
    if markdown_match:
        title = markdown_match.group(2).strip()
        numbering = _extract_numbering(title)
        level = len(markdown_match.group(1))
        if numbering:
            level = max(level, len(numbering.split(".")) + 1)
        return HeadingCandidate(
            title=title,
            level=level,
            heading_type="markdown",
            numbering=numbering,
        )

    numbered_match = NUMBERED_HEADING_PATTERN.match(stripped)
    if numbered_match:
        numbering = numbered_match.group(1)
        return HeadingCandidate(
            title=numbered_match.group(2).strip(),
            level=len(numbering.split(".")),
            heading_type="numbered",
            numbering=numbering,
        )

    normalized = stripped.lower().rstrip(":")
    if normalized in KEYWORD_HEADINGS:
        return HeadingCandidate(
            title=stripped,
            level=2,
            heading_type="keyword",
        )

    if is_first_content_line and looks_like_title_line(stripped):
        return HeadingCandidate(
            title=stripped,
            level=1,
            heading_type="title_line",
        )

    return None


def looks_like_title_line(line: str) -> bool:
    if len(line) > 90:
        return False
    if line.endswith((".", ";", ",")):
        return False
    return bool(re.search(r"[A-Za-z0-9]", line))


def _extract_numbering(title: str) -> str | None:
    match = NUMBERED_HEADING_PATTERN.match(title)
    if not match:
        return None
    return match.group(1)
