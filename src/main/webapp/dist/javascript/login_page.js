$(document).ready(() => {

    //  Password visibility
    $("#mb-log-visibility, #dsk-log-visibility").click(() => {
        if (window.innerWidth < 640) {
            visibilitySwitch($("#mb-log-password-in"), $("#mb-log-visibility"));
        } else {
            visibilitySwitch($("#dsk-log-password-in"), $("#dsk-log-visibility"));
        }
    });

    //  Submit button is activated only when required inputs are filled
    let inputs_filled = {
        email_filled: false,
        psw_filled: false,
    };

    const dsk_submit = $("#dsk-login-submit-button");
    const dsk_submit_container = $("#dsk-login-submit-container");

    const mb_submit = $("#mb-login-submit-button");
    const mb_submit_container = $("#mb-login-submit-container");

    submitOff(dsk_submit, dsk_submit_container);
    submitOff(mb_submit, mb_submit_container);

    let email, password;
    $("#mb-log-email-in, #dsk-log-email-in").blur(() => {
        let inputMail;
        if (window.innerWidth < 640) {
            inputMail = $("#mb-log-email-in").val();
        } else {
            inputMail = $("#dsk-log-email-in").val();
        }
        if (checkXSS(inputMail) || !isValidEmail(inputMail)) {
            $("#dsk-login-error").removeClass("opacity-0");
        } else {
            $("#dsk-login-error").addClass("opacity-0");
            email = inputMail;

            inputs_filled.email_filled = true;
            checkInputsFilled(inputs_filled, dsk_submit, dsk_submit_container);
            checkInputsFilled(inputs_filled, mb_submit, mb_submit_container);
        }
    });

    $("#mb-log-password-in, #dsk-log-password-in").blur(() => {
        let inputPassword;
        if (window.innerWidth < 640) {
            inputPassword = $("#mb-log-password-in").val();
        } else {
            inputPassword = $("#dsk-log-password-in").val();
        }
        if (checkXSS(inputPassword)) {
            alert("XSS Detected");
        } else {
            password = inputPassword;

            inputs_filled.psw_filled = true;
            checkInputsFilled(inputs_filled, dsk_submit, dsk_submit_container);
            checkInputsFilled(inputs_filled, mb_submit, mb_submit_container);
        }
    });
});