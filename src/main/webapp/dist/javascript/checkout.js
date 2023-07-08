$(document).ready(() => {
    $("#mb-nav-bg, #dsk-nav-bg").removeClass("hidden");
    let context_path = window.location.pathname.split('/')[1];
    //  Products Request
    const products_price_paragraph = $("#ck-products-total-price");
    products_price_paragraph.text(0 + "€");
    let product_data;

    $.get(`/${context_path}/checkout/data`,
        {products: getCookieValue("cart")},
        (data) => {
            product_data = retrieveProductsData(data);

            updateProducts(product_data);
    });

    //  If user is logged in, handle user data request
    let email = "", name = "", surname = "";

    //  Handle Form Graphics
    const shipping_form = $("#ck-shipping-form-container");
    const payment_form = $("#ck-payment-form-container");
    const confirm_container = $("#ck-confirm-container");

    const switch_array = [shipping_form, payment_form, confirm_container];
    const chevronLeft = $("#ck-chevron-left");
    const chevronRight = $("#ck-chevron-right");
    let current = 0;

    chevronLeft.click(() => { 
        if (current > 0 && isCompiled(switch_array[current])) {
            chevronLeft.removeClass("opacity-50");

            switch_array[current].addClass("lg:hidden");
            switch_array[current-1].removeClass("lg:hidden");

            current--;
        } else {
            chevronLeft.addClass("opacity-50");
        }
    });

    chevronRight.click(() => { 
        if (current < 2 && isCompiled(switch_array[current])) {
            chevronRight.removeClass("opacity-50");

            switch_array[current].addClass("lg:hidden");
            switch_array[current+1].removeClass("lg:hidden");

            current++;
        }
        else {
            chevronRight.addClass("opacity-50");
        }
    });

    $("#ck-shipping-form").blur(() => {
        if (isCompiled($("#ck-shipping-form"))) {
            shipping_form.removeClass("border-white-shade");
            shipping_form.addClass("border-secondary");
        }
    });

    $("#ck-payment-form").blur(() => {
        if (isCompiled($("#ck-payment-form"))) {
            payment_form.removeClass("border-white-shade");
            payment_form.addClass("border-secondary");
        }
    });

    //  Handle Form Data
    const country = "IT"; // Default
    let city = "", state = "", cap = "", delivery_type = "standard delivery", address = "";
    let delivery_price = 0;

    let provider = "";
    let card_number = "", expiring_date = "", cvv = "";

    const email_in = $("#ck-email");
    const name_in = $("#ck-first-name");
    const surname_in = $("#ck-second-name");
    const city_state_in = $("#ck-city-state");
    const address_in = $("#ck-address");
    const cap_in = $("#ck-cap");
    const delivery_in = $("#ck-delivery-type");

    const card_number_in = $("#ck-card-number");
    const expiring_date_in = $("#ck-card-expiring");
    const cvv_in = $("#ck-card-code");

    email_in.blur(() => {
        email = parseFormData(email_in.val());
        $("#ck-user-email").text(email);
    });
    name_in.blur(() => {
        name = parseFormData(name_in.val())
        let upperCaseName = name.charAt(0).toUpperCase() + name.slice(1);
        let upperCaseSurname = surname.charAt(0).toUpperCase() + surname.slice(1);
        $("#ck-user-name").text(upperCaseSurname + ", " + upperCaseName);
    });
    surname_in.blur(() => {
        surname = parseFormData(surname_in.val())
        let upperCaseName = name.charAt(0).toUpperCase() + name.slice(1);
        let upperCaseSurname = surname.charAt(0).toUpperCase() + surname.slice(1);
        $("#ck-user-name").text(upperCaseSurname + ", " + upperCaseName);
    });
    city_state_in.blur(() => {
        let arr = parseFormData(city_state_in.val()).split(", ");
        city = arr[0];
        state = arr[1];
        $("#ck-user-location").text(city + ", " + state + " CAP, IT");
    });
    address_in.blur(() => {
        address = parseFormData(address_in.val());
        $("#ck-user-address").text(address);
    });
    cap_in.blur(() => {
        cap = parseFormData(cap_in.val())
        $("#ck-user-location").text(city + ", " + state + " " + cap + ", IT");
    });

    const delivery_paragraph = $("#ck-delivery-price");
    const total_paragraph = $("#ck-total-price");
    delivery_paragraph.text(delivery_price + " €");

    delivery_in.click(() => {
        delivery_type = delivery_in.val();
        delivery_price = updateDeliveryPrice(delivery_type);

        delivery_paragraph.text(delivery_price + " €");
        total_paragraph.text(
            parseInt(delivery_price)
                + parseInt(products_price_paragraph.text())
                + " €"
        );

        $("#ck-user-delivery").text(delivery_type);
    });

    card_number_in.blur(() => {
        card_number = parseFormData(card_number_in.val())
        $("#ck-user-card").text(card_number);
    });
    expiring_date_in.blur(() => {
        expiring_date = parseFormData(expiring_date_in.val())
    });
    cvv_in.blur(() => {
        cvv = parseFormData(cvv_in.val())
    });

    $("#ck-mastercard-radio").click(() => { provider = $("#ck-mastercard-radio").val()});
    $("#ck-visa-radio").click(() => { provider = $("#ck-mastercard-radio").val()});
    $("#ck-paypal-radio").click(() => { provider = $("#ck-mastercard-radio").val()});

    //  Confirm Order Request
    $("#ck-confirm-button").click(() => {
        //  Update data in confirm section
        let final_price = $("#ck-total-price").text().split(" €")[0];

        $.post(`/${context_path}/checkout/data`, {
            city: city,
            state: state,
            country: country,
            address: address,
            cap: cap,
            delivery_type: delivery_type,
            card_number: card_number,
            expiring_date: expiring_date,
            provider: provider,
            final_price: final_price
        }, (data, status) => {
            if (status === "success") {
                modifyCookie("cart", "");
                alert("Order Successfull");
            } else {
                alert("Order Failed");
            }
        });
    });

    //  Utilities
    function retrieveProductsData(response) {
        const products = [];

        for (const key in response) {
            if (response.hasOwnProperty(key)) {
                const product = response[key];

                let p_name =  product[0]["product_id"]["p_name"];
                let p_price = product[0]["product_id"]["p_price"];
                let p_image = product[0]["image_link"];

                const productData = {
                    name: p_name,
                    price: p_price,
                    image: p_image
                };

                products.push(productData);
            }
        }

        return products;
    }

    function updateProducts(productsData) {
        const $container = $("#ck-recap-products");
        $container.empty();

        let tot_price = 0;

        productsData.forEach((product) => {
            const $card = $('<div>')
                .addClass("ck-recap-product w-full flex mx-auto pt-8");

            const $image = $('<div>')
                .addClass("ck-recap-product-image w-[6rem] h-[6rem] bg-cover aspect-square bg-primary")
                .css("background-image", `url(${product.image})`);

            const $info_wrapper = $('<div>')
                .addClass("ck-recap-product-info-wrapper w-[80%] flex justify-center items-center");

            const $info = $('<div>')
                .addClass("ck-recap-product-info w-[80%] flex flex-col justify-between");

            const $name = $('<h2>')
                .addClass("raleway-500 text-secondary text-lg select-none")
                .text(`${product.name}`);

            const $price = $('<p>')
                .addClass("raleway-500 text-secondary text-lg select-none")
                .text(`${product.price} €`);

            $info.append($name, $price);
            $info_wrapper.append($info);
            $card.append($image, $info_wrapper);

            $container.append($card);

            tot_price += product.price;
        });

        products_price_paragraph.text(tot_price + " €");
        $("#ck-total-price").text(tot_price + "€");
    }

    function updateDeliveryPrice(type) {
        switch (type) {
            case "standard delivery":
                return 0;
            case "express delivery":
                return 15;
            case "next-day delivery":
                return 30;
            default: return 100;
        }
    }

    function isCompiled(form) {
        let form_compiled = true;
        form.find('input').each(function() {
            if ($(this).val() === '') {
                console.log("Un campo non e' stato riempito");
                form_compiled = false;
            }
        });
        return form_compiled;
    }

    function parseFormData(input) {
        if(checkXSS(input))
            alert("XSS Detected");
        else 
            return input;
    }
});