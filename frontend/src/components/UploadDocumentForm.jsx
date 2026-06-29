import { useState } from 'react';

export default function UploadDocumentForm({
  buttonLabel = 'Procesar documento',
  compact = false,
  onUploadDocument,
  uploadStatus,
}) {
  const [file, setFile] = useState(null);

  async function handleSubmit(event) {
    event.preventDefault();
    if (!file) return;
    await onUploadDocument(file);
    setFile(null);
    event.currentTarget.reset();
  }

  return (
    <form
      className={compact ? 'upload-form compact' : 'upload-form'}
      onSubmit={handleSubmit}
    >
      <label className="file-picker">
        <span>{file ? file.name : 'Seleccionar .txt o .md'}</span>
        <input
          accept=".txt,.md"
          onChange={(event) => setFile(event.target.files?.[0] || null)}
          type="file"
        />
      </label>
      <button
        className="primary-button"
        disabled={!file || uploadStatus === 'uploading'}
        type="submit"
      >
        {uploadStatus === 'uploading' ? 'Procesando...' : buttonLabel}
      </button>
    </form>
  );
}
