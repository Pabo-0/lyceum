from document_processing.heading_detector import detect_heading, looks_like_title_line


def extract_title(content: str, fallback: str) -> str:
    first_content_seen = False
    for line in content.splitlines():
        stripped = line.strip()
        if not stripped:
            continue

        heading = detect_heading(stripped, is_first_content_line=not first_content_seen)
        first_content_seen = True
        if heading:
            return heading.title

        if looks_like_title_line(stripped):
            return stripped

    return fallback
