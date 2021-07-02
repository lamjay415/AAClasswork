Function.prototype.myThrottle = function(int) {
    let tooSoon = false;

    // if (tooSoon === true) {

    // } else {
    //     return () => {
            
    //         tooSoon = true;
    //         setTimeout(() => {
    //             tooSoon = false;
    //         }, int)
    //         this.call() }   
    // } 

    return () => {
        if (tooSoon === false) {
        tooSoon = true;
        setTimeout(() => {
            tooSoon = false;
        }, int)
        this.call() }
    }   
}


class Neuron {
    constructor() {
        this.fire = this.fire.myThrottle(2000);
    }

    fire() {
        console.log("Firing!");
    }
}

const neuron = new Neuron();
// neuron.fire()

neuron.fire = neuron.fire.myThrottle(2000);

const interval = setInterval(() => {
    neuron.fire();
}, 50);