function sum(...args) {
    return args.reduce( (sum, current) => {
        return sum + current;
    });
}

function sum2(...args) {
    return Array.from(arguments).reduce( (sum, current) => {
        return sum + current;
    });
}

// console.log(sum2(1, 2, 3, 4) === 10);

//MYBIND

Function.prototype.myBind = function(ctx, ...args) {
  return (...args2) => this.apply(ctx, args.concat(args2));
}

Function.prototype.myBind2 = function(ctx) { 
  const bindArgs = Array.from(arguments).slice(1);
  let that = this;
    return function() {
        callArgs = Array.from(arguments);
        that.apply(ctx, bindArgs.concat(callArgs));
    }
}

// class Cat {
//   constructor(name) {
//     this.name = name;
//   }

//   says(sound, person) {
//     console.log(`${this.name} says ${sound} to ${person}!`);
//     return true;
//   }
// }

// class Dog {
//   constructor(name) {
//     this.name = name;
//   }
// }

// const markov = new Cat("Markov");
// const pavlov = new Dog("Pavlov");

// markov.says("meow", "Ned");
// // Markov says meow to Ned!
// // true

// // bind time args are "meow" and "Kush", no call time args
// markov.says.myBind2(pavlov, "meow", "Kush")();
// // Pavlov says meow to Kush!
// // true

// // no bind time args (other than context), call time args are "meow" and "a tree"
// markov.says.myBind2(pavlov)("meow", "a tree");
// // Pavlov says meow to a tree!
// // true

// // bind time arg is "meow", call time arg is "Markov"
// markov.says.myBind2(pavlov, "meow")("Markov");
// // Pavlov says meow to Markov!
// // true

// // no bind time args (other than context), call time args are "meow" and "me"
// const notMarkovSays = markov.says.myBind2(pavlov);
// notMarkovSays("meow", "me");
// // Pavlov says meow to me!
// // true

//MYBIND

function curriedSum(numArgs){
    const numbers = [];

    return function _curriedSum(n) {
        numbers.push(n);
        if(numbers.length === numArgs){
            let total = 0;
            for(let i = 0; i <numbers.length; i++){
                total += numbers[i];
            }
            return total;
        }else{
            return _curriedSum;
        }
    };
}

const sums = curriedSum(4);
console.log(sums(5)(30)(20)(1)); // => 56