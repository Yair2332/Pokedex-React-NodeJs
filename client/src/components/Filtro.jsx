import axios from 'axios';
import { useState } from 'react';

function Filtro({ setPokeSelect, favoritos, setFavoritos, setListPoke, favoritosUser }) {
    const [activeButton, setActiveButton] = useState('all'); // Estado para el botón activo (inicia con 'all')

    const buscarPokemon = async (tipoClick, buttonType) => {
        try {
            setActiveButton(buttonType); // Establece el botón activo
    
            let favFiltro = false;
    
            if (favoritos) { 
                favFiltro = favoritosUser; // Si favoritos está activo, mandamos los IDs favoritos
            }

    
            const response = await axios.post('http://localhost:3001/pokemonFiltro', {
                tipo: tipoClick,
                favoritos: favFiltro
            });
    
            if (response.data) {
                const dataPoke = response.data;
                setListPoke(dataPoke);
            }
        } catch (error) {
            console.error(error);
        }
    };
    
    


    return (
        <div className="filter-section">
            <div className="row">
                <div className="col-md-6">
                    <h5 className="filter-title"><i className="fas fa-filter"></i> Filtrar por Tipo</h5>
                    <div className="type-filter">
                        <button
                            className={`type-btn type-normal ${activeButton === 'all' ? 'active' : ''}`}
                            onClick={() => { buscarPokemon(19, 'all'); }}
                        >
                            <i className="fas fa-star"></i> Todos
                        </button>
                        <button
                            className={`type-btn type-fire ${activeButton === 'fire' ? 'active' : ''}`}
                            onClick={() => buscarPokemon(2, 'fire')}
                        >
                            <i className="fas fa-fire"></i> Fuego
                        </button>
                        <button
                            className={`type-btn type-water ${activeButton === 'water' ? 'active' : ''}`}
                            onClick={() => buscarPokemon(3, 'water')}
                        >
                            <i className="fas fa-tint"></i> Agua
                        </button>
                        <button
                            className={`type-btn type-grass ${activeButton === 'grass' ? 'active' : ''}`}
                            onClick={() => buscarPokemon(5, 'grass')}
                        >
                            <i className="fas fa-leaf"></i> Planta
                        </button>
                        <button
                            className={`type-btn type-electric ${activeButton === 'electric' ? 'active' : ''}`}
                            onClick={() => buscarPokemon(4, 'electric')}
                        >
                            <i className="fas fa-bolt"></i> Eléctrico
                        </button>
                        <button
                            className={`type-btn type-ice ${activeButton === 'ice' ? 'active' : ''}`}
                            onClick={() => buscarPokemon(6, 'ice')}
                        >
                            <i className="fas fa-snowflake"></i> Hielo
                        </button>
                        <button
                            className={`type-btn type-fighting ${activeButton === 'fighting' ? 'active' : ''}`}
                            onClick={() => buscarPokemon(7, 'fighting')}
                        >
                            <i className="fas fa-hand-fist"></i> Lucha
                        </button>
                        <button
                            className={`type-btn type-poison ${activeButton === 'poison' ? 'active' : ''}`}
                            onClick={() => buscarPokemon(8, 'poison')}
                        >
                            <i className="fas fa-skull-crossbones"></i> Veneno
                        </button>
                        <button
                            className={`type-btn type-ground ${activeButton === 'ground' ? 'active' : ''}`}
                            onClick={() => buscarPokemon(9, 'ground')}
                        >
                            <i className="fas fa-mountain"></i> Tierra
                        </button>
                        <button
                            className={`type-btn type-flying ${activeButton === 'flying' ? 'active' : ''}`}
                            onClick={() => buscarPokemon(10, 'flying')}
                        >
                            <i className="fas fa-dove"></i> Volador
                        </button>
                        <button
                            className={`type-btn type-psychic ${activeButton === 'psychic' ? 'active' : ''}`}
                            onClick={() => buscarPokemon(11, 'psychic')}
                        >
                            <i className="fas fa-brain"></i> Psíquico
                        </button>
                        <button
                            className={`type-btn type-bug ${activeButton === 'bug' ? 'active' : ''}`}
                            onClick={() => buscarPokemon(12, 'bug')}
                        >
                            <i className="fas fa-bug"></i> Bicho
                        </button>
                        <button
                            className={`type-btn type-rock ${activeButton === 'rock' ? 'active' : ''}`}
                            onClick={() => buscarPokemon(13, 'rock')}
                        >
                            <i className="fas fa-hill-rockslide"></i> Roca
                        </button>
                        <button
                            className={`type-btn type-ghost ${activeButton === 'ghost' ? 'active' : ''}`}
                            onClick={() => buscarPokemon(14, 'ghost')}
                        >
                            <i className="fas fa-ghost"></i> Fantasma
                        </button>
                        <button
                            className={`type-btn type-dragon ${activeButton === 'dragon' ? 'active' : ''}`}
                            onClick={() => buscarPokemon(15, 'dragon')}
                        >
                            <i className="fas fa-dragon"></i> Dragón
                        </button>
                        <button
                            className={`type-btn type-dark ${activeButton === 'dark' ? 'active' : ''}`}
                            onClick={() => buscarPokemon(16, 'dark')}
                        >
                            <i className="fas fa-moon"></i> Siniestro
                        </button>
                        <button
                            className={`type-btn type-steel ${activeButton === 'steel' ? 'active' : ''}`}
                            onClick={() => buscarPokemon(17, 'steel')}
                        >
                            <i className="fas fa-shield"></i> Acero
                        </button>
                        <button
                            className={`type-btn type-fairy ${activeButton === 'fairy' ? 'active' : ''}`}
                            onClick={() => buscarPokemon(18, 'fairy')}
                        >
                            <i className="fas fa-wand-magic-sparkles"></i> Hada
                        </button>
                    </div>
                </div>
                <div className="col-md-6">
                    <h5 className="filter-title"><i className="fas fa-search"></i> Buscar Pokémon</h5>
                    <div className="search-container">
                        <i className="fas fa-search search-icon"></i>
                        <input
                            type="text"
                            className="form-control search-input"
                            placeholder="Escribe el nombre..."
                            onChange={(event) => {
                                setPokeSelect(event.target.value);
                                setActiveButton('all')
                            }}
                        />
                    </div>
                    <div className="d-flex justify-content-between mt-2">
                        <div className="form-check form-switch">
                            <input
                                className="form-check-input"
                                type="checkbox"
                                id="favoritesOnly"
                                checked={favoritos}
                                onChange={(event) => {
                                    {
                                        setFavoritos(event.target.checked);
                                        setActiveButton('all')
                                    }
                                }}
                            />
                            <label className="form-check-label" htmlFor="favoritesOnly">Solo favoritos</label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    )
}

export default Filtro;