const MovingObject = function (options) {
    this.pos = options.pos;
    this.vel = options.vel;
    this.radius = options.radius;
    this.color = options.color;
}
// const MovingObject = function (pos,vel,radius,color) {
//     this.pos = pos;
//     this.vel = vel;
//     this.radius = radius;
//     this.color = color;
// }

MovingObject.prototype.draw = function draw(ctx) {
    ctx.fillStyle = this.color;
    ctx.beginPath();
    ctx.arc(
        this.pos[0],
        this.pos[1], 
        this.radius,
        0,
        2* Math.PI,
        true
    );
    ctx.fill();
}

MovingObject.prototype.move = function() {
    this.pos[0] += this.vel[0];
    this.pos[1] += this.vel[1];
}

module.exports = MovingObject;