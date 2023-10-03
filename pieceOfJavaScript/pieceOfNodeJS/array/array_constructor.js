let array;

array = Array(); // [], length: 0

array = Array(10); // [ <10 empty items> ], length: 10

array = Array(10, 20, 30); // [ 10, 20, 30 ], length: 3

array = Array([10, 20, 30]); // [ [ 10, 20, 30 ] ], length: 1

array = Array.of(); // [], length: 0

array = Array.of(1); // [ 1 ], length: 1

array = Array.of(10, 20, 30); // [ 10, 20, 30 ], length: 3

// array = Array.from(); // TypeError: undefined is not iterable (cannot read property Symbol(Symbol.iterator))

array = Array.from(10); // [], length: 0

array = Array.from([10, 20, 30]); // [ 10, 20, 30 ] , length: 3

array = Array.from({ length: 5 }); // [ undefined, undefined, undefined, undefined, undefined ], length: 5

array = Array.from({ length: 5 }, (v, k) => v); // [ undefined, undefined, undefined, undefined, undefined ] , length: 5

array = Array.from({ length: 5 }, (v, k) => k); // [ 0, 1, 2, 3, 4 ] , length: 5

console.log(array, `, length: ${array.length}`);
