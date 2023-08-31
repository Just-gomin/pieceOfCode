// @ts-check

/**
 * d.ts에 CallSignature를 정의 하지 않고, JSDoc을 이용한다면,
 * TypeScript와 JavaScript를 모두 사용가능하게 만들 수 있다.
 */

/**
 * Initializes the project
 * @param {object} config
 * @param {boolean} config.debug
 * @param {string} config.url
 * @returns boolean
 */
export function init(config) {
    return true;
}

/**
 * Exits the program
 * @param {number} code 
 * @returns 
 */
export function exit(code) {
    return code + 1;
}