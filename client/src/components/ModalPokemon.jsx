import React, { useEffect, useState } from 'react';
import axios from 'axios';

function ModalPokemon({ pokeClick, darkMode, listPoke, buscarPokemones, equipoActu, setEquipoActu, userId }) {

    const [pokemon, setPokemon] = useState(null);

    const buscarPokemon = async () => {
        try {
            const response = await axios.post('http://localhost:3001/pokemonModal', {
                numero_pokedex: pokeClick,
            });
            if (response.data) {
                setPokemon(response.data);
            }
        } catch (error) {
            console.error(error);
        }
    };

    useEffect(() => {
        if (pokeClick) {
            buscarPokemon();
        }
    }, [pokeClick, darkMode, listPoke]);



    const actualizarPokemon = async () => {
        try {
            const pokeId = pokemon.numero_pokedex;
            const isFav = pokemon.favorito === 1 ? 0 : 1
            const response = await axios.post('http://localhost:3001/actualizar-favorito', { pokemonId: pokeId, esFavorito: isFav });
            if (response.status === 200) {
                buscarPokemones()
            }

        } catch (error) {
            console.error(error);
        }
    };


    const agregarPokeEquipo = async (numero_pokedex) => {
        try {
            const equipoActual = equipoActu ? equipoActu.split(',') : [];

            if (equipoActual.length >= 6) {
                alert("¡Equipo lleno!");
                return;
            }
            if (equipoActual.includes(numero_pokedex)) {
                alert("¡Pokémon repetido!");
                return;
            }

            const nuevoEquipoStr = equipoActu
                ? `${equipoActu},${numero_pokedex}`
                : numero_pokedex;

            setEquipoActu(nuevoEquipoStr); // Actualiza el estado local
            await axios.post('http://localhost:3001/actuEquipo', {
                id: userId,
                equipo: nuevoEquipoStr
            });

        } catch (error) {
            console.error(error);
            alert("Error al agregar");
        }
    };


    const [catchMessage, setCatchMessage] = useState(null);
    const [rotation, setRotation] = useState(0);
    const [isAnimating, setIsAnimating] = useState(false);
    const [canCatch, setCanCatch] = useState(true); // Nuevo estado para controlar

    const [pokemonAnimation, setPokemonAnimation] = useState('');

const handleCatchPokemon = () => {
    if (!canCatch) return;
    
    setCanCatch(false);
    const opciones = [1, 1, 2, 2, 2, 1, 2, 3];
    const shakes = opciones[Math.floor(Math.random() * opciones.length)];

    setIsAnimating(true);
    setPokemonAnimation('shake'); // Animación base de intento de captura

    let rotaciones = [-70, 70, -70];
    let pasos = rotaciones.slice(0, shakes);

    pasos.forEach((rot, i) => {
        setTimeout(() => setRotation(rot), i * 300);
    });

    setTimeout(() => {
        setIsAnimating(false);
        setRotation(0);
        if (shakes === 3) {
            // Animación de éxito
            setPokemonAnimation('success');
            setCatchMessage('¡Se atrapó el Pokémon éxitosamente!');
            setTimeout(() => {
                setPokemonAnimation('');
                setCatchMessage(null);
                setCanCatch(true);
                agregarPokeEquipo(pokemon.numero_pokedex);
            }, 3000);
        } else {
            // Animación de fracaso
            setPokemonAnimation('escape');
            setCatchMessage('¡Ups! El Pokémon se escapó.');
            setTimeout(() => {
                setPokemonAnimation('');
                setCatchMessage(null);
                setCanCatch(true);
            }, 1000);
        }
    }, pasos.length * 300);
};



    if (!pokemon) return null;



    const evolutionChain = [
        { num: pokemon.numero_pokedex, nombre: pokemon.nombre, img: pokemon.img },
        { num: pokemon.evo1_numero, nombre: pokemon.evo1_nombre, img: pokemon.evo1_img },
        { num: pokemon.evo2_numero, nombre: pokemon.evo2_nombre, img: pokemon.evo2_img },
    ]
        .filter(p => p.num != null)
        .sort((a, b) => a.num - b.num);

    return (
        <>
            <div className="modal fade pokemon-modal" id="pokemonModal" tabIndex="-1" aria-hidden="true">
                <div className="modal-dialog modal-dialog-centered modal-lg">
                    <div className={`modal-content ${darkMode ? 'bg-dark text-white' : 'bg-white text-dark'}`}>
                        <div
                            className="pokemon-modal-bg"
                            style={{ background: pokemon.tipo1_color || 'var(--grass)' }}
                        ></div>

                        <button type="button" className="modal-close-btn" data-bs-dismiss="modal" aria-label="Close">
                            <i className="fas fa-times"></i>
                        </button>

                        <button type="button" className="modal-close-btn" onClick={() => { actualizarPokemon() }} style={{ left: "20px" }} >
                            <i className={`fas fa-star ${pokemon.favorito === 1 ? 'text-warning' : 'text-white'}`}></i>
                        </button>



                        <div
                            className={`pokemon-modal-img-container ${pokemonAnimation}`}
                        >
                            <img
                                id="modalPokemonImg"
                                src={pokemon.img}
                                className="pokemon-modal-img"
                                alt={pokemon.nombre}
                                style={{
                                    transform: pokemonAnimation === 'shake' ? 'scale(1.1)' : 'scale(1)',
                                    transition: 'transform 0.3s'
                                }}
                            />
                        </div>

                        <div className="pokemon-modal-info">
                            <h2 id="modalPokemonName" className="pokemon-modal-name">{pokemon.nombre}</h2>
                            <span id="modalPokemonId" className="pokemon-modal-id">#{pokemon.numero_pokedex}</span>

                            <button
                                type="button"
                                className="modal-close-pokebola"
                                onClick={handleCatchPokemon}
                                style={{
                                    top: "80px",
                                    left: "20px",
                                    transition: "transform 0.3s",
                                    transform: `rotate(${rotation}deg)`,
                                    pointerEvents: isAnimating || !canCatch ? "none" : "auto",
                                    opacity: canCatch ? 1 : 0.5 // Cambia la opacidad cuando no se puede usar
                                }}
                                disabled={isAnimating || !canCatch}
                            >
                                <img
                                    src="https://cdn.pixabay.com/photo/2016/07/23/13/21/pokemon-1536855_1280.png"
                                    alt="Pokéball"
                                    style={{ width: "40px", height: "40px", borderRadius: "50%" }}
                                />
                            </button>



                            {catchMessage && (
                                <div style={{
                                    position: 'relative',
                                    bottom: '20px',
                                    left: '50%',
                                    marginTop: "10px",
                                    transform: 'translateX(-50%)',
                                    backgroundColor: catchMessage.includes('éxito') ? 'green' : 'red',
                                    color: 'white',
                                    padding: '10px',
                                    borderRadius: '5px',
                                    zIndex: 1000,
                                }}>
                                    {catchMessage}
                                </div>
                            )}

                            <div className="pokemon-modal-types" id="modalPokemonTypes">
                                <span
                                    className="pokemon-modal-type"
                                    style={{ backgroundColor: pokemon.tipo1_color }}
                                >
                                    {pokemon.tipo1_nombre}
                                </span>
                                {pokemon.tipo2_nombre && (
                                    <span
                                        className="pokemon-modal-type"
                                        style={{ backgroundColor: pokemon.tipo2_color }}
                                    >
                                        {pokemon.tipo2_nombre}
                                    </span>
                                )}
                            </div>

                            <div className="pokemon-modal-details">
                                <div className="detail-item">
                                    <div className="detail-value">{pokemon.peso} kg</div>
                                    <div className="detail-label">Peso</div>
                                </div>
                                <div className="detail-item">
                                    <div className="detail-value">{pokemon.altura} m</div>
                                    <div className="detail-label">Altura</div>
                                </div>
                                <div className="detail-item">
                                    <div className="detail-value">{pokemon.poder}</div>
                                    <div className="detail-label">Poder</div>
                                </div>
                                <div className="detail-item">
                                    <div className="detail-value">{pokemon.categoria}</div>
                                    <div className="detail-label">Categoría</div>
                                </div>
                                <div className="detail-item">
                                    <div className="detail-value">{pokemon.habilidad}</div>
                                    <div className="detail-label">Habilidad</div>
                                </div>
                                <div className="detail-item">
                                    <div className="detail-value" id="modalPokemonGender">
                                        <i className="fas fa-mars" style={{ color: "#6890F0" }}></i>
                                        <i className="fas fa-venus" style={{ color: "#F85888" }}></i>
                                    </div>
                                    <div className="detail-label">Género</div>
                                </div>
                            </div>

                            <div className="pokemon-modal-stats detail-item">
                                <h5 className="stats-title"><i className="fas fa-file-alt"></i> Data </h5>
                                <p className='stat-name text-center'>{pokemon.descripcion}</p>
                            </div>

                            <div className="pokemon-modal-stats">
                                <h5 className="stats-title"><i className="fas fa-chart-line"></i> Estadísticas Base</h5>

                                <div className="stat-item">
                                    <div className="stat-info">
                                        <span className="stat-name">HP</span>
                                        <span className="stat-value">{pokemon.hp}</span>
                                    </div>
                                    <div className="progress">
                                        <div className="progress-bar bg-success" style={{ width: `${pokemon.hp}%` }}></div>
                                    </div>
                                </div>

                                <div className="stat-item">
                                    <div className="stat-info">
                                        <span className="stat-name">Ataque</span>
                                        <span className="stat-value">{pokemon.ataque}</span>
                                    </div>
                                    <div className="progress">
                                        <div className="progress-bar bg-danger" style={{ width: `${pokemon.ataque}%` }}></div>
                                    </div>
                                </div>

                                <div className="stat-item">
                                    <div className="stat-info">
                                        <span className="stat-name">Defensa</span>
                                        <span className="stat-value">{pokemon.defensa}</span>
                                    </div>
                                    <div className="progress">
                                        <div className="progress-bar bg-info" style={{ width: `${pokemon.defensa}%` }}></div>
                                    </div>
                                </div>

                                <div className="stat-item">
                                    <div className="stat-info">
                                        <span className="stat-name">Ataque Esp.</span>
                                        <span className="stat-value">{pokemon.ataque_especial}</span>
                                    </div>
                                    <div className="progress">
                                        <div className="progress-bar bg-warning" style={{ width: `${pokemon.ataque_especial}%` }}></div>
                                    </div>
                                </div>

                                <div className="stat-item">
                                    <div className="stat-info">
                                        <span className="stat-name">Defensa Esp.</span>
                                        <span className="stat-value">{pokemon.defensa_especial}</span>
                                    </div>
                                    <div className="progress">
                                        <div className="progress-bar bg-primary" style={{ width: `${pokemon.defensa_especial}%` }}></div>
                                    </div>
                                </div>

                                <div className="stat-item">
                                    <div className="stat-info">
                                        <span className="stat-name">Velocidad</span>
                                        <span className="stat-value">{pokemon.velocidad}</span>
                                    </div>
                                    <div className="progress">
                                        <div className="progress-bar bg-secondary" style={{ width: `${pokemon.velocidad}%` }}></div>
                                    </div>
                                </div>
                            </div>

                            <div className="evolutions-section">
                                <h5 className="evolutions-title"><i className="fas fa-code-branch"></i> Evoluciones</h5>
                                <div className="evolutions-container">
                                    {evolutionChain.map((poke, index) => (
                                        <React.Fragment key={poke.num}>
                                            <div className="evolution-item">
                                                <img src={poke.img} alt={poke.nombre} className="evolution-img" />
                                                <div className="evolution-name">{poke.nombre}</div>
                                            </div>
                                            {index < evolutionChain.length - 1 && (
                                                <div className="evolution-arrow">→</div>
                                            )}
                                        </React.Fragment>
                                    ))}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <button className="dark-mode-toggle" id="darkModeToggle">
                <i className="fas fa-moon"></i>
            </button>
        </>
    );
}

export default ModalPokemon;
