import { log, preNewLine, FormattedLog } from "./logger.js";

const fLog = new FormattedLog(70, ">>", 70, "||", 3);

let numArr = [5, 6, 7, 8, 9, 10, 1, 2, 3, 4];
let numArr2 = [15, 16, 17, 18, 19, 20, 11, 12, 13, 14];
let strArr = ["5", "6", "7", "8", "9", "10", "1", "2", "3", "4"];

const initializeArr = () => {
    numArr = [5, 6, 7, 8, 9, 10, 1, 2, 3, 4];
    numArr2 = [15, 16, 17, 18, 19, 20, 11, 12, 13, 14];
    strArr = ["5", "6", "7", "8", "9", "10", "1", "2", "3", "4"];
};

let r1;
let r2;

log("< JS Array Functions And Result >");

preNewLine("< Return, Check Origin >");
r1 = numArr;
r2 = strArr;
fLog.log(
    "r1 = numArr",
    `numArr: [${numArr}]`,
    `r1: [${r1}]`,
);
fLog.log(
    "r2 = strArr",
    `strArr: [${strArr}]`,
    `r2: [${r2}]`,
);
initializeArr();

preNewLine("< Map, Return >");
r1 = numArr.map((i) => i - 1);
r2 = strArr.map((c) => +c);
r2 = strArr.map((c) => Number.parseInt(c));
fLog.log(
    "r1 = numArr.map((i) => i - 1)",
    `numArr: [${numArr}]`,
    `r1: [${r1}]`,
);
fLog.log(
    "r2 = strArr.map((c) => +c)",
    `strArr: [${strArr}]`,
    `r2: [${r2}]`,
);
fLog.log(
    "r2 = strArr.map((c) => Number.parseInt(c))",
    `strArr: [${strArr}]`,
    `r2: [${r2}]`,
);
initializeArr();

preNewLine("< Map, Sort, Return >");
log("- [sort(): 비교 함수가 생략되면 ASCII 문자열 순서대로 오름차순 정렬]");
r1 = numArr.map((i) => i - 1).sort();
r2 = strArr.map((c) => +c).sort();
r2 = strArr.map((c) => Number(c)).sort(); // Character Sorting
fLog.log(
    "r1 = numArr.map((i) => i - 1).sort()",
    `numArr: [${numArr}]`,
    `r1: [${r1}]`,
);
fLog.log(
    "r2 = strArr.map((c) => +c).sort()",
    `strArr: [${strArr}]`,
    `r2: [${r2}]`,
);
fLog.log(
    "r2 = strArr.map((c) => Number(c)).sort()",
    `strArr: [${strArr}]`,
    `r2: [${r2}]`,
);
initializeArr();

preNewLine("< Map, Sort(compareFn), Return >");
r1 = numArr.map((i) => i - 1).sort((a, b) => a - b);
r2 = strArr.map((c) => +c).sort((a, b) => a - b);
r2 = strArr.map((c) => Number(c)).sort((a, b) => a - b);
fLog.log(
    "r1 = numArr.map((i) => i - 1).sort((a, b) => a - b)",
    `numArr: [${numArr}]`,
    `r1: [${r1}]`,
);
fLog.log(
    "r2 = strArr.map((c) => +c).sort((a, b) => a - b)",
    `strArr: [${strArr}]`,
    `r2: [${r2}]`,
);
fLog.log(
    "r2 = strArr.map((c) => Number(c)).sort((a, b) => a - b)",
    `strArr: [${strArr}]`,
    `r2: [${r2}]`,
);
initializeArr();

preNewLine("< Check Origin >");
fLog.log(
    "numArr.concat()",
    `origin: [${numArr}], [${numArr2}]`,
    `returned: [${numArr.concat(numArr2)}]`,
);
initializeArr();

fLog.log(
    "numArr.copyWithin()",
    `origin: [${numArr}]`,
    `returned: [${numArr.copyWithin()}]`,
);
initializeArr();

fLog.log(
    "numArr.entries()",
    `origin: [${numArr}]`,
    `returned: [${numArr.entries()}]`,
);

fLog.log(
    "[...numArr.entries()]",
    `origin: [${numArr}]`,
    `returned: [${[...numArr.entries()]}]`,
);

fLog.log(
    "numArr.every((v, i, arr) => { /*log(v, i, arr);*/ return v; })",
    `origin: [${numArr}]`,
    `returned: [${numArr.every((v, i, arr) => {
    /*log(v, i, arr);*/ return v;
    })}]`,
);
initializeArr();

fLog.log(
    "numArr.fill(-1, 1, 3)",
    `origin: [${numArr}]`,
    `returned: [${numArr.fill(-1, 1, 3)}]`,
);
initializeArr();

fLog.log(
    "numArr.filter((v, i, arr) => v % 2)",
    `origin: [${numArr}]`,
    `returned: [${numArr.filter((v, i, arr) => v % 2)}]`,
);
initializeArr();

fLog.log(
    "numArr.find((v, i, arr) => v === 5)",
    `origin: [${numArr}]`,
    `returned: [${numArr.find((v, i, arr) => v === 5)}]`,
);
initializeArr();

fLog.log(
    "numArr.findIndex((v, i, arr) => i === 5)",
    `origin: [${numArr}]`,
    `returned: [${numArr.findIndex((v, i, arr) => i === 5)}]`,
);
initializeArr();

