import axios from 'axios';
import React, { useEffect, useState } from 'react';

function Banner({ userId, userDataEquipo, setUserDataEquipo, equipoActu, setEquipoActu, skin }) {
    // Calcular el margen dinámico con los valores exactos que proporcionaste
    const calcularMargen = () => {
        const count = userDataEquipo.length;
        if (count === 1) return -90;    // Margen para 1 Pokémon
        if (count === 2) return 10;     // Margen para 2 Pokémon
        if (count === 3) return -40;    // Margen para 3 Pokémon
        if (count === 4) return -40;    // Margen para 4 Pokémon
        if (count === 5) return -50;    // Margen para 5 Pokémon
        return -55;                     // Margen para 6 Pokémon
    };

    const margenPokemon = calcularMargen();

    useEffect(() => {
        const buscarEquipo = async () => {
            try {
                const response = await axios.post('http://localhost:3001/userEquipo', {
                    id: userId,
                });
                if (response.data) {
                    const numeros = response.data.map(p => p.numero_pokedex).join(",");
                    setEquipoActu(numeros);
                    setUserDataEquipo(response.data);
                }
            } catch (error) {
                console.error(error);
            }
        };
        buscarEquipo();
    }, [userId, equipoActu]);

    const eliminarPokeEquipo = async (numero_pokedex) => {
        try {
            const nuevoEquipo = equipoActu.split(',')
                .filter(num => num !== numero_pokedex)
                .join(',');

            setEquipoActu(nuevoEquipo);
            await axios.post('http://localhost:3001/actuEquipo', {
                id: userId,
                equipo: nuevoEquipo
            });
            setUserDataEquipo(prev => prev.filter(p => p.numero_pokedex !== numero_pokedex));
        } catch (error) {
            console.error("Error al eliminar Pokémon:", error);
            alert("Error al eliminar Pokémon");
        }
    };

    return (
        <div className="banner-entrenador">
            <div className="entrenador">
                <img src={`./assets/personaje${skin}.png`} alt="Entrenador" />
            </div>

            <div className="pokemon-team">
                {userDataEquipo.map((pokemon, index) => {
                    const idSinCeros = parseInt(pokemon.numero_pokedex);
                    const alturaPx = pokemon.altura * 100;
                    return (
                        <div 
                            className={`pokemon ${index === 4 ? "pokemonPequeño1" : index === 5 ? "pokemonPequeño2" : ""}`}
                            style={{
                                marginLeft: `${margenPokemon}px`,
                                zIndex: index === 4 || index === 5 ? 3 : 2
                            }}
                        >
                            <button className='eliminar btn' onClick={() => eliminarPokeEquipo(pokemon.numero_pokedex)}>
                                <i className="bi bi-trash3"></i>
                            </button>
                            <img
                                src={`https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${idSinCeros}.png`}
                                alt={`Pokemon ${idSinCeros}`}
                                style={{
                                    height: `${alturaPx}px`,
                                    maxHeight: '210px'
                                }}
                            />
                        </div>
                    );
                })}
            </div>
        </div>
    );
}

export default Banner;