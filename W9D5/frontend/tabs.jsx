import React from 'react';

class Tabs extends React.Component {
    constructor(props) {
        super(props);
            this.state = {
                index: 0
            };
    }
    
    render() {
        const panes = this.props.panes;

        return (
        <div>
            <ul>
                <h1></h1>
            </ul>
        </div>

        );
    }
 }