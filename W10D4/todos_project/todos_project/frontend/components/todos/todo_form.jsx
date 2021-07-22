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
        
        this.uniqueID = this.uniqueID.bind(this);
        this.updateBody = this.updateBody.bind(this);
        this.updateTitle = this.updateTitle.bind(this);
        this.handleSubmit = this.handleSubmit.bind(this);
    }

    uniqueID(){
        return new Date().getTime();
    }
    updateBody(e){
        this.setState({
            body: e.target.value

        })
    }
    updateTitle(e){
        
        this.setState({
            title: e.target.value

        })
        
    }
    handleSubmit(e){
        e.preventDefault();
        this.props.receive_todo(this.state)
        this.setState({
            id:this.uniqueID(),
            title: "",
            body: ""
        })
        
    }
    render(){
        return(
            <form onSubmit={this.handleSubmit}>
                <label >"Title"</label>
                <input type="text" name="title" value={this.state.title}onChange={this.updateTitle}></input>
                <label >"Body"</label>
                <input type="text" name="body" value={this.state.body}onChange={this.updateBody}></input>
                <input type="submit" value="Add Todo" />
            </form>
        )
        
    }
}

export default TodoForm;