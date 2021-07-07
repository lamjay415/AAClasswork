const { scale } = require("./util.js");
const Util = require("./util.js");
const MovingObject = require("./moving_object.js")

const RADIUS = 5;
const COLOR = '#808080';


const Asteroid = function(options){
    
    this.pos = options.pos;
    this.vel = options.vel;
    this.radius = RADIUS;
    this.color = COLOR;
}

Util.inherits(Asteroid, MovingObject);
//WHAT IS LENGTH? AND WHY?
const vec = Util.randomVec(10);
scale(vec, 5);

module.exports = Asteroid;