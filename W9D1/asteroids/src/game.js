const Asteroid = require("./asteroid.js");
const Util = require("./util.js");
const MovingObject = require("./moving_object.js");
const { randomVec } = require("./util.js");

const Game = function(){
    this.DIM_X = 600; 
    this.DIM_Y = 600;
    this.NUM_ASTEROIDS = 10;
    this.asteroids = [];
}

Game.prototype.addAsteroids = function(){
    for (let i = 0; i < this.NUM_ASTEROIDS; i++) {
        let asteroid  = new Asteroid({pos: this.randomPosition, vec: Util.randomVec(10)});
        this.asteroids.push(asteroid);
    }
};

Game.prototype.randomPosition = function(){
    
    const x =  Math.floor(Math.random() * 600);
    const y = Math.floor(Math.random() * 600);
    return [x,y];
}

Game.prototype.draw = function(ctx){
    ctx.clearRect(0,0,600,600);

    for (let i = 0; i < this.asteroids.length; i++) {
        let asteroid = this.asteroids[i];
        asteroid.draw(ctx);
    }
}


Game.prototype.moveObjects = function() {

    for (let i = 0; i < this.asteroids.length; i++) {

        this.asteroids[i].move();
    }
}

module.exports = Game;