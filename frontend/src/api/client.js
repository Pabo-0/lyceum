const API_BASE_URL = import.meta.env.VITE_API_BASE_URL || '/api';

async function request(path, options = {}) {
  const isFormData = options.body instanceof FormData;
  const response = await fetch(`${API_BASE_URL}${path}`, {
    headers: {
      Accept: 'application/json',
      ...(options.body && !isFormData ? { 'Content-Type': 'application/json' } : {}),
      ...options.headers,
    },
    ...options,
  });

  const data = await response.json().catch(() => ({}));
  if (!response.ok) {
    throw new Error(data.error || `Request failed with status ${response.status}`);
  }
  return data;
}

export function listDocuments() {
  return request('/documents/');
}

export function getDocumentGraph(documentId) {
  return request(`/documents/${documentId}/graph/`);
}

export function deleteDocument(documentId) {
  return request(`/documents/${documentId}/`, {
    method: 'DELETE',
  });
}

export function updateDocument(documentId, payload) {
  return request(`/documents/${documentId}/`, {
    method: 'PATCH',
    body: JSON.stringify(payload),
  });
}

export function uploadDocument(file) {
  const body = new FormData();
  body.append('file', file);
  return request('/documents/', {
    method: 'POST',
    body,
  });
}

export function createNode(documentId, payload) {
  return request(`/documents/${documentId}/nodes/`, {
    method: 'POST',
    body: JSON.stringify(payload),
  });
}

export function updateNode(nodeId, properties) {
  const payload =
    properties && ('properties' in properties || 'labels' in properties)
      ? properties
      : { properties };
  return request(`/nodes/${encodeURIComponent(nodeId)}/`, {
    method: 'PATCH',
    body: JSON.stringify(payload),
  });
}

export function deleteNode(nodeId) {
  return request(`/nodes/${encodeURIComponent(nodeId)}/`, {
    method: 'DELETE',
  });
}

export function createRelationship(documentId, payload) {
  return request(`/documents/${documentId}/relationships/`, {
    method: 'POST',
    body: JSON.stringify(payload),
  });
}

export function updateRelationship(relationshipId, payload) {
  return request(`/relationships/${encodeURIComponent(relationshipId)}/`, {
    method: 'PATCH',
    body: JSON.stringify(payload),
  });
}

export function deleteRelationship(relationshipId) {
  return request(`/relationships/${encodeURIComponent(relationshipId)}/`, {
    method: 'DELETE',
  });
}

export function mergeNodes(documentId, payload) {
  return request(`/documents/${documentId}/nodes/merge/`, {
    method: 'POST',
    body: JSON.stringify(payload),
  });
}
