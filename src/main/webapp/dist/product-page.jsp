<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="it">
<head>
    <meta charset="UTF-8" />
    <title>Culture Clothing</title>
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <meta name="description" content="" />
    <link rel="stylesheet" type="text/css" href="dist/css/general.css" />
    <link rel="stylesheet" type="text/css" href="dist/css/output.css" />
    <link rel="stylesheet" type="text/css" href="dist/css/product-page.css" />

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css" integrity="sha384-b6lVK+yci+bfDmaY1u0zE8YYJt0TZxLEAFyYSLHId4xoVvsrQu3INevFKo+Xir8e" crossorigin="anonymous">    
    <link rel="icon" href="dist/css/images/brand-logo/LOGO_WHITE_100x100.webp">
</head>
<body>
    <jsp:include page="navbar.jsp" />
    <jsp:include page="cookies.jsp" />

    <div id="pr-product-section-container" class="w-full min-h-[100dvh] pb-8">
        <div class="w-full h-[10dvh]"></div>
        <div id="pr-product-mobile-section" class="w-[82vw] min-h-[90dvh] mx-auto xl:hidden">
            <div id="mb-product-header" class="flex flex-col">
                <a class="raleway-400 text-gray-shade text-base pt-8 select-none">BRAND</a>
                <h1 class="raleway-700 text-secondary text-2xl pb-8 select-none">Product Name</h1>
            </div>
            <div id="mb-product-image-container" class="w-full relative">
                <div id="mb-product-image-switcher" class="w-full h-[10%] absolute">
                    <div id="mb-pr-image-switch" class="flex justify-between">
                        <div id="mb-pr-switch-left" class="pl-1 active:opacity-80 cursor-pointer">
                            <img id="mb-pr-switch-left-img" src="dist/css/images/landing-page/webp/arrow_left.webp" class="w-7 h-7 opacity-80">
                        </div>
                        <div id="mb-pr-switch-right" class="pr-1 active:opacity-80 cursor-pointer">
                            <img id="mb-pr-switch-right-img" src="dist/css/images/landing-page/webp/arrow_right.webp" class="w-7 h-7">
                        </div>
                    </div>
                </div>
                <div id="mb-product-image" class="max-w-[30rem] max-h-[30rem] aspect-square bg-cover bg-center mx-auto"></div>
            </div>
            <div id="pr-mb-info" class="w-full">
                <div id="pr-mb-info-description-container">
                    <p class="raleway-400 text-secondary text-base select-none">
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                        Sed auctor felis et massa eleifend sagittis.
                        Proin rhoncus ligula vitae urna ultrices, sed commodo lacus tincidunt.
                    </p>
                </div>
                <div id="pr-mb-info-variants-container" class="w-full mt-4">
                    <div id="pr-mb-info-variants" class="w-full flex">
                        <div id="pr-mb-size-container" class="w-[50%] flex items-center py-5">
                            <p class="raleway-400 text-gray-shade text-lg select-none">Size: 
                                <strong class="text-secondary">S</strong>
                            </p>
                            <i id="pr-mb-size-dropdown" class="bi bi-chevron-down text-secondary text-2xl pl-3 active:opacity-80 cursor-pointer"></i>
                        </div>
                        <!--
                        <div id="pr-mb-color-container" class="w-[50%] flex items-center">
                            <p class="raleway-400 text-gray-shade text-lg select-none">Color: 
                                <strong class="text-secondary">black</strong>
                            </p>
                            <i id="pr-mb-color-dropdown" class="bi bi-chevron-down text-secondary text-2xl pl-3 active:opacity-80 cursor-pointer"></i>
                        </div>
                        -->
                    </div>
                    <div id="pr-mb-dropdown">
                        <div id="pr-mb-size-option" class="flex gap-4 pb-4 hidden">
                            <div id="pr-mb-s" class="w-10 h-10 bg-white-shade rounded-lg flex justify-center items-center active:opacity-70 cursor-pointer shadow-sm hover:shadow-lg transition-shadow duration-300">
                                <p class="raleway-600 text-secondary text-base select-none">S</p>
                            </div>
                            <div id="pr-mb-m" class="w-10 h-10 bg-white-shade rounded-lg flex justify-center items-center active:opacity-70 cursor-pointer shadow-sm hover:shadow-lg transition-shadow duration-300">
                                <p class="raleway-600 text-secondary text-base select-none">M</p>
                            </div>
                            <div id="pr-mb-l" class="w-10 h-10 bg-white-shade rounded-lg flex justify-center items-center active:opacity-70 cursor-pointer shadow-sm hover:shadow-lg transition-shadow duration-300">
                                <p class="raleway-600 text-secondary text-base select-none">L</p>
                            </div>
                            <div id="pr-mb-xl" class="w-10 h-10 bg-white-shade rounded-lg flex justify-center items-center active:opacity-70 cursor-pointer shadow-sm hover:shadow-lg transition-shadow duration-300">
                                <p class="raleway-600 text-secondary text-base select-none">XL</p>
                            </div>
                        </div>

                        <div id="pr-mb-color-option" class="flex gap-4 pb-4 hidden">
                            <div class="w-10 h-10 rounded-lg flex justify-center items-center border-2 border-secondary bg-primary active:opacity-70 cursor-pointer">
                                <div class="w-10 h-10 rounded-lg flex justify-center items-center border-2 border-secondary bg-secondary"></div>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="pr-mb-info-cart-container" class="w-full flex justify-between mt-4">
                    <div id="pr-mb-price-container" class="w-[30%] flex items-center py-5">
                        <p id="pr-mb-price" class="raleway-400 text-secondary text-xl select-none">$100</p>
                    </div>
                    <div id="pr-mb-cart-button-container" class="w-[70%] flex items-center">
                        <button id="pr-mb-add-to-cart" class="bg-secondary rounded-3xl text-primary text-base min-w-[12rem] min-h-[4rem] py-1 px-6 active:opacity-80 shadow-lg hover:shadow-xl">
                            <i class="bi bi-cart"></i>
                            Add To Cart
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <div id="pr-product-desktop-section" class="w-[90vw] h-[90dvh] mx-auto hidden xl:flex gap-10">
            <div id="pr-dsk-image-section-container" class="w-[40%] h-[90dvh] flex items-center relative">
                <div id="pr-dsk-image-switch-container" class="w-24 h-[70%] flex items-center z-10">
                    <div id="pr-dsk-image-switch" class="w-24 grid grid-cols-1 grid-rows-4 gap-4">
                        <!--
                        <div id="pr-dsk-image-1" class="w-24 h-24 rounded-3xl cursor-pointer active:opacity-70 shadow-sm hover:shadow-lg">
                            <img src="https://res.cloudinary.com/dnkkpp8pj/image/upload/v1683648372/products/karl-kani_clothing/men/jackets/FW%2022/Hendrix%20Leather%20Jacket/2_chqwmt.webp"/>
                        </div>
                        -->
                    </div>
                </div> 
                <div id="pr-dsk-main-image" class="w-[30rem] xl:w-[26rem] 2xl:w-[34rem] h-[30rem] xl:h-[26rem] 2xl:h-[34rem] aspect-square bg-cover mr-6"></div>
            </div>
            <div id="pr-dsk-info-section-container" class="w-[60%] h-[90dvh] flex items-center">
                <div id="pr-dsk-info-section" class="w-full h-[70%] bg-primary shadow-lg rounded-3xl flex flex-col justify-center">
                    <div id="dsk-product-header" class="w-[90%] flex flex-col mx-auto">
                        <a class="raleway-400 text-gray-shade text-lg select-none">BRAND</a>
                        <h1 class="raleway-700 text-secondary text-3xl mb-2 select-none">Product Name</h1>
                    </div>
                    <div id="pr-dsk-info-description-container" class="w-[90%] mx-auto">
                        <p class="raleway-400 text-secondary text-lg select-none">
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                            Sed auctor felis et massa eleifend sagittis.
                            Proin rhoncus ligula vitae urna ultrices, sed commodo lacus tincidunt.
                        </p>
                    </div>
                    <div id="pr-dsk-info-variants-container" class="w-[90%] mx-auto flex mt-8">
                        <div id="pr-dsk-size-container" class="w-[50%] flex flex-col py-5">
                            <p class="raleway-400 text-gray-shade text-lg select-none">Size</p>
                            <div id="pr-dsk-size-grid" class="flex gap-4 xl:gap-6 2xl:gap-8 mt-1">
                                <div id="pr-dsk-s" class="w-12 h-12 bg-white-shade rounded-lg flex justify-center items-center active:opacity-70 cursor-pointer z-20 shadow-sm hover:shadow-lg transition-shadow duration-300">
                                    <p class="raleway-600 text-secondary text-lg select-none">S</p>
                                </div>
                                <div id="pr-dsk-m" class="w-12 h-12 bg-white-shade rounded-lg flex justify-center items-center active:opacity-70 cursor-pointer shadow-sm hover:shadow-lg transition-shadow duration-300">
                                    <p class="raleway-600 text-secondary text-lg select-none">M</p>
                                </div>
                                <div id="pr-dsk-l" class="w-12 h-12 bg-white-shade rounded-lg flex justify-center items-center active:opacity-70 cursor-pointer shadow-sm hover:shadow-lg transition-shadow duration-300">
                                    <p class="raleway-600 text-secondary text-lg select-none">L</p>
                                </div>
                                <div id="pr-dsk-xl" class="w-12 h-12 bg-white-shade rounded-lg flex justify-center items-center active:opacity-70 cursor-pointer shadow-sm hover:shadow-lg transition-shadow duration-300">
                                    <p class="raleway-600 text-secondary text-lg select-none">XL</p>
                                </div>
                            </div>
                        </div>
                        <!--
                        <div id="pr-dsk-color-container" class="w-[50%] flex flex-col py-5">
                            <p class="raleway-400 text-gray-shade text-lg select-none">Color</p>
                            <div id="pr-dsk-color-grid" class="grid grid-rows-1 grid-cols-4 mt-1">
                                <div class="w-12 h-12 rounded-lg flex justify-center items-center border-2 border-secondary bg-primary active:opacity-70 cursor-pointer">
                                    <div class="w-10 h-10 rounded-lg flex justify-center items-center border-2 border-secondary bg-secondary"></div>
                                </div> 
                            </div>
                        </div>
                        -->
                    </div>
                    <div id="pr-dsk-info-cart-container" class="w-[90%] mx-auto flex mt-8">
                        <div id="pr-dsk-price-container" class="w-[50%] flex items-center py-5">
                            <p id="pr-dsk-price" class="raleway-400 text-secondary text-2xl select-none">$100</p>
                        </div>
                        <div id="pr-dsk-cart-button-container" class="w-[50%] flex items-center justify-end">
                            <button id="pr-dsk-add-to-cart" class="bg-secondary rounded-3xl text-primary text-lg py-3 px-12 active:opacity-80 active:mt-2 shadow-lg hover:shadow-xl transition-shadow duration-300">
                                <i class="bi bi-cart"></i>
                                Add To Cart
                            </button>
                        </div>
                    </div>               
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="footer.jsp" />

    <script>
        const products = ${requestScope.productListJson};
    </script>

    <script src="https://code.jquery.com/jquery-3.6.4.min.js" crossorigin="anonymous"></script>
    <script src="dist/javascript/utilities/cookie_utils.js"></script>
    <script src="dist/javascript/utilities/input_parsing.js"></script>
    <script src="dist/javascript/utilities/product_utils.js"></script>
    <script src="dist/javascript/product_page.js"></script>
</body>
</html>
