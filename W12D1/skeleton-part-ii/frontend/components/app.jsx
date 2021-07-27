import { Route } from "react-router-dom";
import React from 'react';
import PokemonIndexContainer from "./pokemon/pokemon_index_container";
import PokemonDetailContainer from "./pokemon/pokemon_detail";

const App = () => (
    <div>
        <Route path="/pokemon/:pokemonId" component={PokemonDetailContainer}></Route>
        <Route path="/" component={PokemonIndexContainer}/>
    </div>
)

export default App;