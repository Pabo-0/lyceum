import { loginUser, signupUser, syncUserSession } from '../api/client.js';

const ACCOUNTS_STORAGE_KEY = 'lyceum-accounts';
const ACTIVE_SESSION_STORAGE_KEY = 'lyceum-active-session';
const WORKSPACE_DOCUMENTS_STORAGE_KEY = 'lyceum-workspace-documents';
const GUEST_PASSWORD = 'lyceum-huesped';
const GUEST_USERNAME = 'huesped';
const GUEST_EMAIL = 'huesped@lyceum.local';
const GUEST_USER_ID = 'guest-user';
const GUEST_WORKSPACE_ID = 'guest-workspace';

export function readStoredSession() {
  const storedSession = readJson(ACTIVE_SESSION_STORAGE_KEY, null);
  if (!storedSession?.user?.id || !storedSession?.workspace?.id) {
    return ensureGuestSession();
  }

  const account = readAccounts().find(
    (candidate) =>
      candidate.user?.id === storedSession.user.id &&
      candidate.workspace?.id === storedSession.workspace.id,
  );

  if (!account) {
    localStorage.removeItem(ACTIVE_SESSION_STORAGE_KEY);
    return ensureGuestSession();
  }

  return publicSession(account);
}

export async function createAccount({ email, password, username }) {
  const nextUsername = username.trim();
  const normalizedUsername = normalizeIdentifier(nextUsername);
  const normalizedEmail = email.trim().toLowerCase();
  const nextPassword = password.trim();

  if (!nextUsername || !normalizedEmail || !nextPassword) {
    throw new Error('Completa usuario, email y contrasena.');
  }

  if (nextPassword.length < 6) {
    throw new Error('La contrasena debe tener al menos 6 caracteres.');
  }

  const data = await signupUser({
    email: normalizedEmail,
    password: nextPassword,
    username: nextUsername,
  });
  const account = accountFromSession(data.session, nextPassword);

  upsertAccount(account);
  ensureWorkspaceDocuments(account.workspace.id);
  return rememberSession(account);
}

export async function loginAccount({ password, username }) {
  const identifier = normalizeIdentifier(username);
  const nextPassword = password.trim();

  try {
    const data = await loginUser({ username: identifier, password: nextPassword });
    const account = accountFromSession(data.session, nextPassword);
    upsertAccount(account);
    ensureWorkspaceDocuments(account.workspace.id);
    return rememberSession(account);
  } catch (error) {
    const localAccount = findLocalAccount(identifier, nextPassword);
    if (!localAccount) {
      throw error;
    }

    const data = await syncUserSession({
      password: nextPassword,
      user: localAccount.user,
      workspace: localAccount.workspace,
    });
    const account = accountFromSession(data.session, nextPassword);
    migrateWorkspaceDocuments(localAccount.workspace?.id, account.workspace.id);
    upsertAccount(account);
    ensureWorkspaceDocuments(account.workspace.id);
    return rememberSession(account);
  }
}

export async function syncStoredSession() {
  const storedSession = readStoredSession();
  if (!storedSession) return null;

  const account = readAccounts().find(
    (candidate) =>
      candidate.user?.id === storedSession.user.id &&
      candidate.workspace?.id === storedSession.workspace.id,
  );
  if (!account?.password) return storedSession;

  const data = await syncUserSession({
    password: account.password,
    user: account.user,
    workspace: account.workspace,
  });
  const syncedAccount = accountFromSession(data.session, account.password);
  migrateWorkspaceDocuments(account.workspace?.id, syncedAccount.workspace.id);
  upsertAccount(syncedAccount);
  ensureWorkspaceDocuments(syncedAccount.workspace.id);
  return rememberSession(syncedAccount);
}

export function sessionNeedsSync(session) {
  return (
    Boolean(session?.isGuest) &&
    (session.user?.id === GUEST_USER_ID || session.workspace?.id === GUEST_WORKSPACE_ID)
  );
}

