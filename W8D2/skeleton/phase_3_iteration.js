
Array.prototype.bubbleSort = function() {
    let sorted = false;
    while(!sorted){
        sorted = true;
        for(let i = 0; i < this.length - 1; i++){
            if(this[i] > this[i+1]){
                temp = this[i];
                this[i] = this[i+1];
                this[i+1] = temp;
                sorted = false;
            }
        }
    }
    return this;
}

String.prototype.substrings = function() {
    let subs = [];
    let i = 0;
    while(i < this.length){
        let temp = [];
        for(let n = i; n < this.length; n ++){
            temp.push(this[n]);
            console.log(temp)
            subs.push(temp);
        }
        i++;
    }
    return subs;
}

console.log("subs".substrings())