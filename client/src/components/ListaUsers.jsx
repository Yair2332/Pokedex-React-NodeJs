import axios from 'axios';
import React, { useEffect, useState } from 'react';

const ListaUsers = () => {
    const [users, setUsers] = useState([]);

    useEffect(() => {
        const buscarUsuario = async () => {
            try {
                const response = await axios.post('http://localhost:3001/user', { id: "" });
                if (response.data) {
                    setUsers(response.data);
                }
            } catch (error) {
                console.error('Error al buscar usuarios:', error);
            }
        };
        buscarUsuario();
    }, []);

    const getPokemonImageUrl = (num) => {
        const numero = num.toString().padStart(3, '0');
        return `https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${parseInt(numero)}.png`;
    };

    return (
        <div className="container p-0">
            <h2 className="text-center mb-4 fw-bold text-primary-emphasis">Entrenadores Pokémon</h2>
            <div className="row g-4">
                {users.map((user, idx) => (
                    <div className="col-12 col-sm-6 col-md-4 col-lg-3" key={idx}>
                        <div className="card user-card shadow-sm border-0 rounded-4 text-center h-100 p-3">
                            <img
                                src={`./assets/personaje${user.skin}.png`}
                                alt={user.user}
                                className="mx-auto d-block"
                                style={{ maxHeight: "80px", objectFit: "contain" }}
                            />
                            <h5 className="mt-3 mb-2 fw-semibold">{user.user}</h5>
                            <div className="d-flex justify-content-center flex-wrap gap-2">
                                {user.equipo.split(',').map((pokeId, i) => (
                                    <img
                                        key={i}
                                        src={getPokemonImageUrl(pokeId)}
                                        alt={`Pokemon ${pokeId}`}
                                        width={50}
                                        height={50}
                                        className="rounded-circle border"
                                        style={{ backgroundColor: "#f8f9fa", padding: "4px" }}
                                        title={`#${pokeId}`}
                                    />
                                ))}
                            </div>
                        </div>
                    </div>
                ))}
            </div>

           
        </div>
    );
};

export default ListaUsers;