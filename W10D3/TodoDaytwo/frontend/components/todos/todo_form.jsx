import React from 'react';
import ReactDOM from 'react-dom';

class TodoForm extends React.Component{
    
    constructor(props){
        super(props);
        this.state = {
            title: "",
            body: "",
            id: this.uniqueID(),
            done: false
        };
        this.uniqueID.bind(this);
    }

    uniqueID(){
        return new Date().getTime();
    }

    render(){
        
    }
}

export default TodoForm;