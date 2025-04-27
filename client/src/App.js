import { useEffect, useState } from 'react';
import './App.css';
import Filtro from './components/Filtro';
import ModalPokemon from './components/ModalPokemon';
import Navbar from './components/Navbar';
import Paginacion from './components/Paginacion';
import PokemonGrid from './components/PokemonGrid';
import Theme from './components/Theme';
import axios from "axios";

function App() {
  const [listPoke, setListPoke] = useState([])
  const [pokeSelect, setPokeSelect] = useState("")
  const [favoritos, setFavoritos] = useState(false)
  const [pokeClick, setPokeClick] = useState("006")
  const [darkMode, setDarkMode] = useState(false);

  const buscarPokemones = async () => {
    try {
      let response = ""

      if (pokeSelect) {
        response = await axios.post('http://localhost:3001/pokemonesPorNombre', { nombre: pokeSelect, favoritos:favoritos});
      } else {
        response = await axios.post('http://localhost:3001/pokemones', {favoritos:favoritos});
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

  return (
    <div className="App">

      <Navbar />
      <div class="container py-4">

        <Filtro setPokeSelect={setPokeSelect} favoritos={favoritos} setFavoritos={setFavoritos} setListPoke={setListPoke}/>
        <PokemonGrid listPoke={listPoke} setPokeClick={setPokeClick} buscarPokemones={buscarPokemones}/>
        {/*<Paginacion />*/}

      </div>

      <ModalPokemon pokeClick={pokeClick} darkMode={darkMode} listPoke={listPoke} buscarPokemones={buscarPokemones}/>
      <Theme darkMode={darkMode} setDarkMode={setDarkMode}/>
    </div>
  );
}

export default App;
