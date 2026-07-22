import { useEffect, useState } from 'react';

export default function AuthPage({
  mode,
  onLogin,
  onSignup,
  onSwitchMode,
}) {
  const isSignup = mode === 'signup';
  const [values, setValues] = useState({
    email: '',
    password: '',
    username: '',
  });
  const [formError, setFormError] = useState('');
  const [isSubmitting, setIsSubmitting] = useState(false);

  useEffect(() => {
    setFormError('');
    setValues({
      email: '',
      password: '',
      username: '',
    });
  }, [mode]);

  function updateValue(field, value) {
    setValues((current) => ({
      ...current,
      [field]: value,
    }));
  }

  async function handleSubmit(event) {
    event.preventDefault();
    setFormError('');

    try {
      setIsSubmitting(true);
      if (isSignup) {
        await onSignup(values);
      } else {
        await onLogin({
          username: values.username,
          password: values.password,
        });
      }
    } catch (error) {
      setFormError(error.message);
    } finally {
      setIsSubmitting(false);
    }
  }

  return (
    <section className="auth-page" aria-label={isSignup ? 'Crear cuenta' : 'Inicio de sesion'}>
      <div className="auth-card">
        <div className="auth-card-header">
          <div className="auth-brand">
            <span className="brand-mark">L</span>
            <span>Lyceum</span>
          </div>
          <p>Workspace personal</p>
        </div>

        <form className="auth-form" onSubmit={handleSubmit}>
          <h1>{isSignup ? 'Sign up' : 'Login'}</h1>

          <label className="auth-field">
            <span>Usuario</span>
            <input
              autoComplete="username"
              onChange={(event) => updateValue('username', event.target.value)}
              placeholder="Username"
              required
              type="text"
              value={values.username}
            />
          </label>

          {isSignup ? (
            <label className="auth-field">
              <span>Email</span>
              <input
                autoComplete="email"
                onChange={(event) => updateValue('email', event.target.value)}
                placeholder="Email"
                required
                type="email"
                value={values.email}
              />
            </label>
          ) : null}

          <label className="auth-field">
            <span>Contrasena</span>
            <input
              autoComplete={isSignup ? 'new-password' : 'current-password'}
              onChange={(event) => updateValue('password', event.target.value)}
              placeholder="Password"
              required
              type="password"
              value={values.password}
            />
          </label>

          {formError ? (
            <p className="auth-error" role="alert">
              {formError}
            </p>
          ) : null}

          <p className="auth-remember">La cuenta se recordara en este dispositivo.</p>

          <button className="primary-button auth-submit" disabled={isSubmitting} type="submit">
            {isSubmitting ? 'Entrando...' : isSignup ? 'Crear cuenta' : 'Ingresar'}
          </button>
        </form>

        <p className="auth-switch">
          {isSignup ? 'Ya tienes una cuenta?' : 'No tienes una cuenta?'}{' '}
          <button
            onClick={() => onSwitchMode(isSignup ? 'login' : 'signup')}
            type="button"
          >
            {isSignup ? 'Inicia sesion' : 'Crea una'}
          </button>
        </p>
      </div>
    </section>
  );
}
