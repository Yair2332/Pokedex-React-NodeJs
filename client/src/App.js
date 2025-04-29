import React, { useEffect, useState } from 'react';
import './login.css';
import './App.css';
import LoginForm from './components/LoginForm';
import Navbar from './components/Navbar';
import RegisterForm from './components/RegisterForm';
import PaginaPrincipal from './components/PaginaPrincipal';


function App() {
  const [showRegister, setShowRegister] = useState(false);
  const [registrado, setRegistrado] = useState(false);
  const [idUser, setIdUser] = useState(false);

  useEffect(() => {
    const storedId = localStorage.getItem('userId');
    if (storedId) {
      setIdUser(storedId);
      setRegistrado(true);
    }
  }, []);


  return (
    <>

      <Navbar setRegistrado={setRegistrado} registrado={registrado}/>

      {registrado === false &&

        <div className="pokemon-container m-auto">
          {!showRegister ? (
            <LoginForm onShowRegister={() => setShowRegister(true)}  setIdUser={setIdUser} setRegistrado={setRegistrado}/>
          ) : (
            <RegisterForm onShowLogin={() => setShowRegister(false)} />
          )}
        </div>

      }

      {registrado && <PaginaPrincipal id={idUser} />}

    </>
  );
}

export default App;

