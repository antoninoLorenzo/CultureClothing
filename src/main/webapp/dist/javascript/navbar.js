$(document).ready(() => {
    const mbSearchContainer = document.getElementById("mb-search-result");
    mbSearchContainer.classList.add("hidden");

    //  Display Mobile Menu
    $("#nv-mb-hamburger-radio").click(() => { $("#navbar-mobile-menu").css("display", "block");})
    $("#mobile-menu-close-radio").click(() => { $("#navbar-mobile-menu").css("display", "none");})

    //  Menu Sections
    $("#mb-man-checkbox").click(() => { 
        if ($("#mb-man-checkbox").is(":checked")) {
            $("#mb-expanded-man").css("display", "flex");
            $("#mb-man-dropdown-arrow").removeClass("bi-chevron-down");
            $("#mb-man-dropdown-arrow").addClass("bi-chevron-up");
        }
        else {
            $("#mb-expanded-man").css("display", "none");
            $("#mb-man-dropdown-arrow").removeClass("bi-chevron-up");
            $("#mb-man-dropdown-arrow").addClass("bi-chevron-down");
        }
    });
    $("#mb-woman-checkbox").click(() => { 
        if ($("#mb-woman-checkbox").is(":checked")) {
            $("#mb-expanded-woman").css("display", "flex");
            $("#mb-woman-dropdown-arrow").removeClass("bi-chevron-down");
            $("#mb-woman-dropdown-arrow").addClass("bi-chevron-up");
        }
        else {
            $("#mb-expanded-woman").css("display", "none");
            $("#mb-woman-dropdown-arrow").removeClass("bi-chevron-up");
            $("#mb-woman-dropdown-arrow").addClass("bi-chevron-down");
        }
    });

    //  Search bar Mobile
    const mbInputContainer = $("#mb-search-input");
    $("#nv-mb-search").click(() => {
        if (mbInputContainer.hasClass("flex")) {
            $("#mb-nav-bg").hide();
            mbInputContainer.removeClass("flex");
            mbInputContainer.addClass("hidden");
        } else {
            $("#mb-nav-bg").show();
            mbInputContainer.removeClass("hidden");
            mbInputContainer.addClass("flex");
        }
    });

    //  Search bar Desktop
    const dskInputContainer = $("#dsk-search-input");
    $("#nv-dsk-search").click(() => {
        if (dskInputContainer.hasClass("flex")) {
            $("#dsk-nav-bg").hide();
            dskInputContainer.removeClass("flex");
            dskInputContainer.addClass("hidden");
        } else {
            $("#dsk-nav-bg").show();
            dskInputContainer.removeClass("hidden");
            dskInputContainer.addClass("flex");
        }
    });

    //  Search
    const mbSearchInput = $("#mb-search-input-field");
    const dskSearchInput = $("#dsk-search-input-field");

    let context_path = window.location.pathname.split('/')[1];
    $("#mb-search-icon-input, #dsk-search-icon-input").click(() => {
        console.log(`searching`);
        $("#mb-search-icon-input, #dsk-search-icon-input").addClass("opacity-60");
        $("#mb-search-icon-input, #dsk-search-icon-input").addClass("select-none");

        let input;

        //  First search input get correctly parsed, when switch from mb to dsk error:
        //  navbar.js:160 Uncaught TypeError: Cannot read properties of undefined (reading 'length')
        //  Reason: input = undefined

        if (mbSearchInput.val().length === 0)
            input = dskSearchInput.val();
        if (dskSearchInput.val().length === 0)
            input = mbSearchInput.val();

        if (checkXSS(input))
            alert("XSS Detected");
        else {

            mbSearchContainer.classList.remove("hidden");
            $("#mb-search-input").removeClass("flex");
            $("#mb-search-input").addClass("hidden");

            //  Query server
            //  Redirect to new page
            $.ajax({
                url: `/${context_path}/search`,
                method: 'GET',
                data: {
                    searching: input
                },
                success: function(response) {
                    $("#dsk-search-input, #mb-search-input").addClass("hidden");
                    let productData = retrieveProductData(response);

                    if (window.innerWidth < 640)
                        updateSearchResultMobile(productData);
                    else
                        updateSearchResultDesktop(productData);

                },
                error: function(xhr, status, error) {
                    // Handle any errors that occurred during the request
                    console.error(error);
                    $("#dsk-search-input, #mb-search-input").addClass("hidden");
                }
            });
        }

        $("#mb-search-icon-input, #dsk-search-icon-input").removeClass("opacity-60");
        $("#mb-search-icon-input, #dsk-search-icon-input").removeClass("select-none");
    });


    //  Account Icon
    $("#dsk-account-icon, #mb-account-icon").click(() => {
        if (window.innerWidth >= 640) {
            if ($("#dsk-account-dropdown").hasClass("hidden"))
                $("#dsk-account-dropdown").removeClass("hidden");
            else 
                $("#dsk-account-dropdown").addClass("hidden");
        } else {
            if ($("#mb-account-dropdown").hasClass("hidden"))
                $("#mb-account-dropdown").removeClass("hidden");
            else 
                $("#mb-account-dropdown").addClass("hidden");
        }
    });

    //  Logged
    const notLoggedOptions = $("#mb-not-logged-dropdown, #dsk-not-logged-dropdown");
    const loggedOptions = $("#mb-logged-dropdown, #dsk-logged-dropdown");

    //  UUID should be http only
    if (checkCookie('lggd')) {
         notLoggedOptions.hide();
         loggedOptions.show();
    } else {
        notLoggedOptions.show();
        loggedOptions.hide();
    }

    //  Cart
    let cartCounter = getCountOfIds("cart");
    if (cartCounter > 0)
        $("#nav-mb-cart-counter, #nav-dsk-cart-counter").text(cartCounter);

    /*
    function checkXSS(user_input) {
        return (DOMPurify.sanitize(user_input).length !== user_input.length);
    }
*/
    function retrieveProductData(response) {
        const products = [];

        for (const key in response) {
            if (response.hasOwnProperty(key)) {
                const product = response[key];

                let p_name =  product[0]["product_id"]["p_name"];
                let p_image = product[0]["image_link"];

                const productData = {
                    name: p_name,
                    image: p_image
                };

                products.push(productData);
            }
        }

        return products;
    }

    function updateSearchResultMobile(productData) {
        const $containerMobile = $("#mb-search-result");
        $containerMobile.empty();
        $containerMobile.removeClass("hidden");

        const $card = $('<div>')
            .addClass("nav-mb-product-loading w-[90%] flex mx-auto pt-8");

        const $image = $('<div>')
            .addClass("nav-mb-product-image w-[8rem] h-[8rem] bg-cover aspect-square")
            .css("background-image" , `url(${productData[0]["image"]})`)
            .click(() => {
                window.location.href = `/${context_path}/product?product_name=${encodeURIComponent(`${productData[0]["name"]}`)}`;
            });;

        const $infoWrapper = $('<div>')
            .addClass("nav-mb-product-info-wrapper w-[80%] flex justify-center items-center");

        const $info = $('<div>')
            .addClass("nav-mb-product-info w-[80%] flex justify-between");

        const $name = $('<h2>')
            .addClass("raleway-700 text-secondary text-lg select-none cursor-pointer hover:opacity-70")
            .text(`${productData[0]["name"]}`)
            .click(() => {
                window.location.href = `/${context_path}/product?product_name=${encodeURIComponent(`${productData[0]["name"]}`)}`;
            });

        const $close = $('<i>')
            .addClass("bi bi-x-lg text-secondary text-2xl select-none")
            .click(() => {
                $containerMobile.empty();
                $containerMobile.addClass("hidden");
            });

        $info.append($name, $close);
        $infoWrapper.append($info);

        $card.append($image, $infoWrapper);
        $containerMobile.append($card);
    }

    function updateSearchResultDesktop(productData) {
        const $containerDesktop = $("#dsk-search-result");
        $containerDesktop.empty();
        $containerDesktop.removeClass("hidden");

        const $card = $('<div>')
            .addClass("nav-mb-product-loading w-[90%] flex mx-auto pt-8");

        const $image = $('<div>')
            .addClass("nav-mb-product-image w-[8rem] h-[8rem] bg-cover aspect-square")
            .css("background-image" , `url(${productData[0]["image"]})`)
            .click(() => {
                window.location.href = `/${context_path}/product?product_name=${encodeURIComponent(`${productData[0]["name"]}`)}`;
            });;

        const $infoWrapper = $('<div>')
            .addClass("nav-mb-product-info-wrapper w-[80%] flex justify-center items-center");

        const $info = $('<div>')
            .addClass("nav-mb-product-info w-[80%] flex justify-between");

        const $name = $('<h2>')
            .addClass("raleway-700 text-secondary text-lg select-none cursor-pointer hover:opacity-70")
            .text(`${productData[0]["name"]}`)
            .click(() => {
                window.location.href = `/${context_path}/product?product_name=${encodeURIComponent(`${productData[0]["name"]}`)}`;
            });

        const $close = $('<i>')
            .addClass("bi bi-x-lg text-secondary text-2xl select-none")
            .click(() => {
                $containerDesktop.empty();
                $containerDesktop.addClass("hidden");
            });

        $info.append($name, $close);
        $infoWrapper.append($info);

        $card.append($image, $infoWrapper);
        $containerDesktop.append($card);
    }
})