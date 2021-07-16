import React from 'react';
import ReactDOM from 'react-dom';
import Clock from './clock';
import Taps from './tabs';

function Root(){
    return (
        <div>
            <Clock/>
            <Taps panes={panes}/>
        </div>
    );
}

document.addEventListener("DOMContentLoaded", ()=>{
    const main = document.getElementById('main');
    ReactDOM.render( <Root/> , main )
});