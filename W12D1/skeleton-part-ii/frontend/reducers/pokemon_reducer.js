import { RECEIVE_ALL_POKEMON, RECEIVE_POKEMON } from './../actions/pokemon_actions';

const pokemonReducer = (state = {}, action) => {
  // console.log("I am the POKEMON REDUCER");

  Object.freeze(state);
  // let nextState = Object.assign({}, state);
  switch (action.type){
  case RECEIVE_ALL_POKEMON:
    return Object.assign({}, action.pokemon, state);
  case RECEIVE_POKEMON:
    console.log("test");
    return Object.assign({}, action.pokemon.id, state);
    // return nextState[action.pokemon.id] = action.pokemon;
  default:
    return state;
  }
}
  
export default pokemonReducer;
