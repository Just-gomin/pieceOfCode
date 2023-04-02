function* genFunction(n) {
  try {
    const x = yield n;
    console.log("x: ", x);

    const y = yield x + 10;
    console.log("x: ", x);
    console.log("y: ", y);

    return x + y;
  } catch (e) {
    console.error(e);
  }
}

const generator = genFunction(5);

let res = generator.next();
console.log(res);

res = generator.next(10);
console.log(res);

res = generator.next(20);
console.log(res);
