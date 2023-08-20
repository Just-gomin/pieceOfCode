const log = console.log;

// 함수를 인자로 받아 인자가 두 개 일때 까지 대기 하는 함수를 만드는 함수
const curry =
    (f) =>
        (a, ..._) =>
            _.length ? f(a, ..._) : (..._) => f(a, ..._);

// 이터러블과 함수들을 받아 이터러블에 대해 순차 적으로 함수들을 수행하는 함수
const go = (...args) => reduce((a, f) => f(a), args);

// 함수들을 받아 순차 적으로 함수들을 수행하는 함수를 정의하는 함수
const pipe =
    (f, ...fs) =>
        (...as) =>
            go(f(...as), ...fs);

// iterable을 받아 l개 만큼 뽑아내 반환
const take = curry((l, iter) => {
    let res = [];
    for (const a of iter) {
        res.push(a);
        if (res.length === l) return res;
    }
    return res;
});

// 전부 다 반환
const takeAll = take(Infinity);

// 이터러블인지 확인
const isIterable = (a) => a && a[Symbol.iterator];

// ---------------
//  Lazy
// ---------------
const L = {};

L.range = function* (l) {
    let i = -1;
    while (++i < l) {
        yield i;
    }
};

L.map = curry(function* (f, iter) {
    for (const a of iter) {
        yield f(a);
    }
});

L.filter = curry(function* (f, iter) {
    for (const a of iter) {
        if (f(a)) yield a;
    }
});

L.entries = function* (obj) {
    for (const k in obj) yield [k, obj[k]];
};

// 중첩된 이터러블을 1 depth로 만드는 함수
L.flatten = function* (iter) {
    for (const a of iter) {
        if (isIterable(a)) yield* a;
        else yield a;
    }
};

// n 중첩된 이터러블을 1 depth로 만드는 함수
L.deepFlat = function* f(iter) {
    for (const a of iter) {
        if (isIterable(a)) yield* f(a);
        else yield a;
    }
};

// map을 이용해 각각의 항목에 함수를 적용하고, 1 depth로 만드는 함수
L.flatMap = curry(pipe(L.map, L.flatten));

// ---------------
//  Concurrency
// ---------------

// 함수 f와 이터러블을 받아, 이터러블 각각에 대해 함수 f를 반복해 수행하는 함수
const map = curry(pipe(L.map, takeAll));

// 함수 f와 이터러블을 받아, 이터러블 각각에 대해 함수 f를 반복해 조건을 만족하는 데이터를 추출하는 함수
const filter = curry(pipe(L.filter, takeAll));

// 함수 f와 누계, 이터러블을 받아, 이터러블 각각에 대해 함수 f를 수행하고 누적하는 함수
const reduce = curry((f, acc, iter) => {
    if (!iter) {
        iter = acc[Symbol.iterator]();
        acc = iter.next().value;
    }
    for (const a of iter) acc = f(acc, a);
    return acc;
});

// 0 ~ l-1 까지 숫자가 담긴 배열을 생성
const range = (l) => {
    let i = -1;
    let res = [];
    while (++i < l) {
        res.push(i);
    }
    return res;
};

const join = curry((sep = ",", iter) =>
    reduce((a, b) => `${a}${sep}${b}`, iter)
);

const find = curry((f, iter) => go(iter, L.filter(f), take(1), ([a]) => a));

const flatten = pipe(L.flatten, takeAll);

const flatMap = curry(pipe(L.map, flatten));