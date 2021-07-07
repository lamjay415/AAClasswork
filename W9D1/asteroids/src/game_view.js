const Asteroid = require("./asteroid.js");
const Game = require("./game.js");
const MovingObject = require("./moving_object.js");
const Util = require("./util.js");

const GameView = function(game,ctx) {
    this.game = game;
    this.ctx = ctx;
}

GameView.prototype.start = function() {
    setInterval(moveObjects(this.game.asteroids),20);
    setInterval(draw(this.ctx),20);
}