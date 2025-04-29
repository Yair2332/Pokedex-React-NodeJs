import React from 'react'
import PokemonCard from './PokemonCard'

function PokemonGrid({ listPoke, setPokeClick, buscarPokemones, favoritosUser, idUser, setFavoritosUser }) {
    return (
      <div className="pokemon-grid">
        {listPoke.map(pokemon => (
          <PokemonCard key={pokemon.numero_pokedex} pokemon={pokemon} setPokeClick={setPokeClick} buscarPokemones={buscarPokemones} favoritosUser={favoritosUser} idUser={idUser} setFavoritosUser={setFavoritosUser}/>
        ))}
      </div>
    );
  }
  

export default PokemonGrid