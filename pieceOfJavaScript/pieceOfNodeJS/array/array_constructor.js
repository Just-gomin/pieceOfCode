let array;

// --------------------
// Array constructor
// --------------------

array = Array(); // [], length: 0

array = new Array(); // [], length: 0

array = Array(10); // [ <10 empty items> ], length: 10

array = new Array(10); // [ <10 empty items> ], length: 10

array = Array('a'); // [ 'a' ], length: 1

array = new Array('a'); // [ 'a' ], length: 1

array = Array(10, 20, 30); // [ 10, 20, 30 ], length: 3

array = new Array(10, 20, 30); // [ 10, 20, 30 ], length: 3

array = Array([10, 20, 30]); // [ [ 10, 20, 30 ] ], length: 1

array = new Array([10, 20, 30]); // [ [ 10, 20, 30 ] ], length: 1

array = Array(...[10, 20, 30]); // [ 10, 20, 30 ], length: 3

array = new Array(...[10, 20, 30]); // [ 10, 20, 30 ], length: 3

// --------------------
// Array.of constructor
// --------------------

array = Array.of(); // [], length: 0

array = Array.of(1); // [ 1 ], length: 1

array = Array.of(10, 20, 30); // [ 10, 20, 30 ], length: 3

array = Array.of([10, 20, 30]); // [ [ 10, 20, 30 ] ], length: 1

array = Array.of(...[10, 20, 30]); // [ 10, 20, 30 ], length: 3

// --------------------
// Array.from constructor
// --------------------

// array = Array.from(); // TypeError: undefined is not iterable (cannot read property Symbol(Symbol.iterator))

array = Array.from(10); // [], length: 0

array = Array.from([10, 20, 30]); // [ 10, 20, 30 ] , length: 3

array = Array.from({ length: 5 }); // [ undefined, undefined, undefined, undefined, undefined ], length: 5

array = Array.from({ length: 5, 0: 0, 1: 1, 2: 2, 4: 4 }); // [ 0, 1, 2, undefined, 4 ], length: 5

array = Array.from({ length: 5 }, (v, k) => v); // [ undefined, undefined, undefined, undefined, undefined ], length: 5

array = Array.from({ length: 5 }, (v, k) => k); // [ 0, 1, 2, 3, 4 ], length: 5

array = Array.from({ length: 5, 0: 0, 1: 1, 2: 2, 3: 3, 4: 4 }, (v, k) => v + k); // [0, 2, 4, 6, 8], length: 5

console.log(array, `, length: ${array.length}`);
