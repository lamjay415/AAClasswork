import { RECEIVE_POKEMON } from './../actions/pokemon_actions';

const itemsReducer = (state= {}, action) => {
    // console.log("I am the ITEMS REDUCER");


    Object.freeze(state);
    switch(action.type){
        case RECEIVE_POKEMON:
            return Object.assign({}, action.pokemon.items, state);
        default: 
            return state;
    }
}

export default itemsReducer;