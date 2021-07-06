const MovingObject = require("./moving_object.js");
window.MovingObject = MovingObject;

window.addEventListener('DOMContentLoaded', (event) => {
    console.log('testing');
    const c = document.getElementById('game-canvas');
    const ctx = c.getContext('2d');
    const mo = new MovingObject({
        pos: [30, 30],
        vel: [10, 10],
        radius: 5,
        color: "#00FF00"
      });
    mo.draw(ctx);
})
console.log("Hello");