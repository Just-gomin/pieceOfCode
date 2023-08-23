const log = console.log;

const add = (a, b) => a + b;

// 함수를 인자로 받아 인자가 두 개 일때 까지 대기 하는 함수를 만드는 함수
const curry =
    (f) =>
        (a, ..._) =>
            _.length ? f(a, ..._) : (..._) => f(a, ..._);

// 이터러블과 함수들을 받아 이터러블에 대해 순차 적으로 함수들을 수행하는 함수
const go = (...args) => reduce((a, f) => f(a), args);

// 처음 들어온 인자가 Promise라면, 대기한 뒤 함수 수행
const go1 = (a, f) => a instanceof Promise ? a.then(f) : f(a);

// 함수들을 받아 순차 적으로 함수들을 수행하는 함수를 정의하는 함수
const pipe =
    (f, ...fs) =>
        (...as) =>
            go(f(...as), ...fs);

// iterable을 받아 l개 만큼 뽑아내 반환
const take = curry((l, iter) => {
    let res = [];
    iter = iter[Symbol.iterator]();

    return function recur() {
        while (!(cur = iter.next()).done) {
            const a = cur.value;
            if (a instanceof Promise) {
                return a
                    .then((a) => (res.push(a), res).length === l ? res : recur())
                    .catch((e) => e === nop ? recur() : Promise.reject(e));
            }
            res.push(a);
            if (res.length === l) return res;
        }
        return res;
    }();
});

// 전부 다 반환
const takeAll = take(Infinity);

// 이터러블인지 확인
const isIterable = (a) => a && a[Symbol.iterator];

const nop = Symbol('nop');

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
        yield go1(a, f);
    }
});

L.filter = curry(function* (f, iter) {
    for (const a of iter) {
        const b = go1(a, f);
        if (b instanceof Promise) yield b.then((b) => b ? a : Promise.reject(nop));
        else if (b) yield a;
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

const C = {};

function noop() { }

// Promise 처리 중간에 reject가 발생하는 경우, 추후 처리할 수 있도록 조치
const catchNoop = ([...arr]) => (
    arr.forEach((a) => (a instanceof Promise ? a.catch(noop) : a)), arr
);

// 병렬적으로 처리 시켜 한번에 결과를 반환한다.
C.reduce = curry((f, acc, iter) =>
    iter ? reduce(f, acc, catchNoop(iter)) : reduce(f, catchNoop(acc))
);

C.take = curry((l, iter) => take(l, catchNoop(iter)));

C.takeAll = C.take(Infinity);

C.map = curry(pipe(L.map, C.takeAll));

C.filter = curry(pipe(L.filter, C.takeAll));


// ---------------
//  Strict
// ---------------

// 함수 f와 이터러블을 받아, 이터러블 각각에 대해 함수 f를 반복해 수행하는 함수
const map = curry(pipe(L.map, takeAll));

// 함수 f와 이터러블을 받아, 이터러블 각각에 대해 함수 f를 반복해 조건을 만족하는 데이터를 추출하는 함수
const filter = curry(pipe(L.filter, takeAll));

const reduceF = (acc, a, f) =>
    a instanceof Promise ?
        a.then((a) => f(acc, a),
            e => e === nop ? acc : Promise.reject(e)
        )
        : f(acc, a);

const head = (iter) => go1(take(1, iter), ([h]) => {
    return h
});

// 함수 f와 누계, 이터러블을 받아, 이터러블 각각에 대해 함수 f를 수행하고 누적하는 함수
const reduce = curry((f, acc, iter) => {
    if (!iter) return reduce(f, head(iter = acc[Symbol.iterator]()), iter);

    iter = iter[Symbol.iterator]();
    let cur;
    return go1(acc, function recur(acc) {
        while (!(cur = iter.next()).done) {
            acc = reduceF(acc, cur.value, f);
            if (acc instanceof Promise) return acc.then(recur);
        }
        return acc;
    });
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