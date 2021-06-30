function Cat(name, owner) {
    this.name = name;
    this.owner = owner;
}

Cat.prototype.cuteStatement = function() {
    return `${this.owner} loves ${this.name}`;
}

Cat.prototype.meow = function() {
    return "meow";
}
let c = new Cat("cat","dog");
console.log(c.cuteStatement());

c.meow = function () {
    return "woof";
}

let d = new Cat("cat1","dog1");
console.log(c.meow());
console.log(d.meow());


