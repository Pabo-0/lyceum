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

export function uploadDocument(file) {
  const body = new FormData();
  body.append('file', file);
  return request('/documents/', {
    method: 'POST',
    body,
  });
}
