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

Function.prototype.myBind = function (ctx, ...args) {
  return (...args2) => this.apply(ctx, args.concat(args2));
}

// Function.prototype.myBind2 = function (ctx, ...args) {
//   const bindArgs = Array.from(arguments);
//   return (...args2) => this.apply(ctx, bindArgs.concat(args2));
// }

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