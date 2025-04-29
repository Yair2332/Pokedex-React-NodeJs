import axios from 'axios'
import React, { useEffect, useState } from 'react'
import ModalPokemon from './ModalPokemon'
import Theme from './Theme'
import PokemonGrid from './PokemonGrid'
import Filtro from './Filtro'
import Banner from './Banner'
import ListaUsers from './ListaUsers'

function PaginaPrincipal({ id }) {
    const [dataUser, setDataUser] = useState({});
    const [listPoke, setListPoke] = useState([])
    const [pokeSelect, setPokeSelect] = useState("")
    const [favoritos, setFavoritos] = useState(false)
    const [favoritosUser, setFavoritosUser] = useState(false)
    const [pokeClick, setPokeClick] = useState("006")
    const [darkMode, setDarkMode] = useState(false);
    const [userDataEquipo, setUserDataEquipo] = useState([]);
    const [equipoActu, setEquipoActu] = useState("");


    const buscarPokemones = async () => {
        try {
            let response = ""

            if (pokeSelect) {
                if (favoritos===false) {
                    response = await axios.post('http://localhost:3001/pokemonesPorNombre', { nombre: pokeSelect, favoritos: "" });
                }else{
                    response = await axios.post('http://localhost:3001/pokemonesPorNombre', { nombre: pokeSelect, favoritos: favoritosUser });
                }
                
            } else {
                if (favoritos===false) {
                    response = await axios.post('http://localhost:3001/pokemones', { favoritos: "" });
                }else{
                    response = await axios.post('http://localhost:3001/pokemones', { favoritos: favoritosUser });
                }
            }

            if (response.data) {
                setListPoke(response.data);
            } else {
                setListPoke([]);
            }
        } catch (error) {
            console.log(error);
        }
    };


    useEffect(() => {
        buscarPokemones()
    }, [pokeSelect, favoritos])


    useEffect(() => {
        const buscarUsuario = async () => {
            const response = await axios.post('http://localhost:3001/user', { id });
            if (response.data) {
                setDataUser(response.data);
                setFavoritosUser(response.data.favoritos)
            }
        };
        buscarUsuario();
    }, [id]);




    return (
        <div className="App">


            <div class="container py-4">

                <h1 className='nameUser p-1 pb-0 mb-0 rounded-3'>Bienvendo {dataUser?.user}</h1>
                <p className='text-secondary pb-0 mb-0 ms-1 text-decr'>Atrapa pokemones para aumentar a tu equipo, con un maximo de 6 miembros</p>
                <Banner
                    userId={id}
                    userDataEquipo={userDataEquipo}
                    setUserDataEquipo={setUserDataEquipo}
                    equipoActu={equipoActu}
                    setEquipoActu={setEquipoActu}
                    skin={dataUser.skin}
                />

                

                <Filtro setPokeSelect={setPokeSelect} favoritos={favoritos} setFavoritos={setFavoritos} setListPoke={setListPoke} favoritosUser={favoritosUser}/>
                <PokemonGrid listPoke={listPoke} setPokeClick={setPokeClick} buscarPokemones={buscarPokemones} favoritosUser={favoritosUser} idUser={id} setFavoritosUser={setFavoritosUser}/>
                {/*<Paginacion />*/}
                <ListaUsers/>

            </div>

            <ModalPokemon pokeClick={pokeClick} darkMode={darkMode} listPoke={listPoke} buscarPokemones={buscarPokemones} equipoActu={equipoActu} setEquipoActu={setEquipoActu} userId={id} favoritosUser={favoritosUser} setPokeClick={setPokeClick} setFavoritosUser={setFavoritosUser}/>
            <Theme darkMode={darkMode} setDarkMode={setDarkMode} />
        </div>
    );
}


export default PaginaPrincipal