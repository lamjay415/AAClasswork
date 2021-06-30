Array.prototype.range = function(start,end) {
    let result = [this[start]];
    if(start === end){
        return result;
    }

    result.push(this.range(start+1,end));

    return result;
}

// console.log([1,2,3,4,5].range(2,4));

function sumRec(arr) {
    let sum = 0
    if(arr.length === 0){
        return sum;
    }
    return arr[0] + sumRec(arr.slice(1))
}

// console.log(sumRec([1,2,3,4]))

function exponent(base,exp) {
    if(exp === 0){
        return 1;
    }
    return base * exponent(base,exp-1)
}

function exponent2(base,exp){
    if(exp === 0){
        return 1;
    }else if(exp === 1) {
        return base;
    }else if(exp %2 === 0){
        return exponent2(base, exp/2) ** 2
    }else{
        return base * (exponent2(base,(exp-1)/2)**2)
    }
}
console.log(exponent(2,3));
console.log(exponent2(2,3));

function fibonacci(n) {

}

function deepDup(arr){
    
}