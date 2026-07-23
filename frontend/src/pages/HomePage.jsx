import UploadDocumentForm from '../components/UploadDocumentForm.jsx';

export default function HomePage({
  onUploadDocument,
  session,
  status,
  uploadStatus,
}) {
  const workspaceName = session?.workspace?.name || 'Workspace';

  return (
    <section className="home-page" aria-label="Inicio">
      <div className="home-center">
        <h1>{workspaceName}</h1>
        <p className="home-copy">
          Sube un documento para crear un grafo dentro de tu workspace.
        </p>
        <UploadDocumentForm
          buttonLabel="Crear grafo"
          onUploadDocument={onUploadDocument}
          uploadStatus={uploadStatus}
        />
      </div>
    </section>
  );
}
