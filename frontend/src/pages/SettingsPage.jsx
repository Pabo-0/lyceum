export default function SettingsPage({
  onClose,
  onLogout,
  onOpenAccount,
  onRequestDeleteAccount,
  session,
}) {
  const user = session?.user;
  const workspace = session?.workspace;
  const isGuest = Boolean(session?.isGuest);

  return (
    <section className="settings-page" aria-label="Ajustes">
      <div className="settings-panel">
        <div className="settings-header">
          <div>
            <p className="eyebrow">{isGuest ? 'Modo de prueba' : 'Cuenta'}</p>
            <h1>{isGuest ? 'Cuenta huesped' : user?.username}</h1>
          </div>
          <div className="settings-header-actions">
            <button
              aria-label={isGuest ? 'Iniciar sesion' : 'Cerrar sesion'}
              className="settings-icon-button"
              onClick={isGuest ? onOpenAccount : onLogout}
              title={isGuest ? 'Iniciar sesion' : 'Cerrar sesion'}
              type="button"
            >
              {isGuest ? <LoginIcon /> : <LogoutIcon />}
            </button>
            <button
              aria-label="Cerrar ajustes"
              className="settings-icon-button"
              onClick={onClose}
              title="Cerrar ajustes"
              type="button"
            >
              <CloseMarkIcon />
            </button>
          </div>
        </div>

        <dl className="settings-list">
          <div>
            <dt>Email</dt>
            <dd>{user?.email}</dd>
          </div>
          <div>
            <dt>Workspace</dt>
            <dd>{workspace?.name}</dd>
          </div>
          <div>
            <dt>Idioma</dt>
            <dd>{workspace?.defaultLanguage}</dd>
          </div>
        </dl>

        {isGuest ? null : (
          <button className="danger-button settings-delete-account" onClick={onRequestDeleteAccount} type="button">
            Borrar la cuenta
          </button>
        )}
      </div>
    </section>
  );
}

function CloseMarkIcon() {
  return (
    <svg aria-hidden="true" className="settings-action-icon" focusable="false" viewBox="0 0 24 24">
      <path d="M6 6l12 12" />
      <path d="M18 6L6 18" />
    </svg>
  );
}

function LogoutIcon() {
  return (
    <svg aria-hidden="true" className="settings-action-icon" focusable="false" viewBox="0 0 24 24">
      <path d="M10 17l5-5-5-5" />
      <path d="M15 12H3" />
      <path d="M21 3v18" />
    </svg>
  );
}

function LoginIcon() {
  return (
    <svg aria-hidden="true" className="settings-action-icon" focusable="false" viewBox="0 0 24 24">
      <path d="M14 7l5 5-5 5" />
      <path d="M19 12H7" />
      <path d="M3 3v18" />
    </svg>
  );
}
