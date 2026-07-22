const API_BASE_URL = import.meta.env.VITE_API_BASE_URL || '/api';

async function request(path, options = {}) {
  const { context, headers, ...fetchOptions } = options;
  const isFormData = options.body instanceof FormData;
  const response = await fetch(`${API_BASE_URL}${path}`, {
    ...fetchOptions,
    headers: {
      Accept: 'application/json',
      ...(options.body && !isFormData ? { 'Content-Type': 'application/json' } : {}),
      ...contextHeaders(context),
      ...headers,
    },
  });

  const data = await response.json().catch(() => ({}));
  if (!response.ok) {
    throw new Error(data.error || `Request failed with status ${response.status}`);
  }
  return data;
}

export function listDocuments(context) {
  return request('/documents/', { context });
}

export function signupUser(payload) {
  return request('/users/signup/', {
    method: 'POST',
    body: JSON.stringify(payload),
  });
}

export function loginUser(payload) {
  return request('/users/login/', {
    method: 'POST',
    body: JSON.stringify(payload),
  });
}

export function syncUserSession(payload) {
  return request('/users/sync/', {
    method: 'POST',
    body: JSON.stringify(payload),
  });
}

export function deleteAccount(context) {
  return request('/users/account/', {
    context,
    method: 'DELETE',
  });
}

export function getDocumentGraph(documentId, context) {
  return request(`/documents/${documentId}/graph/`, { context });
}

export function deleteDocument(documentId, context) {
  return request(`/documents/${documentId}/`, {
    context,
    method: 'DELETE',
  });
}

export function updateDocument(documentId, payload, context) {
  return request(`/documents/${documentId}/`, {
    context,
    method: 'PATCH',
    body: JSON.stringify(payload),
  });
}

export function uploadDocument(file, context) {
  const body = new FormData();
  body.append('file', file);
  return request('/documents/', {
    context,
    method: 'POST',
    body,
  });
}

export function createNode(documentId, payload, context) {
  return request(`/documents/${documentId}/nodes/`, {
    context,
    method: 'POST',
    body: JSON.stringify(payload),
  });
}

export function updateNode(nodeId, properties, context) {
  const payload =
    properties && ('properties' in properties || 'labels' in properties)
      ? properties
      : { properties };
  return request(`/nodes/${encodeURIComponent(nodeId)}/`, {
    context,
    method: 'PATCH',
    body: JSON.stringify(payload),
  });
}

export function deleteNode(nodeId, context) {
  return request(`/nodes/${encodeURIComponent(nodeId)}/`, {
    context,
    method: 'DELETE',
  });
}

export function createRelationship(documentId, payload, context) {
  return request(`/documents/${documentId}/relationships/`, {
    context,
    method: 'POST',
    body: JSON.stringify(payload),
  });
}

export function updateRelationship(relationshipId, payload, context) {
  return request(`/relationships/${encodeURIComponent(relationshipId)}/`, {
    context,
    method: 'PATCH',
    body: JSON.stringify(payload),
  });
}

export function deleteRelationship(relationshipId, context) {
  return request(`/relationships/${encodeURIComponent(relationshipId)}/`, {
    context,
    method: 'DELETE',
  });
}

export function mergeNodes(documentId, payload, context) {
  return request(`/documents/${documentId}/nodes/merge/`, {
    context,
    method: 'POST',
    body: JSON.stringify(payload),
  });
}

export function saveNodePosition(documentId, payload, context) {
  return request(`/documents/${documentId}/node-positions/`, {
    context,
    method: 'POST',
    body: JSON.stringify(payload),
  });
}

export function resetNodePositions(documentId, context) {
  return request(`/documents/${documentId}/node-positions/`, {
    context,
    method: 'DELETE',
  });
}

function contextHeaders(context) {
  if (!context) return {};

  return {
    ...(context.userId ? { 'X-Lyceum-User-Id': context.userId } : {}),
    ...(context.workspaceId ? { 'X-Lyceum-Workspace-Id': context.workspaceId } : {}),
  };
}
