Array.prototype.myEach = function(callback) {
    for(i = 0; i < this.length; i++){
        this[i] = callback(this[i]);
    }
};

Array.prototype.myMap = function(callback) {
    let result = [];

    this.myEach(el => result.push(callback(el)));

    return result;
};

Array.prototype.myReduce = function(callback, acc){
    if(acc === undefined){
        acc = this[0];
        this.shift();
    }
    this.myEach(ele => acc = callback(acc,ele));

    return acc;
};

let mycallback = function(n) {
    return n*2;
};


// let arr = [1,2,3]
// console.log(arr.myMap(mycallback))

// // without initialValue
// console.log([1, 2, 3].myReduce(function(acc, el) {
//     return acc + el;
//   })); // => 6
  
// // with initialValue
// console.log([1, 2, 3].myReduce(function(acc, el) {
//     return acc + el;
//   }, 25));

// console.log([4,3,2,1].bubbleSort())
