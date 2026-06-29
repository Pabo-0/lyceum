import UploadDocumentForm from '../components/UploadDocumentForm.jsx';

export default function HomePage({
  documentCount,
  onUploadDocument,
  status,
  uploadStatus,
}) {
  return (
    <section className="home-page" aria-label="Inicio">
      <div className="home-center">
        <h1>Lyceum</h1>
        <p className="home-copy">
          Sube un documento para convertirlo en un grafo navegable.
        </p>
        <UploadDocumentForm
          buttonLabel="Crear grafo"
          onUploadDocument={onUploadDocument}
          uploadStatus={uploadStatus}
        />
      </div>
    </section >
  );
}
