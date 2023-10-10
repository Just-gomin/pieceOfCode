const queue = [];

console.log("Enqueue ------------------------------");
for (let i = 1; i <= 5; i++) {
    console.log(i);
    queue.push(i);
}

console.log("Dequeue ------------------------------");
for (let i = 1; i <= 5; i++) {
    let dequeued = queue.shift();
    console.log(dequeued);
}

console.log("Enqueue ------------------------------");
for (let i = 1; i <= 5; i++) {
    console.log(i);
    queue.unshift(i);
}

console.log("Dequeue ------------------------------");
for (let i = 1; i <= 5; i++) {
    let dequeued = queue.pop();
    console.log(dequeued);
}