function accountFromSession(session, password) {
  const now = new Date().toISOString();
  const isGuest = isGuestUser(session.user);
  const account = {
    createdAt: now,
    lastLoginAt: now,
    isGuest,
    password,
    user: { ...session.user },
    workspace: {
      ...session.workspace,
      ...(isGuest ? { name: 'Workspace huesped', slug: 'huesped' } : {}),
    },
  };
  return account;
}

function findLocalAccount(identifier, password) {
  const accounts = readAccounts();
  return accounts.find((account) => {
    const accountUsername = normalizeIdentifier(account.user?.username || '');
    const accountEmail = normalizeIdentifier(account.user?.email || '');
    return (
      (accountUsername === identifier || accountEmail === identifier) &&
      account.password === password
    );
  });
}

function upsertAccount(account) {
  const accounts = readAccounts();
  const nextAccounts = accounts.filter(
    (candidate) =>
      candidate.user?.id !== account.user.id &&
      normalizeIdentifier(candidate.user?.username || '') !==
        normalizeIdentifier(account.user.username || '') &&
      normalizeIdentifier(candidate.user?.email || '') !==
        normalizeIdentifier(account.user.email || ''),
  );
  writeAccounts([...nextAccounts, account]);
}

export function logoutAccount() {
  localStorage.removeItem(ACTIVE_SESSION_STORAGE_KEY);
  return ensureGuestSession();
}

export function deleteStoredAccount(session) {
  if (!session?.user?.id || !session?.workspace?.id || session.isGuest) {
    return logoutAccount();
  }

  const accounts = readAccounts().filter(
    (account) =>
      account.user?.id !== session.user.id &&
      account.workspace?.id !== session.workspace.id,
  );
  writeAccounts(accounts);

  const workspaceDocuments = readWorkspaceDocuments();
  delete workspaceDocuments[session.workspace.id];
  writeWorkspaceDocuments(workspaceDocuments);

  localStorage.removeItem(ACTIVE_SESSION_STORAGE_KEY);
  return ensureGuestSession();
}

export function filterDocumentsForWorkspace(documents, workspaceId) {
  if (!workspaceId) return [];

  const knownDocumentIds = new Set(getWorkspaceDocumentIds(workspaceId));
  return documents.filter((document) => {
    const documentWorkspaceId = getDocumentWorkspaceId(document);
    if (documentWorkspaceId) {
      return documentWorkspaceId === workspaceId;
    }

    const documentId = getDocumentId(document);
    return documentId ? knownDocumentIds.has(documentId) : false;
  });
}

export function getDocumentId(document) {
  return (
    document?.document_id ||
    document?.id ||
    document?.metadata?.document_id ||
    document?.metadata?.id ||
    ''
  );
}

export function rememberWorkspaceDocument(workspaceId, documentId) {
  if (!workspaceId || !documentId) return;

  const workspaceDocuments = readWorkspaceDocuments();
  const currentIds = workspaceDocuments[workspaceId] || [];
  if (currentIds.includes(documentId)) return;

  writeWorkspaceDocuments({
    ...workspaceDocuments,
    [workspaceId]: [...currentIds, documentId],
  });
}

export function forgetWorkspaceDocument(workspaceId, documentId) {
  if (!workspaceId || !documentId) return;

  const workspaceDocuments = readWorkspaceDocuments();
  const nextIds = (workspaceDocuments[workspaceId] || []).filter((id) => id !== documentId);
  writeWorkspaceDocuments({
    ...workspaceDocuments,
    [workspaceId]: nextIds,
  });
}

function rememberSession(account) {
  const session = publicSession(account);
  localStorage.setItem(ACTIVE_SESSION_STORAGE_KEY, JSON.stringify(session));
  return session;
}

function publicSession(account) {
  return {
    isGuest: Boolean(account.isGuest) || isGuestUser(account.user),
    user: { ...account.user },
    workspace: { ...account.workspace },
  };
}

