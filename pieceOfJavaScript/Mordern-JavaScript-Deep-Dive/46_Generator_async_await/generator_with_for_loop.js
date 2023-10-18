function normarForLoop(num) {
  let result_list = [];
  for (let i = 0; i < num; i++) {
    result_list.push(i);
  }

  return result_list;
}

function* generatorForLoop(num) {
  let result_list = [];

  for (let i = 0; i < num; i++) {
    yield result_list.push(i);
  }

  return result_list;
}

console.time("normalForloop");
let num_list = normarForLoop(1000);
let sliced_list = num_list.slice(0, 5);
console.log(sliced_list);
console.timeEnd("normalForloop");

console.time("generatorForloop");
num_list = normarForLoop(1000);
sliced_list = num_list.slice(0, 5);
console.log(sliced_list);
console.timeEnd("generatorForloop");
