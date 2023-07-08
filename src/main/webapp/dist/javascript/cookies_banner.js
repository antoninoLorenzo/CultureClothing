$(document).ready(() => {
    //  Cookies
    let cookies = document.cookie;
    if (cookies.includes("accepted_cookies=true")) {
        $("#cookie-banner-container").css("display", "none");
    }

    //  Add cookie if not present
    $("#cookie-accept-button").click(() => {
        $("#cookie-banner-container").css("display", "none");
        let context_path = window.location.pathname.split('/')[1];
        $.post(`/${context_path}/cookies`, {cookies: "true"},
            function(data) {

            });
    })

    $("#cookie-decline").click(() => {
        $("#cookie-banner-container").css("display", "none");
        let context_path = window.location.pathname.split('/')[1];
        $.post(`/${context_path}/cookies`, {cookies: "true"},
            function(data) {

            });
    });

    //  Logged
    //  UUID should be http only
    if (checkCookie('lggd')) {
        $("#mb-account-login").text("Cart");
        $("#mb-account-login").attr("href", "/cart");
        $("#mb-account-register").text("Order History");
        $("#mb-account-register").attr("href", "/order-history");

        $("#dsk-account-login").text("Cart");
        $("#dsk-account-login").attr("href", "/cart");
        $("#dsk-account-register").text("Order History");
        $("#dsk-account-register").attr("href", "/order-history");
    }


    const cookieDialog = document.getElementById('cookie-policy-dialog');
    $("#cookie-policy-cookie-banner").click(() => {
        console.log("cookie banner open dialog");
        openDialog(cookieDialog)
    });
});
