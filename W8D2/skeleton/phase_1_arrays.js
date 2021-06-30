Array.prototype.uniq = function() {
    let result = [];
    for(i = 0; i < this.length; i++){
        if (!result.includes(this[i])){
            result.push(this[i]);
        }
    }

    return result;
}

Array.prototype.twoSum = function(sum) {
    let hash = {};
    let result = [];
    for(i = 0; i < this.length; i++){
        let pair = sum - this[i];
        if(hash[pair]){
            result.push([hash[pair],i]);
        }
        hash[this[i]] = i;
    }
    return result;
}

Array.prototype.transpose = function() {
    let result = [];
    let i = 0;
    while(i<this.length){
        temp = []
        this.forEach(el => {
            temp.push(el[i]);
        });
        result.push(temp);
        i++;
    }
    return result;
}

console.log([[1,2,3],[4,5,6],[7,8,9]].transpose())