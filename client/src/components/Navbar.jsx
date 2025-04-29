import React from 'react';

function Navbar({ setRegistrado, registrado }) {
    const handleLogout = () => {
        setRegistrado(false);
        localStorage.setItem('userId', '');
    };

    return (
        <nav className="navbar navbar-expand-lg navbar-dark navbar-pokedex">
            <div className="container">
                <a className="navbar-brand" href="/">
                    <img src="https://raw.githubusercontent.com/PokeAPI/media/master/logo/pokeapi_256.png" alt="Pokedex" />
                    <p className='text-center mb-0'>Pokedex Premium</p>
                </a>
                <button className="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span className="navbar-toggler-icon"></span>
                </button>
                <div className="collapse navbar-collapse" id="navbarNav">
                    <ul className="navbar-nav ms-auto">
                        <li className="nav-item">
                            <a className="nav-link active" href="/">
                                <i className="fas fa-home me-1"></i> Inicio
                            </a>
                        </li>
                        {registrado && (
                            <li className="nav-item">
                                <button 
                                    className="nav-link active btn btn-link" 
                                    onClick={handleLogout}
                                    style={{ background: 'none', border: 'none' }}
                                >
                                    <i className="fas fa-sign-out-alt me-1"></i> Salir
                                </button>
                            </li>
                        )}
                    </ul>
                </div>
            </div>
        </nav>
    );
}

export default Navbar;