import React from 'react';
import { render } from 'react-dom';
import { Link } from 'react-router-dom';
import { requestPokemon } from '../../actions/pokemon_actions';

export const PokemonIndexItem = (props) => {
    
    return (
        <li>
            <Link to={`/pokemon/${props.pokemon.id}`} >
                <img src={props.pokemon.imageUrl} height="30" width="30"></img>
                {props.pokemon.name}
            </Link>
        </li>
    )

};
