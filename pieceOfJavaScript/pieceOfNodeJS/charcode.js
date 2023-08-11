/**
 * 
 * @param {String} char Character which you want character code.
 * @returns Character Code.(Like 'A' => 65)
 */
const getCharCode = (char) => {
    return char.charCodeAt(0);
}

/**
 * 
 * @param {Number} charCode Character code which you want character.
 * @returns Character. (Like 65 => 'A')
 */
const getCharFromCharCode = (charCode) => {
    return String.fromCharCode(charCode);
}