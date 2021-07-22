import React from 'react';
import ReactDOM from 'react-dom';

class Todo extends React.Component{
    

    render(){
        
        return (
            <div>
                <li key={this.props.todo.id}>
                    <h4>ID: {this.props.todo.id}</h4>
                    <h4>Title: {this.props.todo.title}</h4>
                    <h4>Body: {this.props.todo.body}</h4>
                    
                </li>
            </div>
        )
    }
}

export default Todo;