import React from 'react'

function Navbar() {
    return (
        <nav class="navbar navbar-expand-lg navbar-dark navbar-pokedex">
            <div class="container">
                <a class="navbar-brand" href="/">
                    <img src="https://raw.githubusercontent.com/PokeAPI/media/master/logo/pokeapi_256.png" alt="Pokedex"/>
                    <p className='text-center mb-0'>Pokedex Premium</p>
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link active" href="/"><i class="fas fa-home me-1"></i> Inicio</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    )
}

export default Navbar