function ensureGuestSession() {
  const accounts = readAccounts();
  const existingGuest = accounts.find((account) => account.isGuest || isGuestUser(account.user));
  const guestAccount = existingGuest || createGuestAccount();

  if (!existingGuest) {
    writeAccounts([...accounts, guestAccount]);
  }

  ensureWorkspaceDocuments(guestAccount.workspace.id);
  return rememberSession(guestAccount);
}

function createGuestAccount() {
  const now = new Date().toISOString();
  return {
    createdAt: now,
    isGuest: true,
    lastLoginAt: now,
    password: GUEST_PASSWORD,
    user: {
      id: GUEST_USER_ID,
      email: GUEST_EMAIL,
      firstName: '',
      lastName: '',
      locale: 'es-MX',
      username: GUEST_USERNAME,
    },
    workspace: {
      id: GUEST_WORKSPACE_ID,
      createdAt: now,
      defaultLanguage: 'es-MX',
      name: 'Workspace huesped',
      ownerId: GUEST_USER_ID,
      slug: 'huesped',
      status: 'active',
      updatedAt: now,
    },
  };
}

function isGuestUser(user) {
  return (
    normalizeIdentifier(user?.username || '') === GUEST_USERNAME ||
    normalizeIdentifier(user?.email || '') === GUEST_EMAIL
  );
}

function ensureWorkspaceDocuments(workspaceId) {
  const workspaceDocuments = readWorkspaceDocuments();
  if (workspaceDocuments[workspaceId]) return;

  writeWorkspaceDocuments({
    ...workspaceDocuments,
    [workspaceId]: [],
  });
}

function getWorkspaceDocumentIds(workspaceId) {
  return readWorkspaceDocuments()[workspaceId] || [];
}

function getDocumentWorkspaceId(document) {
  return (
    document?.workspace_id ||
    document?.workspaceId ||
    document?.workspace?.id ||
    document?.metadata?.workspace_id ||
    document?.metadata?.workspaceId ||
    document?.graph_space?.workspace_id ||
    document?.graphSpace?.workspaceId ||
    ''
  );
}

function readAccounts() {
  const accounts = readJson(ACCOUNTS_STORAGE_KEY, []);
  return Array.isArray(accounts) ? accounts : [];
}

function writeAccounts(accounts) {
  localStorage.setItem(ACCOUNTS_STORAGE_KEY, JSON.stringify(accounts));
}

function readWorkspaceDocuments() {
  const workspaceDocuments = readJson(WORKSPACE_DOCUMENTS_STORAGE_KEY, {});
  return workspaceDocuments && typeof workspaceDocuments === 'object' ? workspaceDocuments : {};
}

function writeWorkspaceDocuments(workspaceDocuments) {
  localStorage.setItem(WORKSPACE_DOCUMENTS_STORAGE_KEY, JSON.stringify(workspaceDocuments));
}

function migrateWorkspaceDocuments(previousWorkspaceId, nextWorkspaceId) {
  if (!previousWorkspaceId || !nextWorkspaceId || previousWorkspaceId === nextWorkspaceId) return;

  const workspaceDocuments = readWorkspaceDocuments();
  const previousIds = workspaceDocuments[previousWorkspaceId] || [];
  if (!previousIds.length) return;

  const nextIds = new Set([...(workspaceDocuments[nextWorkspaceId] || []), ...previousIds]);
  const nextWorkspaceDocuments = {
    ...workspaceDocuments,
    [nextWorkspaceId]: [...nextIds],
  };
  delete nextWorkspaceDocuments[previousWorkspaceId];
  writeWorkspaceDocuments(nextWorkspaceDocuments);
}

function readJson(key, fallback) {
  try {
    const rawValue = localStorage.getItem(key);
    return rawValue ? JSON.parse(rawValue) : fallback;
  } catch {
    return fallback;
  }
}

function normalizeIdentifier(value) {
  return value.trim().toLowerCase();
}
