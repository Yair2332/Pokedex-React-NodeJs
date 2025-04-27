import React, { useEffect } from 'react';

function Theme({darkMode, setDarkMode}) {

  useEffect(() => {
    // Verificar preferencia al cargar
    const savedMode = localStorage.getItem('darkMode') === 'enabled';
    setDarkMode(savedMode);
    
    if (savedMode) {
      document.body.classList.add('dark-mode');
    }
  }, []);

  const toggleDarkMode = () => {
    const newMode = !darkMode;
    setDarkMode(newMode);
    
    if (newMode) {
      document.body.classList.add('dark-mode');
      localStorage.setItem('darkMode', 'enabled');
    } else {
      document.body.classList.remove('dark-mode');
      localStorage.setItem('darkMode', 'disabled');
    }
  };

  return (
    <button 
      className="dark-mode-toggle" 
      onClick={toggleDarkMode}
      aria-label="Toggle dark mode"
    >
      <i className={darkMode ? "fas fa-sun" : "fas fa-moon"}></i>
    </button>
  );
}

export default Theme;