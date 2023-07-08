$(document).ready(() => {
    $("#mb-nav-bg, #dsk-nav-bg").removeClass("hidden");

    let total_price = 0;
    const productData = retrieveProductData(products);
    updateProductsCartMobile(productData);
    updateProductsCartDesktop(productData);

    function retrieveProductData(data) {
        const products = [];
        //const img = [];

        for (const key in data) {
            if (data.hasOwnProperty(key)) {
                const product = data[key];

                let p_id = product[0]["product_id"]["p_id"];
                let p_name =  product[0]["product_id"]["p_name"];
                let p_price = product[0]["product_id"]["p_price"];
                let p_brand = product[0]["product_id"]["brand_id"]["brand_name"];
                let p_size = product[0]["product_id"]["size"];
                let img = product[0]["image_link"];

                total_price += p_price;

                const productData = {
                    id: p_id,
                    name: p_name,
                    price: p_price,
                    brand: p_brand,
                    size: p_size,
                    img: img
                };

                products.push(productData);
            }
        }

        $("#cp-total-price").text(total_price);

        return products;
    }

    function updateProductsCartMobile(productData) {
        const $container = $("#mb-cp-products-section");
        $container.empty();

        productData.forEach((product) => {
            const $card = $('<div>')
                .addClass("cp-mb-product w-[92%] max-h-[40rem] mx-auto mt-8 xl:hidden pb-4");

            const $headerDiv = $('<div>')
                .addClass("cp-mb-product-header w-[92%] mx-auto flex justify-between");
            const $header = $('<div>')
                .addClass("raleway-700 text-secondary text-xl select-none")
                .text(`${product.name}`);
            const $closeIcon = $('<i>')
                .addClass("bi bi-x-lg text-secondary text-xl select-none cursor-pointer hover:opacity-70")
                .click(() => {
                    const productId = product.id;
                    const ids = getCookieValue("cart").split("_");
                    let newValue = "";

                    //  Remove product id from product id cookie
                    for (let i = 0; i < ids.length; i++) {
                        if (parseInt(ids[i]) !== productId) {
                            newValue += ids[i] + "_";
                        }
                    }
                    newValue = newValue.slice(0, -1);
                    modifyCookie("cart", newValue);

                    location.reload();
                });

            $card.append($headerDiv);
            $headerDiv.append($header, $closeIcon);

            const $image = $('<div>')
                .addClass("cp-mb-product-image mx-auto mt-4 mb-4 max-w-[25rem] md:max-w-[17rem] max-h-[25rem] md:max-h-[17rem] bg-cover aspect-square mx-auto")
                .css('background-image', `url(${product.img})`);

            $card.append($image);

            const $productInfoContainer = $('<div>')
                .addClass("cp-mb-product-info w-[92%] flex flex-col gap-2 border-t-2 border-t-white-shade border-b-2 mx-auto");

            const $productBrandContainer = $('<div>')
                .addClass("cp-mb-product-brand-container w-[92%] mx-auto flex justify-between mt-8");
            const $brandLabel = $('<h3>')
                .addClass("raleway-700 text-secondary text-xl select-none")
                .text("Brand: ");
            const $brandText = $('<p>')
                .addClass("raleway-400 text-gray-shade text-xl select-none")
                .text(`${titleCase(product.brand)}`);

            $productBrandContainer.append($brandLabel, $brandText);

            const $productPriceContainer = $('<div>')
                .addClass("cp-mb-product-brand-container w-[92%] mx-auto flex justify-between mb-8");
            const $priceLabel = $('<h3>')
                .addClass("raleway-700 text-secondary text-xl select-none")
                .text("Price: ");
            const $priceText = $('<p>')
                .addClass("raleway-400 text-gray-shade text-xl select-none")
                .text(`${product.price}`);

            $productPriceContainer.append($priceLabel, $priceText);

            const $productSizeContainer = $('<div>')
                .addClass("cp-mb-product-brand-container w-[92%] mx-auto flex justify-between");
            const $sizeLabel = $('<h3>')
                .addClass("raleway-700 text-secondary text-xl select-none")
                .text("Size: ");
            const $sizeText = $('<p>')
                .addClass("raleway-400 text-gray-shade text-xl select-none")
                .text(`${product.size}`);

            $productSizeContainer.append($sizeLabel, $sizeText);

            $productInfoContainer.append($productBrandContainer, $productSizeContainer, $productPriceContainer);
            $card.append($productInfoContainer);
            $container.append($card);
        });
    }

    function updateProductsCartDesktop(productData) {
        const $container = $("#dsk-cp-products-section");
        $container.empty();

        productData.forEach((product) => {
            const $card = $('<div>')
                .addClass("cp-dsk-product w-[90%] h-fit mx-auto hidden xl:flex border-b-2 border-gray-shade");

            const $image = $('<div>')
                .addClass("cp-dsk-product-image mt-4 mb-4 w-[17rem] h-[17rem] bg-cover aspect-square")
                .css('background-image', `url(${product.img})`);

            $card.append($image);

            const $infoContainer = $('<div>')
                .addClass("cp-dsk-product-info-wrapper w-full h-[13rem] mt-10 flex flex-col justify-between");

            const $headerContainer = $('<div>')
                .addClass("cp-dsk-product-header w-full h-[10rem] mx-auto flex justify-between");
            const $header = $('<div>')
                .addClass("raleway-700 text-secondary text-2xl select-none")
                .text(`${product.name}`);
            const $closeIcon = $('<i>')
                .addClass("bi bi-x-lg text-secondary text-2xl select-none")
                .click(() => {
                    const productId = product.id;
                    const ids = getCookieValue("cart").split("_");
                    let newValue = "";

                    //  Remove product id from product id cookie
                    for (let i = 0; i < ids.length; i++) {
                        if (parseInt(ids[i]) !== productId) {
                            newValue += ids[i] + "_";
                        }
                    }
                    newValue = newValue.slice(0, -1);
                    modifyCookie("cart", newValue);

                    location.reload();
                });

            $headerContainer.append($header, $closeIcon);

            const $info = $('<div>')
                .addClass("cp-dsk-product-info w-[90%] flex flex-col justify-center mx-auto");

            $info.append($headerContainer);

            const $brandContainer = $('<div>')
                .addClass("cp-dsk-product-brand w-full flex justify-between mt-6");
            const $brandLabel = $('<h3>')
                .addClass("raleway-700 text-secondary text-lg select-none")
                .text("Brand: ");
            const $brandText= $('<p>')
                .addClass("raleway-400 text-gray-shade text-lg select-none")
                .text(`${titleCase(product.brand)}`);
            $brandContainer.append($brandLabel, $brandText);

            const $sizeContainer = $('<div>')
                .addClass("cp-dsk-product-brand w-full flex justify-between");
            const $sizeLabel = $('<h3>')
                .addClass("raleway-700 text-secondary text-lg select-none")
                .text("Size: ");
            const $sizeText= $('<p>')
                .addClass("raleway-400 text-gray-shade text-lg select-none")
                .text(`${product.size}`);
            $sizeContainer.append($sizeLabel, $sizeText);

            const $priceContainer = $('<div>')
                .addClass("cp-dsk-product-price w-full flex justify-between");
            const $priceLabel = $('<h3>')
                .addClass("raleway-700 text-secondary text-lg select-none")
                .text("Price: ");
            const $priceText= $('<p>')
                .addClass("raleway-400 text-gray-shade text-lg select-none")
                .text(`${product.price}`);
            $priceContainer.append($priceLabel, $priceText);

            $info.append($brandContainer, $sizeContainer, $priceContainer);
            $infoContainer.append($info);
            $card.append($info);

            $container.append($card);
        });
    }
});