fLog.log(
    "[numArr, numArr2].flat()",
    `origin: [${numArr}]`,
    `returned: [${[numArr, numArr2].flat()}]`,
);
initializeArr();

fLog.log(
    "[numArr, numArr2].flatMap((i) => i.join('-')",
    `origin: [${numArr}]`,
    `returned: [${[numArr, numArr2].flatMap((i) => i.join("-"))}]`,
);
initializeArr();

fLog.log(
    "numArr.forEach((v, i, arr) => v + 1)",
    `origin: [${numArr}]`,
    `returned: [${numArr.forEach((v, i, arr) => v + 1)}]`,
);
initializeArr();

fLog.log(
    "numArr.includes(1)",
    `origin: [${numArr}]`,
    `returned: [${numArr.includes(1)}]`,
);
fLog.log(
    "numArr.includes(-1)",
    `origin: [${numArr}]`,
    `returned: [${numArr.includes(-1)}]`,
);

fLog.log(
    "numArr.indexOf(1)",
    `origin: [${numArr}]`,
    `returned: [${numArr.indexOf(1)}]`,
);
fLog.log(
    "numArr.indexOf(-1)",
    `origin: [${numArr}]`,
    `returned: [${numArr.indexOf(-1)}]`,
);

fLog.log(
    "numArr.join('-')",
    `origin: [${numArr}]`,
    `returned: [${numArr.join("-")}]`,
);

fLog.log(
    "numArr.keys()",
    `origin: [${numArr}]`,
    `returned: [${numArr.keys()}]`,
);

fLog.log(
    "numArr.lastIndexOf(10)",
    `origin: [${numArr}]`,
    `returned: [${numArr.lastIndexOf(10)}]`,
);

fLog.log(
    "numArr.length",
    `origin: [${numArr}]`,
    `returned: [${numArr.length}]`,
);

fLog.log(
    "numArr.map(((v, i, arr) => v * 2))",
    `origin: [${numArr}]`,
    `returned: [${numArr.map((v, i, arr) => v * 2)}]`,
);
initializeArr();

fLog.log(
    "numArr.pop()",
    `origin: [${numArr}]`,
    `returned: [${numArr.pop()}]`,
);
initializeArr();

fLog.log(
    "numArr.push(100)",
    `origin: [${numArr}]`,
    `returned: [${numArr.push(100)}]`,
);
initializeArr();

fLog.log(
    "numArr.reduce((pv, cv, ci, arr) => pv + cv, 0)",
    `origin: [${numArr}]`,
    `returned: [${numArr.reduce((pv, cv, ci, arr) => pv + cv, 0)}]`,
);
initializeArr();

fLog.log(
    "numArr.reduceRight((pv, cv, ci, arr) => pv + cv, 0)",
    `origin: [${numArr}]`,
    `returned: [${numArr.reduceRight((pv, cv, ci, arr) => pv + cv, 0)}]`,
);
initializeArr();

fLog.log(
    "numArr.reverse()",
    `origin: [${numArr}]`,
    `returned: [${numArr.reverse()}]`,
);
initializeArr();

fLog.log(
    "numArr.shift()",
    `origin: [${numArr}]`,
    `returned: [${numArr.shift()}]`,
);
initializeArr();

fLog.log(
    "numArr.slice(3, 7)",
    `origin: [${numArr}]`,
    `returned: [${numArr.slice(3, 7)}]`,
);
initializeArr();

fLog.log(
    "numArr.some((v, i, arr) => v % 3 === 0)",
    `origin: [${numArr}]`,
    `returned: [${numArr.some((v, i, arr) => v % 3 === 0)}]`,
);

fLog.log(
    "numArr.some((v, i, arr) => v % 11 === 0)",
    `origin: [${numArr}]`,
    `returned: [${numArr.some((v, i, arr) => v % 11 === 0)}]`,
);
initializeArr();

fLog.log(
    "numArr.sort()",
    `origin: [${numArr}]`,
    `returned: [${numArr.sort()}]`,
);
fLog.log(
    "strArr.sort()",
    `origin: [${strArr}]`,
    `returned: [${strArr.sort()}]`,
);
initializeArr();

fLog.log(
    "numArr.sort((a, b) => a - b))",
    `origin: [${numArr}]`,
    `returned: [${numArr.sort((a, b) => a - b)}]`,
);
fLog.log(
    "strArr.sort((a, b) => a - b))",
    `origin: [${strArr}]`,
    `returned: [${strArr.sort((a, b) => a - b)}]`,
);
initializeArr();

fLog.log(
    "numArr.splice(3)",
    `origin: [${numArr}]`,
    `returned: [${numArr.splice(3)}]`,
);
initializeArr();

fLog.log(
    "numArr.toLocaleString()",
    `origin: [${numArr}]`,
    `returned: [${numArr.toLocaleString()}]`,
);
initializeArr();

fLog.log(
    "numArr.toString()",
    `origin: [${numArr}]`,
    `returned: [${numArr.toString()}]`,
);
initializeArr();

fLog.log(
    "numArr.unshift(-1)",
    `origin: [${numArr}]`,
    `returned: [${numArr.unshift(-1)}]`,
);
initializeArr();

fLog.log(
    "numArr.values()",
    `origin: [${numArr}]`,
    `returned: [${numArr.values()}]`,
);

fLog.log(
    "[...numArr.values()]",
    `origin: [${numArr}]`,
    `returned: [${[...numArr.values()]}]`,
);
