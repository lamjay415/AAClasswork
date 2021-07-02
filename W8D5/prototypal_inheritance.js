// class Surrogate {
//     Surrogate.prototype = SuperClass.prototype;
//     Subclass.prototype = new Surrogate();
//     Subclass.prototype.constructor = Subclass;
// }
    // this.__proto__ = superClassObj.prototype;
    // this.prototype.__proto__ = superClassObj.prototype; 

Function.prototype.inherits = function(superClassObj) {

    // Surrogate
    function Surrogate() {};
    Surrogate.prototype = superClassObj.prototype;
    this.prototype = new Surrogate();
    this.prototype.constructor = this;

    //Object.create
    // this.prototype = Object.create(superClassObj.prototype);
    // this.prototype.constructor = this;
    
}

function MovingObject () {}

function Ship () {}
Ship.inherits(MovingObject);

function Asteroid () {}
Asteroid.inherits(MovingObject);

