import UploadDocumentForm from '../components/UploadDocumentForm.jsx';

export default function HomePage({
  documentCount,
  onUploadDocument,
  session,
  status,
  uploadStatus,
}) {
  const workspaceName = session?.workspace?.name || 'Workspace';
  const graphCountLabel =
    documentCount === 1 ? '1 grafo en este workspace' : `${documentCount} grafos en este workspace`;

  return (
    <section className="home-page" aria-label="Inicio">
      <div className="home-center">
        <p className="home-kicker">{session?.user?.username}</p>
        <h1>{workspaceName}</h1>
        <p className="home-copy">
          Sube un documento para crear un grafo dentro de tu workspace.
        </p>
        <p className="home-meta">{graphCountLabel}</p>
        <UploadDocumentForm
          buttonLabel="Crear grafo"
          onUploadDocument={onUploadDocument}
          uploadStatus={uploadStatus}
        />
      </div>
    </section>
  );
}
