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
       this.interval = setInterval(this.tick,1000);
    }

    componentWillUnmount() {
        clearInterval(this.interval);
    }

    render(){
        let hour = this.state.time.getHours();
        let mins = this.state.time.getMinutes();
        let secs = this.state.time.getSeconds();
        return (
            <div className="clock">
                <h1>Clock</h1>
                <div className="time">
                    <h1>Time : </h1>
                    <h1>{hour%12} : {mins} : {secs}</h1>
                </div>

                <div className="date">
                    <h1>Date:</h1>
                    <h1> {this.state.time.getDate()} : {this.state.time.getMonth()} : {this.state.time.getFullYear()}</h1>
                </div>
            </div>

        )
    }
}

export default Clock;