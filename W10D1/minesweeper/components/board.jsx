import React from 'react';
import Tile from './tile';
import ReactDOM from 'react-dom';

class Board extends React.Component{
    
    constructor(props){
        super(props);
    }

    render(){

        let grid = this.props.board.grid;
        grid = grid.map((el,idx) => {
            let row = el.map((tile,idx) =>{
                return (
                    <Tile 
                        tile = {tile}
                        updateGame = {this.props.updateGame}
                        key = {idx}
                    /> 
                );
                    
            });

            return (
                <div className="row">
                    {row}
                </div>
            )
        });
        return (
            <div className="board">
                {grid}
            </div>
        );
    }
}

export default Board;