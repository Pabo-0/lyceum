import { useEffect, useState } from 'react';

import DocumentSidebar from './components/DocumentSidebar.jsx';
import DocumentDeleteDialog from './components/DocumentDeleteDialog.jsx';
import GraphPage from './pages/GraphPage.jsx';
import HomePage from './pages/HomePage.jsx';
import SettingsPage from './pages/SettingsPage.jsx';
import {
  createNode,
  createRelationship,
  deleteDocument,
  deleteNode,
  deleteRelationship,
  getDocumentGraph,
  listDocuments,
  mergeNodes,
  updateDocument,
  updateNode,
  updateRelationship,
  uploadDocument,
} from './api/client.js';

const appName = import.meta.env.VITE_APP_NAME || 'Lyceum';

const GRAPH_LAYOUTS_STORAGE_KEY = 'lyceum-graph-layouts';

export default function App() {
  const [documents, setDocuments] = useState([]);
  const [selectedDocumentId, setSelectedDocumentId] = useState('');
  const [graph, setGraph] = useState(null);
  const [selectedNodeId, setSelectedNodeId] = useState('');
  const [selectedRelationshipId, setSelectedRelationshipId] = useState('');
  const [focusNodeId, setFocusNodeId] = useState('');
  const [status, setStatus] = useState('loading');
  const [uploadStatus, setUploadStatus] = useState('idle');
  const [error, setError] = useState('');
  const [graphMode, setGraphMode] = useState('read');
  const [graphLayouts, setGraphLayouts] = useState(readStoredGraphLayouts);
  const [activePage, setActivePage] = useState('home');
  const [documentToDelete, setDocumentToDelete] = useState(null);
  const [isDeletingDocument, setIsDeletingDocument] = useState(false);

  useEffect(() => {
    refreshDocuments();
  }, []);

  useEffect(() => {
    localStorage.setItem(GRAPH_LAYOUTS_STORAGE_KEY, JSON.stringify(graphLayouts));
  }, [graphLayouts]);

  useEffect(() => {
    if (!selectedDocumentId) {
      setGraph(null);
      return;
    }
    loadGraph(selectedDocumentId);
  }, [selectedDocumentId]);

  async function refreshDocuments(nextSelectedId = '') {
    try {
      setStatus('loading');
      setError('');
      const data = await listDocuments();
      const nextDocuments = data.documents || [];
      setDocuments(nextDocuments);
      if (nextSelectedId) {
        setSelectedDocumentId(nextSelectedId);
      }
      setStatus('ready');
    } catch (err) {
      setError(err.message);
      setStatus('error');
    }
  }

  async function loadGraph(documentId) {
    try {
      setError('');
      const data = await getDocumentGraph(documentId);
      setGraph(data.graph);
      setSelectedNodeId('');
      setSelectedRelationshipId('');
      setFocusNodeId('');
    } catch (err) {
      setError(err.message);
      setStatus('error');
    }
  }

  async function handleUpload(file) {
    try {
      setUploadStatus('uploading');
      setStatus('processing');
      setError('');
      const result = await uploadDocument(file);
      const documentId = result.document.metadata.document_id;
      setGraph(result.document.graph);
      setSelectedNodeId('');
      setSelectedRelationshipId('');
      setFocusNodeId('');
      setActivePage('graph');
      await refreshDocuments(documentId);
      setStatus('ready');
    } catch (err) {
      setError(err.message);
      setStatus('error');
    } finally {
      setUploadStatus('idle');
    }
  }

  function handleSelectDocument(documentId) {
    setSelectedDocumentId(documentId);
    setActivePage('graph');
  }

  function handleNewDocument() {
    setSelectedDocumentId('');
    setSelectedNodeId('');
    setSelectedRelationshipId('');
    setFocusNodeId('');
    setGraph(null);
    setGraphMode('read');
    setActivePage('home');
  }

  function handleRequestDeleteDocument(document) {
    setDocumentToDelete(document);
  }

  async function handleConfirmDeleteDocument() {
    if (!documentToDelete) return;
    const document = documentToDelete;
    try {
      setIsDeletingDocument(true);
      setStatus('processing');
      setError('');
      await deleteDocument(document.document_id);
      setGraphLayouts((current) => {
        const nextLayouts = { ...current };
        delete nextLayouts[document.document_id];
        return nextLayouts;
      });

      if (selectedDocumentId === document.document_id) {
        setSelectedDocumentId('');
        setSelectedNodeId('');
        setSelectedRelationshipId('');
        setFocusNodeId('');
        setGraph(null);
        setGraphMode('read');
        setActivePage('home');
      }

      await refreshDocuments();
      setStatus('ready');
      setDocumentToDelete(null);
    } catch (err) {
      setError(err.message);
      setStatus('error');
    } finally {
      setIsDeletingDocument(false);
    }
  }

  async function handleRenameDocument(documentId, title) {
    try {
      setError('');
      const result = await updateDocument(documentId, { title });
      const renamedDocument = result.document;
      const renamedMetadata = renamedDocument.metadata;

      setDocuments((current) =>
        current.map((document) =>
          document.document_id === documentId
            ? { ...document, title: renamedMetadata.title }
            : document,
        ),
      );

      if (selectedDocumentId === documentId) {
        setGraph(renamedDocument.graph);
      }

      return result;
    } catch (err) {
      setError(err.message);
      throw err;
    }
  }

  function handleSelectNode(nodeId) {
    setSelectedNodeId(nodeId);
    setSelectedRelationshipId('');
  }

  function handleSelectRelationship(relationshipId) {
    setSelectedRelationshipId(relationshipId || '');
  }

  function handleGraphModeChange(nextMode) {
    setGraphMode(nextMode);
    setSelectedNodeId('');
    setSelectedRelationshipId('');
  }

  function handleNodePositionChange(nodeId, position) {
    if (!selectedDocumentId || !nodeId) return;

    setGraphLayouts((current) => ({
      ...current,
      [selectedDocumentId]: {
        ...(current[selectedDocumentId] || {}),
        [nodeId]: {
          x: Math.round(position.x),
          y: Math.round(position.y),
        },
      },
    }));
  }

  function handleOpenSettings() {
    setActivePage('settings');
  }

  async function handleCreateNode(payload) {
    const result = await createNode(selectedDocumentId, payload);
    setGraph(result.graph);
    setSelectedNodeId(result.node.node_id);
    setSelectedRelationshipId('');
    return result;
  }

  async function handleUpdateNode(nodeId, payload) {
    const result = await updateNode(nodeId, payload);
    setGraph(result.graph);
    setSelectedNodeId(result.node.node_id);
    return result;
  }

  async function handleDeleteNode(nodeId) {
    const result = await deleteNode(nodeId);
    setGraph(result.graph);
    setSelectedNodeId('');
    setSelectedRelationshipId('');
    return result;
  }

  async function handleCreateRelationship(payload) {
    const result = await createRelationship(selectedDocumentId, payload);
    setGraph(result.graph);
    setSelectedRelationshipId(result.relationship.relationship_id);
    setSelectedNodeId('');
    return result;
  }

  async function handleUpdateRelationship(relationshipId, payload) {
    const result = await updateRelationship(relationshipId, payload);
    setGraph(result.graph);
    setSelectedRelationshipId(result.relationship.relationship_id);
    return result;
  }

  async function handleDeleteRelationship(relationshipId) {
    const result = await deleteRelationship(relationshipId);
    setGraph(result.graph);
    setSelectedRelationshipId('');
    return result;
  }

  async function handleMergeNodes(payload) {
    const result = await mergeNodes(selectedDocumentId, payload);
    setGraph(result.graph);
    setSelectedNodeId(result.node.node_id);
    setSelectedRelationshipId('');
    return result;
  }

  const isSettingsPage = activePage === 'settings';
  const isGraphPage = activePage === 'graph' && Boolean(selectedDocumentId);
  const isHomePage = activePage === 'home' || (!isSettingsPage && !selectedDocumentId);

  return (
    <main className="app-shell">
      <section className="workspace">
        <DocumentSidebar
          appName={appName}
          documents={documents}
          isHome={isHomePage}
          isSettings={isSettingsPage}
          onNewDocument={handleNewDocument}
          onDeleteDocument={handleRequestDeleteDocument}
          onOpenSettings={handleOpenSettings}
          onRenameDocument={handleRenameDocument}
          onSelectDocument={handleSelectDocument}
          selectedDocumentId={selectedDocumentId}
        />

        <section className="content-shell">
          {error ? <p className="error">{error}</p> : null}

          {isSettingsPage ? (
            <SettingsPage />
          ) : isGraphPage ? (
            <GraphPage
              documentId={selectedDocumentId}
              focusNodeId={focusNodeId}
              graph={graph}
              graphMode={graphMode}
              nodePositions={graphLayouts[selectedDocumentId] || {}}
              onCreateNode={handleCreateNode}
              onCreateRelationship={handleCreateRelationship}
              onDeleteNode={handleDeleteNode}
              onDeleteRelationship={handleDeleteRelationship}
              onGraphModeChange={handleGraphModeChange}
              onMergeNodes={handleMergeNodes}
              onNodePositionChange={handleNodePositionChange}
              onSelectNode={handleSelectNode}
              onSelectRelationship={handleSelectRelationship}
              onUpdateNode={handleUpdateNode}
              onUpdateRelationship={handleUpdateRelationship}
              selectedNodeId={selectedNodeId}
              selectedRelationshipId={selectedRelationshipId}
            />
          ) : (
            <HomePage
              documentCount={documents.length}
              onUploadDocument={handleUpload}
              status={status}
              uploadStatus={uploadStatus}
            />
          )}
        </section>
      </section>

      <DocumentDeleteDialog
        document={documentToDelete}
        isDeleting={isDeletingDocument}
        onCancel={() => setDocumentToDelete(null)}
        onConfirm={handleConfirmDeleteDocument}
      />
    </main>
  );
}

function readStoredGraphLayouts() {
  try {
    const rawValue = localStorage.getItem(GRAPH_LAYOUTS_STORAGE_KEY);
    const parsed = rawValue ? JSON.parse(rawValue) : {};
    return parsed && typeof parsed === 'object' ? parsed : {};
  } catch {
    return {};
  }
}
