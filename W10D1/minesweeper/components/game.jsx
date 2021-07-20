import * as Minesweeper from '../minesweeper';
import React from 'react';
import Board from './board';
import ReactDOM from 'react-dom';

class Game extends React.Component{

    constructor(props){
        super(props);
        this.state = {board: new Minesweeper.Board(10,10)};
        this.updateGame = this.updateGame.bind(this);
        this.restartGame = this.restartGame.bind(this);
    }

    updateGame(tile,flagged){
        if(flagged){
            tile.toggleFlag();
        }else{
            tile.explore();
        }
        this.setState({board: this.state.board});
    }

    restartGame(){
        this.state = {board: new Minesweeper.Board(10,10)};
        this.setState({board: this.state.board});
    }

    render(){
        let modal;
        if (this.state.board.lost() || this.state.board.won()) {
          const text = this.state.board.won() ? "You won!" : "You lost!";
          
          modal =
            <div className='modal-screen'>
              <div className='modal-content'>
                <p>{text}</p>
                <button onClick={this.restartGame}>Play Again</button>
              </div>
            </div>;
        }

        return (
            <div>
            {modal}
            <Board board={this.state.board} updateGame={this.updateGame}/>
            </div>
        );
    }
}
export default Game;