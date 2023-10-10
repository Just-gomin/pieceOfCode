let numberArr;
let stringArr;

const initialize = () => {
    numberArr = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1];
    stringArr = ['하', '파', '타', '카', '차', '자', '아', '사', '바', '마', '라', '다', '나', '가'];
}

initialize();
let oddArr = numberArr.filter(function (v, i, arr) {
    return v % 2;
});
console.log(oddArr);

let evenArr = numberArr.filter((v, i, arr) => {
    return v % 2 === 0;
});
console.log(evenArr);