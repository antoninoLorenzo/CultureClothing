/**
 * Needed: jQuery
 * @param input: form input where visibility should be enabled/disabled
 * @param visibility_icon: icon that is clicked to switch visibility
 * */
function visibilitySwitch(input, visibility_icon) {
    if (input.attr("type") === "password") {
        input.attr("type", "text");
        visibility_icon.text("visibility_off");
    } else {
        input.attr("type", "password");
        visibility_icon.text("visibility");
    }
}

/**
 * Enables the submit button only if user has entered required data
 * */
function checkInputsFilled(inputs_filled, submit, submit_container) {
    let out = true;
    for (let filled in inputs_filled)
        if (inputs_filled[filled] === false) out = false;

    if (out)
        submitOn(submit, submit_container);
    else
        submitOff(submit, submit_container);
}
function submitOff(submit, container) {
    submit.attr("disabled", "disabled");
    container.addClass("opacity-60");
}

function submitOn(submit, container)  {
    submit.removeAttr("disabled");
    container.removeClass("opacity-60");
}