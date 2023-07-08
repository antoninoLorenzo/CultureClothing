$(document).ready(function () {
    $("#dsk-nav-bg, #mb-nav-bg").removeClass("hidden");

    //  Load product data
    const productData = retrieveProductData(products);
    let imagesList = [];
    updateProductPage(productData);
    let currentCounter = 0;

    //  Image switcher managment
    const switchLeft = $("#mb-pr-switch-left-img");
    const switchRight = $("#mb-pr-switch-right-img");

    switchRight.click(() => {
        if (imagesList[currentCounter+1] != null) {
            currentCounter = currentCounter + 1;
            $("#mb-product-image, #pr-dsk-main-image").css("background-image", `url(${imagesList[currentCounter]})`)
        } 
    });

    switchLeft.click(() => {
        if (imagesList[currentCounter-1] != null) {
            currentCounter = currentCounter - 1;
            $("#mb-product-image, #pr-dsk-main-image").css("background-image", `url(${imagesList[currentCounter]})`)
        } 
    });

    //  Dropdown Managment
    const sizeDropdown = $("#pr-mb-size-dropdown");
    const sizeOptions = $("#pr-mb-size-option");

    sizeDropdown.click(() => { 
        openSizeDropdown();
    });

    function openSizeDropdown() {
        if (sizeDropdown.hasClass("bi-chevron-down")) {
            sizeDropdown.removeClass("bi-chevron-down");
            sizeDropdown.addClass("bi-chevron-up");

            sizeOptions.removeClass("hidden");
        } else {
            sizeDropdown.removeClass("bi-chevron-up");
            sizeDropdown.addClass("bi-chevron-down");

            sizeOptions.addClass("hidden");
        }
    }

    const colorDropdown = $("#pr-mb-color-dropdown");
    const colorOptions = $("#pr-mb-color-option");

    colorDropdown.click(() => { 
        if (colorDropdown.hasClass("bi-chevron-down")) {
            colorDropdown.removeClass("bi-chevron-down");
            colorDropdown.addClass("bi-chevron-up");

            colorOptions.removeClass("hidden");
        } else {
            colorDropdown.removeClass("bi-chevron-up");
            colorDropdown.addClass("bi-chevron-down");

            colorOptions.addClass("hidden");
        }
    });

    //  Size Managment
    let selected_size;
    let selected_box = null;

    const mobileS = $("#pr-mb-s");
    const mobileM = $("#pr-mb-m");
    const mobileL = $("#pr-mb-l");
    const mobileXL = $("#pr-mb-xl");

    const desktopS = $("#pr-dsk-s");
    const desktopM = $("#pr-dsk-m");
    const desktopL = $("#pr-dsk-l");
    const desktopXL = $("#pr-dsk-xl");

    mobileS.click(() => { switchSize(mobileS); });
    mobileM.click(() => { switchSize(mobileM); });
    mobileL.click(() => { switchSize(mobileL); });
    mobileXL.click(() => { switchSize(mobileXL); });

    desktopS.click(() => { switchSize(desktopS); });
    desktopM.click(() => { switchSize(desktopM); });
    desktopL.click(() => { switchSize(desktopL); });
    desktopXL.click(() => { switchSize(desktopXL); });

    function switchSize (size) {
        if (selected_box != null)
            selected_box.removeClass("border-2 border-secondary");
        size.addClass("border-2 border-secondary");

        selected_size = size.children("p").text();
        selected_box = size;
    }

    function retrieveProductData(data) {
        const products = [];
        const img = [];

        for (const key in data) {
            if (data.hasOwnProperty(key)) {
                const product = data[key];

                let p_id = product[0]["product_id"]["p_id"];
                let p_name =  product[0]["product_id"]["p_name"];
                let p_price = product[0]["product_id"]["p_price"];
                let p_brand = product[0]["product_id"]["brand_id"]["brand_name"];
                let p_desc = product[0]["product_id"]["p_desc"];
                let p_size = product[0]["product_id"]["size"];
                
                for (let i = 0; i < product.length; i++)
                    img[i] = product[i]["image_link"];

                const productData = {
                    id: p_id,
                    name: p_name,
                    price: p_price,
                    brand: p_brand,
                    description: p_desc,
                    size: p_size,
                    img: img
                };

                products.push(productData);
            }
        }

        return products;
    }

    function updateProductPage(productData) {
        document.title = titleCase(productData[0]["name"]) + " | " + "Culture Clothing"

        $("#mb-product-header > a, #dsk-product-header > a").text(titleCase(productData[0]["brand"]));
        $("#mb-product-header > h1, #dsk-product-header > h1").text(productData[0]["name"]);
        $("#pr-mb-price, #pr-dsk-price").text(productData[0]["price"] + " €");
        $("#pr-mb-info-description-container > p, #pr-dsk-info-description-container > p").text(productData[0]["description"]);

        //  Update images
        imagesList[0] = productData[0]["img"][0];
        $("#mb-product-image, #pr-dsk-main-image").css("background-image", `url(${imagesList[0]})`);

        const $switchContainer = $("#pr-dsk-image-switch");
        for (let i = 0; i < productData[0]["img"].length; i++) {
            imagesList[i] = productData[0]["img"][i];

            let $switch = $('<div>')
                .addClass("w-24 h-24 rounded-3xl cursor-pointer active:opacity-70 shadow-sm hover:shadow-lg transition-shadow duration-300")
                .click(() => {
                    switchImages(i, $switch);
                });

            let $img = $('<img>');
            $img.attr('src', `${imagesList[i]}`);

            $switch.append($img);
            $switchContainer.append($switch);
        }


    }

    $("#pr-mb-add-to-cart, #pr-dsk-add-to-cart").click(() => {
        if (selected_size == null) {
            openSizeDropdown();
        } else {
            let pos = findBySize(productData, selected_size);
            let id = productData[pos]["id"];

            //  Send post request to cart servlet
            let context_path = window.location.pathname.split('/')[1];
            $.post(`/${context_path}/add_to_cart`, {product: id}, (data) => {
                //  Update cart icon when server sent a response
                let cartCounter = getCountOfIds("cart");
                if (cartCounter > 0)
                    $("#nav-mb-cart-counter, #nav-dsk-cart-counter").text(cartCounter);
            });
        }
    });

    function switchImages(pos, element) {
        $("#mb-product-image, #pr-dsk-main-image").css("background-image", `url(${imagesList[pos]})`);
        element.children("img").css("background-image", `url(${imagesList[0]})`);
    }
});