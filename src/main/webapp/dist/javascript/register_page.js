$(document).ready(() => {
    //  Visibility buttons
    $("#mb-visibility, #dsk-visibility").click(() => {
        if (window.innerWidth < 768) {
            visibilitySwitch($("#mb-password-in"), $("#mb-visibility"));
        } else {
            visibilitySwitch($("#dsk-password-in"), $("#dsk-visibility"));
        }
    });

    $("#mb-visibility-repeat, #dsk-visibility-repeat").click(() => {
        if (window.innerWidth < 768) {
            visibilitySwitch($("#mb-password-repeat-in"), $("#mb-visibility-repeat"));
        } else {
            visibilitySwitch($("#dsk-password-repeat-in"), $("#dsk-visibility-repeat"));
        }
    });

    //  Get and check credentials 
    let name, surname, birthday, gender, email, psw, psw_check;
    
    $("#mb-first-name-in, #dsk-first-name-in").blur(() => { 
        if (window.innerWidth < 768) {
            let name_in = $("#mb-first-name-in").val();
            checkXSS(name_in)?alert("XSS Detected"):name = name_in;
        } else {
            let name_in = $("#dsk-first-name-in").val();
            checkXSS(name_in)?alert("XSS Detected"):name = name_in;
        }
    });

    $("#mb-last-name-in, #dsk-last-name-in").blur(() => { 
        if (window.innerWidth < 768) {
            let surname_in = $("#mb-last-name-in").val();
            checkXSS(surname_in)?alert("XSS Detected"):surname = surname_in;
        } else {
            let surname_in = $("#dsk-last-name-in").val();
            checkXSS(surname_in)?alert("XSS Detected"):surname = surname_in;
        }
    });

    $("#mb-birthday-in, #dsk-birthday-in").blur(() => { 
        if (window.innerWidth < 768) 
            birthday = $("#mb-birthday-in").val();
        else 
            birthday = $("#dsk-birthday-in").val();
    });

    $("#mb-gender-selection, #dsk-gender-selection").blur(() => { 
        if (window.innerWidth < 768) {
            gender = $("#mb-gender-selection").val();
            $("#mb-reg-form-wrapper").append($("<input>").attr({
                type: 'hidden',
                name: 'gender',
                value: gender
            }));
        } else {
            gender = $("#dsk-gender-selection").val();
            $("#dsk-reg-form").append($("<input>").attr({
                type: 'hidden',
                name: 'gender',
                value: gender
            }));
        }
    });

    //  Submit button is activated only when required inputs are filled
    let inputs_filled = {
        email_filled: false,
        psw_filled: false,
        psw_r_filled: false
    };

    const dsk_submit = $("#dsk-submit-button");
    const dsk_submit_container = $("#dsk-submit-container");

    const mb_submit = $("#mb-submit-button");
    const mb_submit_container = $("#mb-submit-container");

    submitOff(dsk_submit, dsk_submit_container);
    submitOff(mb_submit, mb_submit_container);


    //  Required data
    $("#mb-email-in, #dsk-email-in").blur(() => { 
        if (window.innerWidth < 768) {
            let email_in = $("#mb-email-in").val();
            if (checkXSS(email_in) || !isValidEmail(email_in)) {
                errorOn($("#mb-email-in-error"));

                inputs_filled.email_filled = false;
                submitOff(mb_submit, mb_submit_container);
            } else {
                errorOff($("#mb-email-in-error"));
                email = email_in;

                inputs_filled.email_filled = true;
                checkInputsFilled(inputs_filled, mb_submit, mb_submit_container);
            }
        } else {
            let email_in = $("#dsk-email-in").val();
            if (checkXSS(email_in) || !isValidEmail(email_in)) {
                errorOn($("#dsk-email-in-error"));

                inputs_filled.email_filled = false;
                submitOff(dsk_submit, dsk_submit_container);
            } else {
                errorOff($("#dsk-email-in-error"));
                email = email_in;

                inputs_filled.email_filled = true;
                checkInputsFilled(inputs_filled, dsk_submit, dsk_submit_container);
            }
        }
    });

    $("#dsk-password-in, #mb-password-in").blur(async () => {
        if (window.innerWidth < 768) {
            let psw_in = $("#mb-password-in").val();
            let [xssResult, passwordResult] = await Promise.all([checkXSS(psw_in), isValidPassword(psw_in)]);

            if (psw_in.length < 8 || xssResult || !passwordResult) {
                errorOn($("#mb-password-in-error"));

                inputs_filled.psw_filled = false;
                submitOff(mb_submit, mb_submit_container);
            } else  {
                psw = psw_in;
                errorOff($("#mb-password-in-error"));

                inputs_filled.psw_filled = true;
                checkInputsFilled(inputs_filled, mb_submit, mb_submit_container);
            }
        }
        else {
            let psw_in = $("#dsk-password-in").val();
            let [xssResult, passwordResult] = await Promise.all([checkXSS(psw_in), isValidPassword(psw_in)]);

            if (psw_in.length < 8 || xssResult || !passwordResult) {
                errorOn($("#dsk-password-in-error"));

                inputs_filled.psw_filled = false;
                submitOff(dsk_submit, dsk_submit_container);
            } else {
                psw = psw_in;
                errorOff($("#dsk-password-in-error"));

                inputs_filled.psw_filled = true;
                checkInputsFilled(inputs_filled, dsk_submit, dsk_submit_container);
            }
        }
    });

    $("#mb-password-repeat-in, #dsk-password-repeat-in").blur(() => { 
        if (window.innerWidth < 768) {
            let psw_in = $("#mb-password-repeat-in").val();
            
            if (psw !== undefined && psw_in === psw) {
                errorOff($("#mb-password-check-in-error"));
                psw_check = psw_in;

                inputs_filled.psw_r_filled = true;
                checkInputsFilled(inputs_filled, mb_submit, mb_submit_container);
            } else {
                errorOn($("#mb-password-check-in-error"));

                inputs_filled.psw_r_filled = false;
                submitOff(mb_submit, mb_submit_container);
            }
        } else {
            let psw_in = $("#dsk-password-repeat-in").val();
            
            if (psw !== undefined && psw_in === psw) {
                errorOff($("#dsk-password-check-in-error"));
                psw_check = psw_in;

                inputs_filled.psw_r_filled = true;
                checkInputsFilled(inputs_filled, dsk_submit, dsk_submit_container);
            } else {
                errorOn($("#dsk-password-check-in-error"));

                inputs_filled.psw_r_filled = false;
                submitOff(dsk_submit, dsk_submit_container);
            }
        }
    });

    function isValidPassword(ps) {
        return new Promise(function(resolve, reject) {
            let context_path = window.location.pathname.split('/')[1];
            $.ajax({
                url: `/${context_path}/pwned-password-check`,
                dataType: 'text',
                type: 'GET',
                data: {password: ps},
                success: function(data) {
                    if (data == "valid") {
                        resolve(true);
                    } else {
                        resolve(false);
                    }
                },
                error: function(jxhr) {
                    reject(jxhr);
                }
            });
        });
    }

    function errorOn(container) {
        container.removeClass("opacity-0");
        container.addClass("opacity-100");
    }
    
    function errorOff(container) {
        container.removeClass("opacity-100");
        container.addClass("opacity-0");
    }
});