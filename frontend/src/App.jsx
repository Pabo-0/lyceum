import { useEffect, useRef, useState } from 'react';

import AccountDeleteDialog from './components/AccountDeleteDialog.jsx';
import DocumentSidebar from './components/DocumentSidebar.jsx';
import DocumentDeleteDialog from './components/DocumentDeleteDialog.jsx';
import GraphReorganizeDialog from './components/GraphReorganizeDialog.jsx';
import LogoutConfirmDialog from './components/LogoutConfirmDialog.jsx';
import AuthPage from './pages/AuthPage.jsx';
import GraphPage from './pages/GraphPage.jsx';
import HomePage from './pages/HomePage.jsx';
import NodeContentPage from './pages/NodeContentPage.jsx';
import SettingsPage from './pages/SettingsPage.jsx';
import {
  createNode,
  createRelationship,
  deleteAccount as deleteRemoteAccount,
  deleteDocument,
  deleteNode,
  deleteRelationship,
  getDocumentGraph,
  listDocuments,
  mergeNodes,
  resetNodePositions,
  saveNodePosition,
  updateDocument,
  updateNode,
  updateRelationship,
  uploadDocument,
} from './api/client.js';
import {
  createAccount,
  deleteStoredAccount,
  filterDocumentsForWorkspace,
  forgetWorkspaceDocument,
  getDocumentId,
  loginAccount,
  logoutAccount,
  readStoredSession,
  rememberWorkspaceDocument,
  sessionNeedsSync,
  syncStoredSession,
} from './utils/session.js';

const appName = import.meta.env.VITE_APP_NAME || 'Lyceum';

const GRAPH_LAYOUTS_STORAGE_KEY_PREFIX = 'lyceum-graph-layouts';

