const Game = require("./game.js");
const MovingObject = require("./moving_object.js");


window.MovingObject = MovingObject;

window.addEventListener('DOMContentLoaded', (event) => {
    console.log('testing');
    const c = document.getElementById('game-canvas');
    const ctx = c.getContext('2d');

    const g = new Game();
    g.addAsteroids();
    g.draw(ctx);
    g.moveObjects();
    

})
console.log("Hello");