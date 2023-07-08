$(document).ready(() => {
    const navbar_expanded = $("#navbar-expanded");
    const navbar_switch = $("#admin-menu-checkbox");

    navbar_switch.click(() => {
        if (navbar_switch.is(":checked")) {
            navbar_expanded.removeClass("hidden");

            $("#admin-close").removeClass("hidden");
            $("#admin-open").addClass("hidden");
        } else {
            navbar_expanded.addClass("hidden");
            $("#admin-close").addClass("hidden");
    
            $("#admin-open").removeClass("hidden");
        }
    });

    //  Fetch website data with interval to keep data updated
    fetchWebsiteData();
    window.setInterval(() => {
        fetchWebsiteData();
    }, 10000);

    function fetchWebsiteData() {
        $.get("/admin/data", (data) => {
            console.log(data);

            $("#visitors-paragraph").text(data["visitors"]);
            $("#revenue-paragraph").text(data["revenue"] + " €");
            $("#cvr-paragraph").text(data["sales"]/data["visitors"] + " %");
            $("#sales-paragraph").text(data["sales"]);
        });
    }
});