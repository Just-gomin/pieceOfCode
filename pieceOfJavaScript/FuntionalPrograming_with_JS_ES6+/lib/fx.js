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

// 함수 f와 이터러블을 받아, 이터러블 각각에 대해 함수 f를 반복해 수행하는 함수
const map = curry((f, iter) => {
    let res = [];
    for (const a of iter) {
        res.push(f(a));
    }
    return res;
});

// 함수 f와 이터러블을 받아, 이터러블 각각에 대해 함수 f를 반복해 조건을 만족하는 데이터를 추출하는 함수
const filter = curry((f, iter) => {
    let res = [];
    for (const a of iter) {
        if (f(a)) res.push(a);
    }
    return res;
});

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

// iterable을 받아 l개 만큼 뽑아내 반환
const take = curry((l, iter) => {
    let res = [];
    for (const a of iter) {
        res.push(a);
        if (res.length === l) return res;
    }
    return res;
});

// ---------------
//  Lazy
// ---------------
const L = {};
L.range = function* (l) {
    let i = -1;
    while (++i < l) {
        //   log(`${i},L.range`);
        yield i;
    }
};