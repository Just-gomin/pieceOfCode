import { FormattedLog, log, preNewLine } from "../logger.js";

const fLog = new FormattedLog(30, '>>', 40, '', 5);

class sampleClass {
    constructor(value) {
        this.value = value;
    }
}

const sampleArr = [];

const initialize = () => {
    for (let i = 0; i < 10; i++) {
        sampleArr.push(new sampleClass(i));
    }
}

initialize();

preNewLine("<<Change affect of for..of loop>>");
fLog.log('origin', sampleArr.map(v => v.value));
for (const sample of sampleArr) sample.value += 2;
fLog.log('after for..of loop', sampleArr.map(v => v.value));
// Array keep status after the change process through for..of loop.