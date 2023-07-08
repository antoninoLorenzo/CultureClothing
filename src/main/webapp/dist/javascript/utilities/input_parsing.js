/**
 * @return true: xss attempt
 * @return false: valid input
 * */
function checkXSS(user_input) {
    return (DOMPurify.sanitize(user_input).length !== user_input.length);
}

/**
 * @return true: valid email format
 * @return false: invalid email format
 * */
function isValidEmail(mail) {
    return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(mail);
}

/**
 * @return input string formatted in Title Case and without any '_'
 * */
function titleCase(str) {
    if (str === null || str === undefined || checkXSS(str))
        return null;
    //  Replace underscores with whitespace
    str = str.replace(/_/g, ' ');

    //  Capitalize first letter of each word
    //  \b searches for an occurency at the beginning of string
    //  \w searches for a word character
    //  /g every occurence in the string
    //  (otherwise for multiple worlds wouldn't replace every initial)
    str = str.replace(/\b\w/g, function(match) {
        return match.toUpperCase();
    });

    return str;
}
