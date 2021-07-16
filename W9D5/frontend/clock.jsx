import React from 'react';

class Clock extends React.Component {

    constructor(props){
        super(props);
        this.state = {time: new Date()};
        this.tick = this.tick.bind(this);
    }

    tick(){
        this.setState({time: new Date()});
    }

    componentDidMount(){
        setInterval(this.tick,1000);
    }

    render(){
        let hour = this.state.time.getHours();
        let mins = this.state.time.getMinutes();
        let secs = this.state.time.getSeconds();
        return (
            <div>
                <h1>{hour%12}:{mins}:{secs}</h1>
            </div>
        )
    }
}

export default Clock;