export default function App() {
  const [session, setSession] = useState(readStoredSession);
  const [accountPage, setAccountPage] = useState('login');
  const [documents, setDocuments] = useState([]);
  const [selectedDocumentId, setSelectedDocumentId] = useState('');
  const [graph, setGraph] = useState(null);
  const [selectedNodeId, setSelectedNodeId] = useState('');
  const [contentNodeId, setContentNodeId] = useState('');
  const [selectedRelationshipId, setSelectedRelationshipId] = useState('');
  const [focusNodeId, setFocusNodeId] = useState('');
  const [graphLayoutResetVersion, setGraphLayoutResetVersion] = useState(0);
  const [status, setStatus] = useState(session ? 'loading' : 'idle');
  const [graphLoading, setGraphLoading] = useState(false);
  const [uploadStatus, setUploadStatus] = useState('idle');
  const [error, setError] = useState('');
  const [graphLayouts, setGraphLayouts] = useState(() =>
    readStoredGraphLayouts(session?.workspace?.id || ''),
  );
  const [graphLayoutsWorkspaceId, setGraphLayoutsWorkspaceId] = useState(
    session?.workspace?.id || '',
  );
  const [activePage, setActivePage] = useState('home');
  const [settingsReturnPage, setSettingsReturnPage] = useState('home');
  const [documentToDelete, setDocumentToDelete] = useState(null);
  const [isDeletingDocument, setIsDeletingDocument] = useState(false);
  const [accountToDelete, setAccountToDelete] = useState(null);
  const [isDeletingAccount, setIsDeletingAccount] = useState(false);
  const [isReorganizeDialogOpen, setIsReorganizeDialogOpen] = useState(false);
  const [isReorganizingGraph, setIsReorganizingGraph] = useState(false);
  const [isLogoutConfirmOpen, setIsLogoutConfirmOpen] = useState(false);
  const graphLoadRequestRef = useRef(0);

  const workspaceId = session?.workspace?.id || '';
  const isPreparingSession = sessionNeedsSync(session);

  useEffect(() => {
    if (!session) return;

    let cancelled = false;
    syncStoredSession()
      .then((syncedSession) => {
        if (!cancelled && syncedSession) {
          setSession(syncedSession);
          setStatus('ready');
        }
      })
      .catch((err) => {
        if (!cancelled) {
          setError(err.message);
        }
      });

    return () => {
      cancelled = true;
    };
  }, []);

  useEffect(() => {
    if (!session || isPreparingSession) return;
    refreshDocuments('', session);
  }, [workspaceId, isPreparingSession]);

  useEffect(() => {
    setGraphLayouts(readStoredGraphLayouts(workspaceId));
    setGraphLayoutsWorkspaceId(workspaceId);
  }, [workspaceId]);

  useEffect(() => {
    if (!workspaceId) return;
    if (graphLayoutsWorkspaceId !== workspaceId) return;
    localStorage.setItem(
      getGraphLayoutsStorageKey(workspaceId),
      JSON.stringify(graphLayouts),
    );
  }, [workspaceId, graphLayoutsWorkspaceId, graphLayouts]);

  useEffect(() => {
    if (!session || !selectedDocumentId) {
      graphLoadRequestRef.current += 1;
      setGraph(null);
      setGraphLoading(false);
      return;
    }
    if (isPreparingSession) {
      setGraphLoading(true);
      return;
    }
    loadGraph(selectedDocumentId, session);
  }, [selectedDocumentId, workspaceId, isPreparingSession]);

  function getApiContext(activeSession = session) {
    if (!activeSession) return null;
    return {
      userId: activeSession.user.id,
      workspaceId: activeSession.workspace.id,
    };
  }

  function resetWorkspaceState(nextStatus = 'idle') {
    setDocuments([]);
    setSelectedDocumentId('');
    setSelectedNodeId('');
    setContentNodeId('');
    setSelectedRelationshipId('');
    setFocusNodeId('');
    setGraphLayoutResetVersion(0);
    setGraph(null);
    setGraphLoading(false);
    setGraphLayouts({});
    setGraphLayoutsWorkspaceId('');
    setActivePage('home');
    setDocumentToDelete(null);
    setIsDeletingDocument(false);
    setAccountToDelete(null);
    setIsDeletingAccount(false);
    setIsReorganizeDialogOpen(false);
    setIsReorganizingGraph(false);
    setIsLogoutConfirmOpen(false);
    setUploadStatus('idle');
    setError('');
    setStatus(nextStatus);
  }

  async function handleLogin(credentials) {
    const nextSession = await loginAccount(credentials);
    resetWorkspaceState('loading');
    setActivePage('home');
    setSession(nextSession);
  }

  async function ensureSessionReady() {
    if (!sessionNeedsSync(session)) return session;

    setStatus('loading');
    setError('');
    const syncedSession = await syncStoredSession();
    if (syncedSession) {
      setSession(syncedSession);
      return syncedSession;
    }
    throw new Error('No se pudo preparar el workspace huesped.');
  }

  async function handleSignup(payload) {
    const nextSession = await createAccount(payload);
    resetWorkspaceState('loading');
    setActivePage('home');
    setSession(nextSession);
  }

  function handleLogout() {
    const guestSession = logoutAccount();
    setAccountPage('login');
    resetWorkspaceState('loading');
    setSession(guestSession);
  }

  function handleRequestLogout() {
    if (session?.isGuest) {
      handleOpenAccount();
      return;
    }
    setIsLogoutConfirmOpen(true);
  }

  function handleConfirmLogout() {
    setIsLogoutConfirmOpen(false);
    handleLogout();
  }

  async function refreshDocuments(nextSelectedId = '', activeSession = session) {
    if (sessionNeedsSync(activeSession)) return;
    if (!activeSession?.workspace?.id) return;

    try {
      setStatus('loading');
      setError('');
      const data = await listDocuments(getApiContext(activeSession));
      const nextDocuments = filterDocumentsForWorkspace(
        data.documents || [],
        activeSession.workspace.id,
      );
      setDocuments(nextDocuments);

      if (nextSelectedId) {
        setSelectedDocumentId(nextSelectedId);
      } else if (
        selectedDocumentId &&
        !nextDocuments.some((document) => getDocumentId(document) === selectedDocumentId)
      ) {
        setSelectedDocumentId('');
        setGraph(null);
        setActivePage('home');
      }

      setStatus('ready');
    } catch (err) {
      setError(err.message);
      setStatus('error');
    }
  }

  async function loadGraph(documentId, activeSession = session) {
    if (!activeSession) return;
    if (sessionNeedsSync(activeSession)) return;

    const requestId = graphLoadRequestRef.current + 1;
    graphLoadRequestRef.current = requestId;

    try {
      setError('');
      setGraphLoading(true);
      const data = await getDocumentGraph(documentId, getApiContext(activeSession));
      if (requestId !== graphLoadRequestRef.current) return;
      setGraph(data.graph);
      if (data.node_positions && typeof data.node_positions === 'object') {
        setGraphLayouts((current) => ({
          ...current,
          [documentId]: {
            ...(current[documentId] || {}),
            ...normalizeStoredNodePositions(data.node_positions),
          },
        }));
      }
      setSelectedNodeId('');
      setSelectedRelationshipId('');
      setFocusNodeId('');
    } catch (err) {
      if (requestId !== graphLoadRequestRef.current) return;
      setError(err.message);
      setStatus('error');
    } finally {
      if (requestId === graphLoadRequestRef.current) {
        setGraphLoading(false);
      }
    }
  }

  async function handleUpload(file) {
    if (!session) return;

    try {
      const readySession = await ensureSessionReady();
      setUploadStatus('uploading');
      setStatus('processing');
      setError('');
      const result = await uploadDocument(file, getApiContext(readySession));
      const documentId =
        result.document?.metadata?.document_id || result.document?.document_id || '';

      if (!documentId) {
        throw new Error('No se recibio el id del documento procesado.');
      }

      rememberWorkspaceDocument(readySession.workspace.id, documentId);
      setGraph(result.document.graph);
      setGraphLoading(false);
      setSelectedNodeId('');
      setSelectedRelationshipId('');
      setFocusNodeId('');
      setActivePage('graph');
      await refreshDocuments(documentId, readySession);
      setStatus('ready');
    } catch (err) {
      setError(err.message);
      setStatus('error');
    } finally {
      setUploadStatus('idle');
    }
  }

  function handleSelectDocument(documentId) {
    const canOpenDocument = documents.some((document) => getDocumentId(document) === documentId);
    if (!canOpenDocument) return;
    if (documentId === selectedDocumentId) {
      setContentNodeId('');
      setActivePage('graph');
      return;
    }

    graphLoadRequestRef.current += 1;
    setSelectedDocumentId(documentId);
    setContentNodeId('');
    setIsReorganizeDialogOpen(false);
    setSelectedNodeId('');
    setSelectedRelationshipId('');
    setFocusNodeId('');
    setGraph(null);
    setGraphLoading(true);
    setActivePage('graph');
  }

  function handleNewDocument() {
    setSelectedDocumentId('');
    setSelectedNodeId('');
    setContentNodeId('');
    setSelectedRelationshipId('');
    setFocusNodeId('');
    setGraph(null);
    setGraphLoading(false);
    setIsReorganizeDialogOpen(false);
    setActivePage('home');
  }

  function handleRequestDeleteDocument(document) {
    setDocumentToDelete(document);
  }

  async function handleConfirmDeleteDocument() {
    if (!documentToDelete || !session) return;
    const document = documentToDelete;
    const documentId = getDocumentId(document);

    try {
      setIsDeletingDocument(true);
      setStatus('processing');
      setError('');
      await deleteDocument(documentId, getApiContext(session));
      forgetWorkspaceDocument(session.workspace.id, documentId);
      setGraphLayouts((current) => {
        const nextLayouts = { ...current };
        delete nextLayouts[documentId];
        return nextLayouts;
      });

      if (selectedDocumentId === documentId) {
        setSelectedDocumentId('');
        setSelectedNodeId('');
        setContentNodeId('');
        setSelectedRelationshipId('');
        setFocusNodeId('');
        setGraph(null);
        setGraphLoading(false);
        setActivePage('home');
      }

      await refreshDocuments('', session);
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
      const result = await updateDocument(documentId, { title }, getApiContext(session));
      const renamedDocument = result.document;
      const renamedMetadata = renamedDocument.metadata;

      setDocuments((current) =>
        current.map((document) =>
          getDocumentId(document) === documentId
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

  function handleOpenNodeContent(nodeId) {
    setContentNodeId(nodeId);
    setSelectedNodeId(nodeId);
    setSelectedRelationshipId('');
    setActivePage('node-content');
  }

  function handleCloseNodeContent() {
    setActivePage(selectedDocumentId ? 'graph' : 'home');
  }

  function handleSelectRelationship(relationshipId) {
    setSelectedRelationshipId(relationshipId || '');
  }

  function handleRequestReorganizeGraph() {
    if (!selectedDocumentId || graphLoading) return;
    setIsReorganizeDialogOpen(true);
  }

  async function handleConfirmReorganizeGraph() {
    if (!selectedDocumentId || !session) return;
    const documentId = selectedDocumentId;

    try {
      setIsReorganizingGraph(true);
      setError('');
      await resetNodePositions(documentId, getApiContext(session));
      setGraphLayouts((current) => ({
        ...current,
        [documentId]: {},
      }));
      setSelectedNodeId('');
      setSelectedRelationshipId('');
      setFocusNodeId('');
      setGraphLayoutResetVersion((current) => current + 1);
      setIsReorganizeDialogOpen(false);
    } catch (err) {
      setError(err.message);
    } finally {
      setIsReorganizingGraph(false);
    }
  }

  function handleNodePositionChange(nodeId, position) {
    if (!selectedDocumentId || !nodeId) return;
    if (isPreparingSession) return;

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

    saveNodePosition(
      selectedDocumentId,
      {
        node_id: nodeId,
        x: Math.round(position.x),
        y: Math.round(position.y),
      },
      getApiContext(session),
    ).catch((err) => setError(err.message));
  }

  function handleOpenSettings() {
    if (activePage !== 'settings') {
      setSettingsReturnPage(activePage);
    }
    setActivePage('settings');
  }

  function handleCloseSettings() {
    const fallbackPage = selectedDocumentId ? 'graph' : 'home';
    setActivePage(settingsReturnPage || fallbackPage);
  }

  function handleOpenAccount() {
    setAccountPage('login');
    setActivePage('account');
  }

  function handleRequestDeleteAccount() {
    if (!session || session.isGuest) return;
    setAccountToDelete(session);
  }

  async function handleConfirmDeleteAccount() {
    if (!accountToDelete) return;

    try {
      setIsDeletingAccount(true);
      setStatus('processing');
      setError('');
      const deletingWorkspaceId = accountToDelete.workspace?.id || '';
      await deleteRemoteAccount(getApiContext(accountToDelete));
      if (deletingWorkspaceId) {
        localStorage.removeItem(getGraphLayoutsStorageKey(deletingWorkspaceId));
      }
      const guestSession = deleteStoredAccount(accountToDelete);
      setAccountPage('login');
      resetWorkspaceState('loading');
      setSession(guestSession);
      setAccountToDelete(null);
    } catch (err) {
      setError(err.message);
      setStatus('error');
    } finally {
      setIsDeletingAccount(false);
    }
  }

  async function handleCreateNode(payload) {
    const result = await createNode(selectedDocumentId, payload, getApiContext(session));
    setGraph(result.graph);
    setSelectedNodeId(result.node.node_id);
    setSelectedRelationshipId('');
    return result;
  }

  async function handleUpdateNode(nodeId, payload) {
    const result = await updateNode(nodeId, payload, getApiContext(session));
    setGraph(result.graph);
    setSelectedNodeId(result.node.node_id);
    return result;
  }

  async function handleDeleteNode(nodeId) {
    const result = await deleteNode(nodeId, getApiContext(session));
    setSelectedNodeId('');
    setContentNodeId('');
    setSelectedRelationshipId('');
    setFocusNodeId('');
    setGraph(result.graph);
    return result;
  }

  async function handleCreateRelationship(payload) {
    const result = await createRelationship(
      selectedDocumentId,
      payload,
      getApiContext(session),
    );
    setGraph(result.graph);
    setSelectedRelationshipId(result.relationship.relationship_id);
    setSelectedNodeId('');
    return result;
  }

  async function handleUpdateRelationship(relationshipId, payload) {
    const result = await updateRelationship(
      relationshipId,
      payload,
      getApiContext(session),
    );
    setGraph(result.graph);
    setSelectedRelationshipId(result.relationship.relationship_id);
    return result;
  }

  async function handleDeleteRelationship(relationshipId) {
    const result = await deleteRelationship(relationshipId, getApiContext(session));
    setGraph(result.graph);
    setSelectedRelationshipId('');
    return result;
  }

  async function handleMergeNodes(payload) {
    const result = await mergeNodes(selectedDocumentId, payload, getApiContext(session));
    setGraph(result.graph);
    setSelectedNodeId(result.node.node_id);
    setSelectedRelationshipId('');
    return result;
  }

  const isAccountPage = activePage === 'account';
  const isSettingsPage = activePage === 'settings';
  const isNodeContentPage = activePage === 'node-content' && Boolean(contentNodeId);
  const isGraphPage = activePage === 'graph' && Boolean(selectedDocumentId);
  const isHomePage =
    activePage === 'home' ||
    (!isAccountPage && !isSettingsPage && !isNodeContentPage && !selectedDocumentId);
  const contentNode = graph?.nodes?.find((node) => node.node_id === contentNodeId);

  return (
    <main className="app-shell">
      <section className="workspace">
        <DocumentSidebar
          appName={appName}
          documents={documents}
          isHome={isHomePage}
          isSettings={isSettingsPage}
          onDeleteDocument={handleRequestDeleteDocument}
          onNewDocument={handleNewDocument}
          onOpenAccount={handleOpenAccount}
          onOpenSettings={handleOpenSettings}
          onRenameDocument={handleRenameDocument}
          onSelectDocument={handleSelectDocument}
          selectedDocumentId={selectedDocumentId}
          session={session}
        />

        <section className="content-shell">
          {error ? <p className="error">{error}</p> : null}

          {isAccountPage ? (
            <AuthPage
              mode={accountPage}
              onLogin={handleLogin}
              onSignup={handleSignup}
              onSwitchMode={setAccountPage}
            />
          ) : isSettingsPage ? (
            <SettingsPage
              onClose={handleCloseSettings}
              onLogout={handleRequestLogout}
              onOpenAccount={handleOpenAccount}
              onRequestDeleteAccount={handleRequestDeleteAccount}
              session={session}
            />
          ) : isGraphPage ? (
            <GraphPage
              documentId={selectedDocumentId}
              focusNodeId={focusNodeId}
              graph={graph}
              isLoading={graphLoading}
              layoutResetVersion={graphLayoutResetVersion}
              nodePositions={graphLayouts[selectedDocumentId] || {}}
              onCreateNode={handleCreateNode}
              onCreateRelationship={handleCreateRelationship}
              onDeleteNode={handleDeleteNode}
              onDeleteRelationship={handleDeleteRelationship}
              onMergeNodes={handleMergeNodes}
              onNodePositionChange={handleNodePositionChange}
              onOpenNodeContent={handleOpenNodeContent}
              onRequestReorganizeGraph={handleRequestReorganizeGraph}
              onSelectNode={handleSelectNode}
              onSelectRelationship={handleSelectRelationship}
              onUpdateNode={handleUpdateNode}
              onUpdateRelationship={handleUpdateRelationship}
              selectedNodeId={selectedNodeId}
              selectedRelationshipId={selectedRelationshipId}
            />
          ) : isNodeContentPage ? (
            <NodeContentPage
              node={contentNode}
              onBack={handleCloseNodeContent}
              onUpdateNode={handleUpdateNode}
            />
          ) : (
            <HomePage
              documentCount={documents.length}
              onUploadDocument={handleUpload}
              status={isPreparingSession ? 'loading' : status}
              uploadStatus={uploadStatus}
              session={session}
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
      <AccountDeleteDialog
        isDeleting={isDeletingAccount}
        onCancel={() => setAccountToDelete(null)}
        onConfirm={handleConfirmDeleteAccount}
        session={accountToDelete}
      />
      <GraphReorganizeDialog
        isOpen={isReorganizeDialogOpen}
        isReorganizing={isReorganizingGraph}
        onCancel={() => setIsReorganizeDialogOpen(false)}
        onConfirm={handleConfirmReorganizeGraph}
      />
      <LogoutConfirmDialog
        isOpen={isLogoutConfirmOpen}
        onCancel={() => setIsLogoutConfirmOpen(false)}
        onConfirm={handleConfirmLogout}
      />
    </main>
  );
}

function getGraphLayoutsStorageKey(workspaceId) {
  return workspaceId
    ? `${GRAPH_LAYOUTS_STORAGE_KEY_PREFIX}:${workspaceId}`
    : GRAPH_LAYOUTS_STORAGE_KEY_PREFIX;
}

function readStoredGraphLayouts(workspaceId) {
  try {
    const rawValue = localStorage.getItem(getGraphLayoutsStorageKey(workspaceId));
    const parsed = rawValue ? JSON.parse(rawValue) : {};
    return parsed && typeof parsed === 'object' ? parsed : {};
  } catch {
    return {};
  }
}

function normalizeStoredNodePositions(value) {
  if (!value || typeof value !== 'object') return {};

  return Object.entries(value).reduce((positions, [nodeId, position]) => {
    const x = Number(position?.x);
    const y = Number(position?.y);
    if (!nodeId || !Number.isFinite(x) || !Number.isFinite(y)) return positions;
    positions[nodeId] = {
      x: Math.round(x),
      y: Math.round(y),
    };
    return positions;
  }, {});
}
