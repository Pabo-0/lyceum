from typing import Any

from django.conf import settings

from document_processing.neo4j_cypher import graph_to_cypher, split_cypher_statements


class Neo4jGateway:
    def __init__(self) -> None:
        self.config = settings.NEO4J

    def is_configured(self) -> bool:
        return bool(self.config.get("URI") and self.config.get("USER") and self.config.get("PASSWORD"))

    def sync_on_ingest(self) -> bool:
        return bool(self.config.get("SYNC_ON_INGEST"))

    def sync_graph(self, graph: dict[str, Any]) -> dict[str, Any]:
        if not self.sync_on_ingest():
            return {"enabled": False, "status": "skipped", "reason": "sync_disabled"}
        if not self.is_configured():
            return {"enabled": True, "status": "skipped", "reason": "neo4j_not_configured"}

        cypher = graph_to_cypher(graph, include_schema=True)
        statements = split_cypher_statements(cypher)
        try:
            self._run_statements(statements)
        except Exception as exc:
            return {"enabled": True, "status": "failed", "reason": str(exc)}
        return {
            "enabled": True,
            "status": "synced",
            "statement_count": len(statements),
        }

    def patch_node(self, node_id: str, properties: dict[str, Any]) -> dict[str, Any]:
        if not self.is_configured():
            return {"status": "skipped", "reason": "neo4j_not_configured"}
        try:
            self._run_query(
                (
                    "MATCH (n {node_id: $node_id}) "
                    "SET n += $properties RETURN n.node_id AS node_id"
                ),
                {"node_id": node_id, "properties": properties},
            )
        except Exception as exc:
            return {"status": "failed", "reason": str(exc)}
        return {"status": "synced"}

    def patch_relationship(
        self,
        relationship_id: str,
        properties: dict[str, Any],
    ) -> dict[str, Any]:
        if not self.is_configured():
            return {"status": "skipped", "reason": "neo4j_not_configured"}
        try:
            self._run_query(
                (
                    "MATCH ()-[r {relationship_id: $relationship_id}]->() "
                    "SET r += $properties RETURN r.relationship_id AS relationship_id"
                ),
                {"relationship_id": relationship_id, "properties": properties},
            )
        except Exception as exc:
            return {"status": "failed", "reason": str(exc)}
        return {"status": "synced"}

    def delete_node(self, node_id: str) -> dict[str, Any]:
        if not self.is_configured():
            return {"status": "skipped", "reason": "neo4j_not_configured"}
        try:
            self._run_query(
                "MATCH (n {node_id: $node_id}) DETACH DELETE n",
                {"node_id": node_id},
            )
        except Exception as exc:
            return {"status": "failed", "reason": str(exc)}
        return {"status": "synced"}

    def delete_relationship(self, relationship_id: str) -> dict[str, Any]:
        if not self.is_configured():
            return {"status": "skipped", "reason": "neo4j_not_configured"}
        try:
            self._run_query(
                "MATCH ()-[r {relationship_id: $relationship_id}]->() DELETE r",
                {"relationship_id": relationship_id},
            )
        except Exception as exc:
            return {"status": "failed", "reason": str(exc)}
        return {"status": "synced"}

    def _run_statements(self, statements: list[str]) -> None:
        from neo4j import GraphDatabase

        driver = GraphDatabase.driver(
            self.config["URI"],
            auth=(self.config["USER"], self.config["PASSWORD"]),
        )
        try:
            session_options = self._session_options()
            with driver.session(**session_options) as session:
                for statement in statements:
                    session.run(statement).consume()
        finally:
            driver.close()

    def _run_query(self, query: str, parameters: dict[str, Any]) -> None:
        from neo4j import GraphDatabase

        driver = GraphDatabase.driver(
            self.config["URI"],
            auth=(self.config["USER"], self.config["PASSWORD"]),
        )
        try:
            session_options = self._session_options()
            with driver.session(**session_options) as session:
                session.run(query, parameters).consume()
        finally:
            driver.close()

    def _session_options(self) -> dict[str, str]:
        database = self.config.get("DATABASE")
        if database:
            return {"database": database}
        return {}
