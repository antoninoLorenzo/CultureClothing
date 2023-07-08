$(document).ready(() => {
    let context_path = window.location.pathname.split('/')[1];
    let gender = getCookieValue("gender");
    let category = getCookieValue("category");
    let brand = getCookieValue("brand");

    //  Retrieve info on categories to query server
    if (gender !== "") {
        $("#category-first").text(gender);
        if(category !== "") {
            let categoryFormatted = titleCase(category);

            if (categoryFormatted === null)
                document.title = "Culture Clothing";
            else {
                document.title = categoryFormatted + " | " + "Culture Clothing";
                $("#category-second").text(categoryFormatted);
                $("#page-name").text(categoryFormatted);
            }
        }
        else {
            let genderFormatted = titleCase(gender);
            document.title = genderFormatted + " | " + "Culture Clothing";
            $("#category-second").addClass("hidden");
            $("#page-name").text(genderFormatted);
        }
    } else {
        if (brand !== "") {
            let brandFormatted = titleCase(brand);
            document.title = brandFormatted + " | " + "Culture Clothing";
            $("#category-first").text(brandFormatted);
            $("#page-name").text(brandFormatted);
            $("#category-second").addClass("hidden");
        }
    }

    //  Load products
    let productData = [];
    let pages= 0;
    queryProducts();

    //  Load more products
    $("#ct-load-more").click(() => {
        queryProducts();
        modifyCookie("page", pages.toString());
    });

    //  Filter By Price
    const range_config = {
        type: "double", // Enables two thumbs
        grid: true,     // Shows a grid for better visualization
        min: 0,         // Minimum value
        max: 400,       // Maximum value
        from: 0,        // Initial value for the left thumb
        to: 400,        // Initial value for the right thumb
        prefix: "€",    // Optional prefix for the displayed values
        onFinish: function (data) {
            filterProductsByPrice(data.from, data.to);
        }
    };

    $("#price-range-dsk").ionRangeSlider(range_config);
    $("#price-range-mb").ionRangeSlider(range_config);

    function filterProductsByPrice(from, to) {
        let filteredProducts = [];
        for (const page in productData) {
            filteredProducts.push(
                productData[page].filter((product) => {
                    let price = product["price"];
                    return price > from && price < to;
                })
            );
        }
        /*
        let filteredProducts = productData[0].filter((product) => {
            let price = product["price"]
            return price > from && price < to
        });*/
/*
        let tmp = [];
        tmp.push(filteredProducts);

        console.log("tmp filter: ");
        console.log(tmp);
        console.log("\n");
*/
        createProductCards(filteredProducts, true);
    }

    //  Show Mobile Filters
    const mb_filter_toggle = $("#ct-filter-toggle");
    const mb_filters_container = $("#ct-mb-filters-container");

    mb_filter_toggle.click(() => {
        if (mb_filters_container.hasClass("hidden"))
            mb_filters_container.removeClass("hidden");
        else
            mb_filters_container.addClass("hidden");
    });

    //  Show Desktop Price Filter
    $("#ct-price-btn-dsk").click(() => {
        if($("#ct-dsk-price-toggle").hasClass("hidden")) {
            $("#ct-dsk-price-toggle").removeClass("hidden");
            $("#ct-price-btn-dsk").removeClass("bi-chevron-down");
            $("#ct-price-btn-dsk").addClass("bi-chevron-up");
        } else {
            $("#ct-dsk-price-toggle").addClass("hidden");
            $("#ct-price-btn-dsk").removeClass("bi-chevron-up");
            $("#ct-price-btn-dsk").addClass("bi-chevron-down");
        }
    });
    
    //  Show size filter
    /*
    $("#ct-size-btn-dsk").click(() => {
        if($("#ct-dsk-size-toggle").hasClass("hidden")) {
            $("#ct-dsk-size-toggle").removeClass("hidden");
            $("#ct-size-btn-dsk").removeClass("bi-chevron-down");
            $("#ct-size-btn-dsk").addClass("bi-chevron-up");
        } else {
            $("#ct-dsk-size-toggle").addClass("hidden");
            $("#ct-size-btn-dsk").removeClass("bi-chevron-up");
            $("#ct-size-btn-dsk").addClass("bi-chevron-down");
        }
    });

    //  Show color filter
    $("#ct-color-btn-dsk").click(() => {
        if($("#ct-dsk-color-toggle").hasClass("hidden")) {
            $("#ct-dsk-color-toggle").removeClass("hidden");
            $("#ct-color-btn-dsk").removeClass("bi-chevron-down");
            $("#ct-color-btn-dsk").addClass("bi-chevron-up");
        } else {
            $("#ct-dsk-color-toggle").addClass("hidden");
            $("#ct-color-btn-dsk").removeClass("bi-chevron-up");
            $("#ct-color-btn-dsk").addClass("bi-chevron-down");
        }
    });

    //  filtering by size
    const dsk_size_checkbox_s = $("#ct-dsk-size-s > input");
    const dsk_size_checkbox_m = $("#ct-dsk-size-m > input");
    const dsk_size_checkbox_l = $("#ct-dsk-size-l > input");
    const dsk_size_checkbox_xl = $("#ct-dsk-size-xl > input");

    const mb_size_checkbox_s = $("#ct-mb-size-s > input");
    const mb_size_checkbox_m= $("#ct-mb-size-m > input");;
    const mb_size_checkbox_l = $("#ct-mb-size-l > input");;
    const mb_size_checkbox_xl = $("#ct-mb-size-xl > input");

    dsk_size_checkbox_s.click(() => { filterBySize(dsk_size_checkbox_s); });
    dsk_size_checkbox_m.click(() => { filterBySize(dsk_size_checkbox_m); });
    dsk_size_checkbox_l.click(() => { filterBySize(dsk_size_checkbox_l); });
    dsk_size_checkbox_xl.click(() => { filterBySize(dsk_size_checkbox_xl); });

    mb_size_checkbox_s.click(() => { filterBySize(mb_size_checkbox_s); });
    mb_size_checkbox_m.click(() => { filterBySize(mb_size_checkbox_m); });
    mb_size_checkbox_l.click(() => { filterBySize(mb_size_checkbox_l); });
    mb_size_checkbox_xl.click(() => { filterBySize(mb_size_checkbox_xl); });

    let selected_sizes = [];
    function filterBySize(checkbox) {
        getSelectedSizes(checkbox);

        console.log("[catalog.js]: selected_sizes: ");
        console.log(selected_sizes);

        let filteredProducts = productData[0].map((product) => {
            console.log("current size: ");
            console.log(product["id"]["size"]);
            if(selected_sizes.includes(product["id"]["size"]))
                return product;
        });

        console.log("filtered products: ");
        for (let i = 0 ; i < filteredProducts.length; i++) {
            console.log(`[${i}]`);
            console.log(filteredProducts[i]);
        }
    }

    function getSelectedSizes(checkbox) {
        if (checkbox.prop("checked")) {
            selected_sizes.push(checkbox.val());
        } else {
            selected_sizes = selected_sizes.filter(size => {
                return size !== checkbox.val();
            });
        }
    }
    */


    /**
     * Query the server for products
     * */
    function queryProducts() {

        $.ajax({
            url: `/${context_path}/product-catalog`,
            data: {
                gender: gender,
                category: category,
                brand: brand,
                page: pages
            },
            dataType: "json",
            success: function(response) {
                if(Object.keys(response).length === 0)
                    $("#ct-load-more").addClass("hidden");

                let responseProducts = retrieveProductData(response);
                let filteredResponse;

                if (pages > 0) {
                    let previousProducts = productData.slice(0, pages).flat();

                    filteredResponse = responseProducts.filter((newProduct) => {
                        for (const key in productData[pages-1]) {
                            if (previousProducts[key].name === newProduct.name)
                                return false;
                        }
                        return true;
                    });
                } else if (pages === 0) {
                    filteredResponse = responseProducts;
                }

                productData.push(filteredResponse);
                createProductCards(productData);
                pages++;
            },
            error: function() {
                $("#ct-load-more").addClass("hidden");
            }
        });
    }

    /**
     * Parses the response from server
     * */
    function retrieveProductData(response) {
        const products = [];
        for (const key in response) {
            if (response.hasOwnProperty(key)) {
                const product = response[key];


                let p_id = product[0]["product_id"];
                let p_name =  product[0]["product_id"]["p_name"];
                let p_price = product[0]["product_id"]["p_price"];
                let p_brand = product[0]["product_id"]["brand_id"]["brand_name"];
                let p_image = product[0]["image_link"];

                let sizes = [];
                for (let i = 0; i < product.length; i++) {
                    sizes.push(product[i]["product_id"]["size"]);
                }

                const productData = {
                    id: p_id,
                    name: p_name,
                    price: p_price,
                    brand: p_brand,
                    image: p_image,
                    sizes: sizes
                };

                products.push(productData);
            }
        }

        return products;
    }

    /**
     * @param productData: products parsed by retrieveProductsData
     * @param filtering: boolean, true == clear displayed products
     * */
    function createProductCards(productData, filtering = false) {
        const $container = $('#ct-grid');
        let index = 0;
        if (pages === 0 || filtering) {
            $container.empty();
        } /*else
            index = pages-1;*/

        for (const key in productData[index]) {
            const product = productData[index][key];

            const $card = $('<div>')
                .addClass('card flex flex-col')
                .click(() => {
                    const productName = product.name;
                    // Redirect to the product page with the product name
                    window.location.href = `/${context_path}/product?product_name=${encodeURIComponent(productName)}`;
                });

            const $cardImage = $('<div>')
                .addClass('card-image h-[70%] aspect-square bg-cover bg-primary shadow-lg')
                .css('background-image', `url(${product.image})`)
                .click(() => {
                    const productName = product.name;
                    // Redirect to the product page with the product name
                    window.location.href = `/${context_path}/product?product_name=${encodeURIComponent(productName)}`;
                })
                .contextmenu((event) => {
                    // ...
                    event.preventDefault();
                    const productName = product.name;
                    window.open(`/${context_path}/product?product_name=${encodeURIComponent(productName)}`, '_blank');
                });

            const $cardInfoWrapper = $('<div>').addClass('card-info-wrapper flex flex-col gap-4 my-auto');

            const $brandInfo1 = $('<p>')
                .addClass("raleway-300 text-xl text-gray-shade opacity-90")
                .text(`${titleCase(product.brand)}`);

            const $nameInfo1 = $('<h1>')
                .addClass("raleway-600 text-2xl text-secondary")
                .text(`${product.name}`);

            const $cardInfo1 = $('<div>')
                .addClass('card-info-1 cursor-pointer select-none')
                .click(() => {
                    const productName = product.name;
                    window.location.href = `/${context_path}/product?product_name=${encodeURIComponent(productName)}`;
                })
                .contextmenu((event) => {
                    // ...
                    event.preventDefault();
                    const productName = product.name;
                    window.open(`/${context_path}/product?product_name=${encodeURIComponent(productName)}`, '_blank');
                });

            $cardInfo1.append($brandInfo1, $nameInfo1);

            const $idInfo2 = $('<i>')
                .addClass(`bi bi-cart text-xl id-${product.id}`);

            const $priceInfo2 = $('<p>')
                .addClass("raleway-300 text-xl text-gray-shade opacity-90 select-none")
                .text(`${product.price} €`);

            const $cardInfo2 = $('<div>')
                .addClass('card-info-2 flex gap-4 cursor-pointer');

            $cardInfo2.append($idInfo2, $priceInfo2);

            $cardInfoWrapper.append($cardInfo1, $cardInfo2);

            $card.append($cardImage, $cardInfoWrapper);


            $container.append($card);
        }
    }

});