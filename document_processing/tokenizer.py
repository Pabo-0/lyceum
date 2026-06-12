import re


TOKEN_PATTERN = re.compile(r"[A-Za-z0-9_]+(?:-[A-Za-z0-9_]+)?")


def tokenize(content: str) -> list[str]:
    return [match.group(0).lower() for match in TOKEN_PATTERN.finditer(content)]

