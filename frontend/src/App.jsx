import { useEffect, useState } from 'react';

import DocumentSidebar from './components/DocumentSidebar.jsx';
import GraphPage from './pages/GraphPage.jsx';
import HomePage from './pages/HomePage.jsx';
import { getDocumentGraph, listDocuments, uploadDocument } from './api/client.js';

const appName = import.meta.env.VITE_APP_NAME || 'Lyceum';

const initialFilters = {
  showChunks: true,
};

export default function App() {
  const [documents, setDocuments] = useState([]);
  const [selectedDocumentId, setSelectedDocumentId] = useState('');
  const [graph, setGraph] = useState(null);
  const [selectedNodeId, setSelectedNodeId] = useState('');
  const [selectedRelationshipId, setSelectedRelationshipId] = useState('');
  const [focusNodeId, setFocusNodeId] = useState('');
  const [filters, setFilters] = useState(initialFilters);
  const [status, setStatus] = useState('loading');
  const [uploadStatus, setUploadStatus] = useState('idle');
  const [error, setError] = useState('');
  const [theme, setTheme] = useState(() => localStorage.getItem('lyceum-theme') || 'dark');

  useEffect(() => {
    refreshDocuments();
  }, []);

  useEffect(() => {
    localStorage.setItem('lyceum-theme', theme);
  }, [theme]);

  useEffect(() => {
    if (!selectedDocumentId) {
      setGraph(null);
      return;
    }
    loadGraph(selectedDocumentId);
  }, [selectedDocumentId]);

  const isGraphPage = Boolean(selectedDocumentId);

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
  }

  function handleNewDocument() {
    setSelectedDocumentId('');
    setSelectedNodeId('');
    setSelectedRelationshipId('');
    setFocusNodeId('');
    setGraph(null);
  }

  function handleSelectNode(nodeId) {
    setSelectedNodeId(nodeId);
    setSelectedRelationshipId('');
  }

  function handleSelectRelationship(relationshipId) {
    setSelectedRelationshipId(relationshipId || '');
  }

  function handleFilterChange(name, value) {
    setFilters((current) => ({ ...current, [name]: value }));
  }

  function toggleTheme() {
    setTheme((current) => (current === 'dark' ? 'light' : 'dark'));
  }

  return (
    <main className="app-shell" data-theme={theme}>
      <section className="workspace">
        <DocumentSidebar
          appName={appName}
          documents={documents}
          isHome={!isGraphPage}
          onNewDocument={handleNewDocument}
          onSelectDocument={handleSelectDocument}
          onToggleTheme={toggleTheme}
          selectedDocumentId={selectedDocumentId}
          status={status}
          theme={theme}
        />

        <section className="content-shell">
          {error ? <p className="error">{error}</p> : null}

          {isGraphPage ? (
            <GraphPage
              filters={filters}
              focusNodeId={focusNodeId}
              graph={graph}
              onSelectNode={handleSelectNode}
              onSelectRelationship={handleSelectRelationship}
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
    </main>
  );
}
