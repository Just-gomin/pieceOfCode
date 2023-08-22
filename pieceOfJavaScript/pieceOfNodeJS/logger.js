export const log = console.log;
export const preNewLine = (msg) => {
    console.log("\n", msg);
};
export const postNewLine = (msg) => {
    console.log(msg, "\n");
};

export class FormattedLog {
    constructor(
        headerSize = 40,
        headerBodyDivider = ">>",
        bodySize = 40,
        bodyTailDivider = ">>",
        dividerGap = 5
    ) {
        this.headerSize = headerSize;
        this.headerBodyDivider = headerBodyDivider;
        this.bodySize = bodySize;
        this.bodyTailDivider = bodyTailDivider;
        this.dividerGap = dividerGap;
    }

    log = (
        header,
        body,
        tail
    ) => {
        const blank = " ";
        let msg = "";

        const makeDividerMsg = (divider) => `${blank.repeat(this.dividerGap)}${divider}${blank.repeat(this.dividerGap)}`;

        msg += header;

        if (body) {
            msg += `${blank.repeat((this.headerSize - header.length) > 0 ? this.headerSize - header.length : 0)}`;
            msg += makeDividerMsg(this.headerBodyDivider);

            msg += body;
        }

        if (tail) {
            msg += `${blank.repeat((this.bodySize - body.length) > 0 ? this.bodySize - body.length : 0)}`;
            msg += makeDividerMsg(this.bodyTailDivider);

            msg += tail;
        }

        console.log(msg);
    };

}