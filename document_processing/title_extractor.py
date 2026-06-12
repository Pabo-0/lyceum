import re


MARKDOWN_HEADING_PATTERN = re.compile(r"^\s{0,3}#{1,6}\s+(.+?)\s*$")
NUMBERED_HEADING_PATTERN = re.compile(r"^\s*\d+(?:\.\d+)*\.?\s+(.+?)\s*$")


def extract_title(content: str, fallback: str) -> str:
    for line in content.splitlines():
        stripped = line.strip()
        if not stripped:
            continue

        markdown_match = MARKDOWN_HEADING_PATTERN.match(stripped)
        if markdown_match:
            return markdown_match.group(1).strip()

        numbered_match = NUMBERED_HEADING_PATTERN.match(stripped)
        if numbered_match:
            return numbered_match.group(1).strip()

        if len(stripped) <= 90 and not stripped.endswith((".", ";", ",")):
            return stripped

    return fallback

