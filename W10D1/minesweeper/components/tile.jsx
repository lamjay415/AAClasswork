import React from 'react';
import ReactDOM from 'react-dom';

class Tile extends React.Component{

    constructor(props){
        super(props)
        this.handleClick = this.handleClick.bind(this);
    }

    render(){
        let display = "";
        let tile = this.props.tile;
        let div_class = "tile";
        
        if(tile.explored && !tile.bombed){
            if(tile.adjacentBombCount() > 1){
                display = tile.adjacentBombCount();
            }
            div_class += "-revealed";
        }else if(tile.explored && tile.bombed){
            display = "💣";
            div_class += "-bombed";
        }else if(tile.flagged){
            display = "⚑";
            div_class += "-flagged";
        }else{
            div_class += "-unrevealed"
            display = "  ";
        }
        return (
            <div className={div_class} onClick={this.handleClick}>{display}</div>
        );
    }

    handleClick(e){
        let flagged = false;
        if(e.altKey){
            flagged = true;
        }
        this.props.updateGame(this.props.tile,flagged);
    }
}

export default Tile;