import React from 'react'
import PokemonCard from './PokemonCard'

function PokemonGrid({ listPoke, setPokeClick, buscarPokemones }) {
    return (
      <div className="pokemon-grid">
        {listPoke.map(pokemon => (
          <PokemonCard key={pokemon.numero_pokedex} pokemon={pokemon} setPokeClick={setPokeClick} buscarPokemones={buscarPokemones}/>
        ))}
      </div>
    );
  }
  

export default PokemonGrid