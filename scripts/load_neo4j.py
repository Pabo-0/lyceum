from pathlib import Path
import os
import sys


sys.dont_write_bytecode = True
PROJECT_ROOT = Path(__file__).resolve().parents[1]
if str(PROJECT_ROOT) not in sys.path:
    sys.path.insert(0, str(PROJECT_ROOT))

from document_processing.config import DEFAULT_NEO4J_EXPORT_DIR
from document_processing.neo4j_cypher import split_cypher_statements


def main() -> int:
    try:
        from neo4j import GraphDatabase
    except ImportError:
        print("Missing dependency: install the official Neo4j driver with `pip install neo4j`.")
        return 1

    cypher_path = PROJECT_ROOT / DEFAULT_NEO4J_EXPORT_DIR / "all_documents.cypher"
    if not cypher_path.exists():
        print("Cypher export not found. Run `python scripts/export_neo4j_cypher.py` first.")
        return 1

    uri = os.getenv("NEO4J_URI", "bolt://localhost:7687")
    user = os.getenv("NEO4J_USER", "neo4j")
    password = os.getenv("NEO4J_PASSWORD")
    database = os.getenv("NEO4J_DATABASE")

    if not password:
        print("Missing NEO4J_PASSWORD environment variable.")
        return 1

    statements = split_cypher_statements(cypher_path.read_text(encoding="utf-8"))
    session_options = {"database": database} if database else {}

    driver = GraphDatabase.driver(uri, auth=(user, password))
    try:
        with driver.session(**session_options) as session:
            for statement in statements:
                session.run(statement).consume()
    finally:
        driver.close()

    print(f"Loaded {len(statements)} Cypher statement(s) into Neo4j at {uri}.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
