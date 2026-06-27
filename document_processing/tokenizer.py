import re


TOKEN_PATTERN = re.compile(r"[^\W_]+(?:-[^\W_]+)?", re.UNICODE)


def tokenize(content: str) -> list[str]:
    return [match.group(0).lower() for match in TOKEN_PATTERN.finditer(content)]
