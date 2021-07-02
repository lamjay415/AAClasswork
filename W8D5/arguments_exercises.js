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

console.log(sum2(1, 2, 3, 4) === 10);

