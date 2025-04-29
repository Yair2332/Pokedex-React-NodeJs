import axios from 'axios';

function PokemonCard({ pokemon, setPokeClick, buscarPokemones, favoritosUser, setFavoritosUser, idUser }) {
    // Verificar si el Pokémon está en los favoritos del usuario
    const isFavorite = favoritosUser && favoritosUser.split(',').includes(pokemon.numero_pokedex);

    const actualizarPokemon = async (e) => {
        e.stopPropagation(); // Evita que se active el click de la tarjeta
        try {
            setPokeClick(pokemon.numero_pokedex)
            const favoritosArray = favoritosUser ? favoritosUser.split(',') : [];
            const numeroActual = pokemon.numero_pokedex.toString();
    
            let nuevosFavoritosArray;
    
            if (favoritosArray.includes(numeroActual)) {
                // Si ya estaba, lo saco
                nuevosFavoritosArray = favoritosArray.filter(fav => fav !== numeroActual);
            } else {
                // Si no estaba, lo agrego
                nuevosFavoritosArray = [...favoritosArray, numeroActual];
            }
    
            const nuevosFavoritosString = nuevosFavoritosArray.join(',');
    
            // Actualizar en la base de datos
            await axios.post('http://localhost:3001/actualizar-favorito', {
                userId: idUser,
                nuevosFavoritos: nuevosFavoritosString
            });
    
            buscarPokemones()
            // Actualizar visualmente
            setFavoritosUser(nuevosFavoritosString);
    
        } catch (error) {
            console.error('Error al actualizar favorito:', error);
        }
        buscarPokemones()
    };

    return (
        <div className="pokemon-card"
            data-bs-toggle="modal"
            data-bs-target="#pokemonModal"
            data-pokemon={pokemon.nombre.toLowerCase()}
            onClick={() => { setPokeClick(pokemon.numero_pokedex) }}
        >
            <div className="pokemon-bg" style={{ backgroundColor: pokemon.tipo1_color }}></div>
            <span className="pokemon-id">#{pokemon.numero_pokedex}</span>

            <div className="pokemon-img-container">
                <img src={pokemon.img} className="pokemon-img" alt={pokemon.nombre} />
            </div>

            <button
                type="button"
                className="modal-close-btn"
                style={{ left: "20px" }}
                onClick={actualizarPokemon}
            >
                <i className={`fas fa-star ${isFavorite ? 'text-warning' : 'text-white'}`}></i>
            </button>

            <button type="button" className="modal-close-btn" style={{ top: "80px", left: "20px" }}>
                <img
                    src="https://cdn.pixabay.com/photo/2016/07/23/13/21/pokemon-1536855_1280.png"
                    alt=""
                    style={{ width: "40px", height: "40px", objectFit: "cover", borderRadius: "50%" }}
                />
            </button>

            <div className="pokemon-info">
                <h3 className="pokemon-name">{pokemon.nombre}</h3>

                <div className="pokemon-types">
                    <span className="pokemon-type" style={{ backgroundColor: pokemon.tipo1_color }}>
                        {pokemon.tipo1_nombre}
                    </span>
                    {pokemon.tipo2_nombre && (
                        <span className="pokemon-type" style={{ backgroundColor: pokemon.tipo2_color }}>
                            {pokemon.tipo2_nombre}
                        </span>
                    )}
                </div>

                <div className="pokemon-stats">
                    <div className="pokemon-stat">
                        <div className="pokemon-stat-value">{pokemon.peso} kg</div>
                        <div className="pokemon-stat-label">Peso</div>
                    </div>
                    <div className="pokemon-stat">
                        <div className="pokemon-stat-value">{pokemon.altura} m</div>
                        <div className="pokemon-stat-label">Altura</div>
                    </div>
                    <div className="pokemon-stat">
                        <div className="pokemon-stat-value">{pokemon.poder}</div>
                        <div className="pokemon-stat-label">Poder</div>
                    </div>
                </div>
            </div>
        </div>
    );
}

export default PokemonCard;