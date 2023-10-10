let numberArr;
let stringArr;

const initialize = () => {
    numberArr = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1];
    stringArr = ['하', '파', '타', '카', '차', '자', '아', '사', '바', '마', '라', '다', '나', '가'];
}

initialize();
console.log(numberArr.sort()); // [1, 10, 2, 3, 4, 5,  6, 7, 8, 9]
console.log(stringArr.sort()); // ['가', '나', '다','라', '마', '바','사', '아', '자','차', '카', '타','파', '하']

initialize();
console.log(numberArr.sort((a, b) => a - b)); // [1, 2, 3, 4,  5, 6, 7, 8, 9, 10]
console.log(stringArr.sort((a, b) => a === b ? 0 : a > b ? 1 : -1)); // ['가', '나', '다','라', '마', '바','사', '아', '자','차', '카', '타','파', '하']

initialize();
console.log(numberArr.sort((a, b) => b - a)); // [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
console.log(stringArr.sort((a, b) => a === b ? 0 : b > a ? 1 : -1)); // ['하', '파', '타', '카', '차', '자', '아', '사', '바', '마', '라', '다', '나', '가']


let items;

function initItems() {
    items = [
        { 'name': 'd', price: 121 },
        { 'name': 'c', price: 150 },
        { 'name': 'a', price: 103 },
        { 'name': 'a', price: 107 },
        { 'name': 'd', price: 87 },
        { 'name': 'b', price: 99 },
    ];
}

initItems();
items.sort();

initItems();
items.sort((a, b) => {
    if (a.name == b.name) {
        return a.price - b.price;
    }

    return a.name > b.name ? 1 : -1;
});
console.log(items);