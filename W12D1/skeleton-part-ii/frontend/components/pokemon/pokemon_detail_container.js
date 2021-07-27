import {connect} from 'react-redux';
import PokemonDetail from './pokemon_detail';
import { requestPokemon } from '../../actions/pokemon_actions';
import { selectAllPokemon } from '../../reducers/selectors';


const mapStateToProps = (state, ownProps) => {
    return ({
    // pokemon: selectAllPokemon(state)
        pokemon: state.pokemon[ownProps.match.params.id]
    });
};
const mapDispatchToProps = (dispatch,ownProps) => {
    return ({requestPokemon: () => dispatch(requestPokemon(ownProps.match.params.id))});
};

export default connect(mapStateToProps, mapDispatchToProps)(PokemonDetail);