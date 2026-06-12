import re


PARAGRAPH_BREAK_PATTERN = re.compile(r"\n\s*\n+", re.MULTILINE)


def split_paragraphs(content: str) -> list[str]:
    paragraphs = [
        paragraph.strip()
        for paragraph in PARAGRAPH_BREAK_PATTERN.split(content.strip())
        if paragraph.strip()
    ]
    return paragraphs

