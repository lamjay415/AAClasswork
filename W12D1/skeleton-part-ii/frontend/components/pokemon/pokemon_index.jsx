import React from 'react';
import { PokemonIndexItem } from './pokemon_index_item';

class PokemonIndex extends React.Component{
  constructor(props){
    super(props)
  }
  
  componentDidMount(){
    this.props.requestAllPokemon()
  }
  
  render(){
    return (
      <section className="pokedex">
        <ul>
        {this.props.pokemon.map((poke) => (
          // <li className="pokemon-index-item" key = {poke.id}>
          //   <span>{poke.id}</span>
          //   <img src={poke.imageUrl}/>
          //   <span>{poke.name}</span>
          // </li>
          <PokemonIndexItem pokemon={poke} key={poke.id}/>
        ))}
        </ul>
      </section>
    )
  }
  }
  
  
  
  export default PokemonIndex;