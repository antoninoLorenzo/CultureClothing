$(document).ready(() => {
    //  Update collections dynamically
    let urls = [];
    updateCollections();
    $(window).resize(() => { updateCollections();})

    //  Switch collections
    $("#switch-left-img").css("opacity", "0.4");

    $("#switch-left").click(() => {
        let context_path = window.location.pathname.split('/')[1];
        $("#ld-collection-section").css("background-image", `url(${urls[0]})`)
        $("#ld-collection-name").text("Karl Kani FW22");
        $("#ld-shop-button").attr("href", `/${context_path}/products?brand=karl_kani`);

        $("#switch-left-img").css("opacity", "0.4");
        $("#switch-right-img").css("opacity", "1");
    })

    $("#switch-right").click(() => {
        let context_path = window.location.pathname.split('/')[1];
        $("#ld-collection-section").css("background-image", `url(${urls[1]})`)
        $("#ld-collection-name").text("Nike Sport");
        $("#ld-shop-button").attr("href", `/${context_path}/products?brand=nike`);
        
        $("#switch-left-img").css("opacity", "1");
        $("#switch-right-img").css("opacity", "0.4");
    })

    function updateCollections() {
        if (window.innerWidth <= 640) {
            urls = [];
            urls[0] = "https://res.cloudinary.com/dnkkpp8pj/image/upload/v1682936984/products/karl-kani_clothing/karlkani_fall22_mobile_jybyb0.webp";
            urls[1] = "https://res.cloudinary.com/dnkkpp8pj/image/upload/v1688750435/products/nike_mobile_e484uz.webp";
        } else if (window.innerWidth > 640) {
            urls = [];
            urls[0] = "https://res.cloudinary.com/dnkkpp8pj/image/upload/v1682936984/products/karl-kani_clothing/karlkani_fall22_desktop_m5y4aq.webp";
            urls[1] = "https://res.cloudinary.com/dnkkpp8pj/image/upload/v1688750435/products/nike_desktop_k3hstt.webp";
        }

        $("#ld-collection-section").css("background-image", `url(${urls[0]})`)
        $("#ld-collection-name").text("Karl Kani FW22");
    }


    function checkCookie(cookieName) {
        const cookies = document.cookie.split(';');
        for (let i = 0; i < cookies.length; i++) {
            const cookie = cookies[i].trim();
            if (cookie.indexOf(cookieName + '=') === 0)
                return true;
        }
        return false;
    }

    function getCookieValue(cookieName) {
        const cookies = document.cookie.split(';');

        for (let i = 0; i < cookies.length; i++) {
            const cookie = cookies[i].trim();
            if (cookie.startsWith(cookieName + '=')) {
                return cookie.substring(cookieName.length + 1);
            }
        }

        return null;
    }
})