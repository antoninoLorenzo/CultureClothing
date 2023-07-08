$(document).ready(() => {
    //  Footer Mobile Info
    $("#mb-legal-info-radio").click(() => {
        if($("#mb-legal-info-radio").is(":checked")) {
            $("#expanded-legal-info").css("display", "flex");
            $("#mb-legal-info-arrow").removeClass("bi-chevron-down");
            $("#mb-legal-info-arrow").addClass("bi-chevron-up");
        }
        else {
            $("#expanded-legal-info").css("display", "none");
            $("#mb-legal-info-arrow").removeClass("bi-chevron-up");
            $("#mb-legal-info-arrow").addClass("bi-chevron-down");
        }
    })

    $("#mb-contact-info-checkbox").click(() => {
        if($("#mb-contact-info-checkbox").is(":checked")) {
            $("#expanded-contact-info").css("display", "flex");
            $("#mb-contact-info-arrow").removeClass("bi-chevron-down");
            $("#mb-contact-info-arrow").addClass("bi-chevron-up");
        }
        else {
            $("#expanded-contact-info").css("display", "none");
            $("#mb-contact-info-arrow").removeClass("bi-chevron-up");
            $("#mb-contact-info-arrow").addClass("bi-chevron-down");
        }
    })

    $("#mb-payment-info-checkbox").click(() => {
        if($("#mb-payment-info-checkbox").is(":checked")) {
            $("#expanded-payment-info").css("display", "flex");
            $("#mb-payment-info-arrow").removeClass("bi-chevron-down");
            $("#mb-payment-info-arrow").addClass("bi-chevron-up");
        }
        else {
            $("#expanded-payment-info").css("display", "none");
            $("#mb-payment-info-arrow").removeClass("bi-chevron-up");
            $("#mb-payment-info-arrow").addClass("bi-chevron-down");
        }
    })

    const cookieDialog = document.getElementById('cookie-policy-dialog');
    $("#open-cookie-policy").click(() => {
        console.log("footer open dialog");
        openDialog(cookieDialog);
    })
})