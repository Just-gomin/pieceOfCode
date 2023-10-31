import { FormattedLog, log, preNewLine } from "../logger.js";

const fLog = new FormattedLog(30, '>>', 40, '', 5);

class sampleClass {
    constructor(value) {
        this.value = value;
    }
}

let sampleArr = new Array();

const initialize = () => {
    sampleArr = new Array();
    for (let i = 0; i < 10; i++) {
        sampleArr.push(new sampleClass(i + 1));
    }
}

initialize();
preNewLine("<<Change affect of for..of loop>>");
fLog.log('origin', sampleArr.map(v => v.value));
for (const sample of sampleArr) {
    sample.value += 2;
}
fLog.log('after for..of loop', sampleArr.map(v => v.value));

initialize();
preNewLine("<<Change affect of for..in loop>>");
fLog.log('Origin', sampleArr.map(v => v.value));
for (const property in sampleArr) {
    sampleArr[property].value += 2; // property: [INDEX], sampleArr[property]: sampleClass { value: [VALUE] }
}
fLog.log('Changed', sampleArr.map(v => v.value));

initialize();
preNewLine("<<Change affect of for loop>>");
fLog.log('Origin', sampleArr.map(v => v.value));
for (let index = 0; index < sampleArr.length; index++) {
    sampleArr[index].value += 2; // index: [INDEX], sampleArr[index]: [VALUE]
}
fLog.log('Changed', sampleArr.map(v => v.value));

initialize();
preNewLine("<<Change affect of while loop>>");
fLog.log('Origin', sampleArr.map(v => v.value));
let whileIndex = 0;
while (whileIndex < sampleArr.length) {
    sampleArr[whileIndex].value += 2; // whileIndex: [whileINDEX], sampleArr[whileIndex]: [VALUE]
    whileIndex++;
}
fLog.log('Changed', sampleArr.map(v => v.value));

initialize();
preNewLine("<<Change affect of do while loop>>");
fLog.log('Origin', sampleArr.map(v => v.value));
let doWhileIndex = 0;
do {
    sampleArr[doWhileIndex].value += 2; // doWhileIndex: [Index], sampleArr[doWhileIndex]: [VALUE]
    doWhileIndex++;
} while (doWhileIndex < sampleArr.length);
fLog.log('Changed', sampleArr.map(v => v.value));

initialize();
preNewLine("<<Change affect of map loop>>");
fLog.log('Origin', sampleArr.map(v => v.value));
sampleArr.map((v, i, arr) => {
    v.value += 2;
});
fLog.log('Changed', sampleArr.map(v => v.value));

initialize();
preNewLine("<<Change affect of forEach loop>>");
fLog.log('Origin', sampleArr.map(v => v.value));
sampleArr.forEach((v, i, arr) => {
    v.value += 2;
});
fLog.log('Changed', sampleArr.map(v => v.value));