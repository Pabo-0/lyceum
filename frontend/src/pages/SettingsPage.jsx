export default function SettingsPage({
  onThemeChange,
  theme,
}) {
  return (
    <section className="settings-page" aria-label="Ajustes">
      <div className="settings-shell">
        <header className="settings-header">
          <p className="eyebrow">Preferencias</p>
          <h1>Ajustes</h1>
        </header>

        <div className="settings-list">
          <section className="settings-group" aria-labelledby="appearance-settings">
            <div className="settings-copy">
              <h2 id="appearance-settings">Apariencia</h2>
              <p>Modo de color de la interfaz.</p>
            </div>
            <div className="settings-segmented" aria-label="Tema">
              <button
                aria-pressed={theme === 'light'}
                className={theme === 'light' ? 'selected' : ''}
                onClick={() => onThemeChange('light')}
                type="button"
              >
                Claro
              </button>
              <button
                aria-pressed={theme === 'dark'}
                className={theme === 'dark' ? 'selected' : ''}
                onClick={() => onThemeChange('dark')}
                type="button"
              >
                Oscuro
              </button>
            </div>
          </section>
        </div>
      </div>
    </section>
  );
}
