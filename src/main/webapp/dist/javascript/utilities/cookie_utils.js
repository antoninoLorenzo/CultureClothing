/**
 * Used to check if a cookie exists
 * */
function checkCookie(cookieName) {
    const cookies = document.cookie.split(';');
    for (let i = 0; i < cookies.length; i++) {
        const cookie = cookies[i].trim();
        if (cookie.indexOf(cookieName + '=') === 0)
            return true;
    }
    return false;
}

/**
* Used to get a cookie value given the name
* */
function getCookieValue(cookieName) {
    const cookies = document.cookie.split(';');

    for (let i = 0; i < cookies.length; i++) {
        const cookie = cookies[i].trim();
        if (cookie.startsWith(cookieName + '=')) {
            return cookie.substring(cookieName.length + 1);
        }
    }

    return null;
}

/**
 * Used to mofify the value of a cookie
 * */
function modifyCookie(cookieName, newValue) {
    let context_path = window.location.pathname.split('/')[1];
    if (checkCookie(cookieName))
        document.cookie = `${cookieName}=${newValue}; path=${context_path}`;
}

/**
 * Used to count the number of products stored in cart cookie
 * */
function getCountOfIds(cookieName) {
    const cookieValue = getCookieValue(cookieName);

    if (cookieValue) {
        const ids = cookieValue.split('_');
        return ids.length;
    }

    return 0; // Cookie not found or no IDs present
}

function openDialog(cookieDialog) {
    cookieDialog.showModal();

    $("#cookie-dialog-close-button").click(() => {
        cookieDialog.close();
    });
}
