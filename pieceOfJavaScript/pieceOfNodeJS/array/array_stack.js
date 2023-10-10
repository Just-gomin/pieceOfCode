const stack = [];

console.log("PUSH ------------------------------");
for (let i = 1; i <= 5; i++) {
    console.log(i);
    stack.push(i);
}

console.log("POP ------------------------------");
for (let i = 1; i <= 5; i++) {
    let popped = stack.pop();
    console.log(popped);
}

console.log("PUSH ------------------------------");
for (let i = 1; i <= 5; i++) {
    console.log(i);
    stack.unshift(i);
}

console.log("POP ------------------------------");
for (let i = 1; i <= 5; i++) {
    let popped = stack.shift();
    console.log(popped);
}