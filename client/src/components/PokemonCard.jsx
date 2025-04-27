import axios from 'axios';

function PokemonCard({ pokemon, setPokeClick, buscarPokemones }) {

    const actualizarPokemon = async () => {
        try {
            const pokeId= pokemon.numero_pokedex;
            const isFav= pokemon.favorito===1? 0 :1
            const response = await axios.post('http://localhost:3001/actualizar-favorito', {pokemonId: pokeId, esFavorito: isFav});
            if (response.status===200) {
                buscarPokemones()
            }
            
        } catch (error) {
            console.error(error);
        }
    };

    
    // Carta de pokemon
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

            <button type="button" className="modal-close-btn" style={{ left: "20px" }} onClick={()=>{actualizarPokemon()}}>
                <i className={`fas fa-star ${pokemon.favorito === 1 ? 'text-warning' : 'text-white'}`}></i>
            </button>

            <div className="pokemon-info">
                <h3 className="pokemon-name">{pokemon.nombre}</h3>

                <div className="pokemon-types">
                    <span className="pokemon-type" style={{ backgroundColor: pokemon.tipo1_color }}>{pokemon.tipo1_nombre}</span>
                    {pokemon.tipo2_nombre && <span className="pokemon-type" style={{ backgroundColor: pokemon.tipo2_color }}>{pokemon.tipo2_nombre}</span>}
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