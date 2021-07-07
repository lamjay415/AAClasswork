const Asteroid = require("./asteroid.js");
const Game = require("./game.js");
const MovingObject = require("./moving_object.js");
const Util = require("./util.js");
const GameView = require("./")


window.MovingObject = MovingObject;

window.addEventListener('DOMContentLoaded', (event) => {
    console.log('testing');
    const c = document.getElementById('game-canvas');
    const ctx = c.getContext('2d');

    // const mo = new MovingObject({
    //     pos: [30, 30],
    //     vel: [10, 10],
    //     radius: 5,
    //     color: "#00FF00"
    //   }); 
    // mo.draw(ctx);

    // const a = new Asteroid({
    //     pos: [100,100],
    //     vel: [10,10]
    // })
    // a.draw(ctx);
    const g = new Game();
    g.addAsteroids();
    // g.draw(ctx);
    // g.moveObjects();
    const gv = new GameView(g,ctx);
    gv.start();

})
console.log("Hello");