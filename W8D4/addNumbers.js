const readline = require('readline');

const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

function addNumbers(sum, numsLeft, completionCallback) {
    if (numsLeft === 0) {
        completionCallback(sum);
    } else {
        reader.question('input and number to add', (num) => {
            sum += parseInt(num);
            console.log(sum);
            addNumbers(sum, numsLeft - 1, completionCallback);
        })
    }
}

// reader.question('string question prompt', (returnval) => {
// callback})
addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));