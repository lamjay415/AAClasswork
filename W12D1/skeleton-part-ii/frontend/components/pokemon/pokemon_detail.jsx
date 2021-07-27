import React from 'react';

class PokemonDetail extends React.Component{

    constructor(props){
        super(props);
    }

    componentDidMount(){
        console.log(this.props);
        this.props.requestPokemon();
    }

    render(){
        return (
            <div>
                <div>{this.props.moves}</div>
                <div>{this.props.items}</div>
            </div>
        )
    }

} 
export default PokemonDetail;