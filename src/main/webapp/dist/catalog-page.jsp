<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8" />
    <title>Culture Clothing</title>
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <meta name="description" content="" />

    <link rel="stylesheet" type="text/css" href="dist/css/general.css" />
    <link rel="stylesheet" type="text/css" href="dist/css/output.css" />
    <link rel="stylesheet" type="text/css" href="dist/css/catalog.css" />

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css" integrity="sha384-b6lVK+yci+bfDmaY1u0zE8YYJt0TZxLEAFyYSLHId4xoVvsrQu3INevFKo+Xir8e" crossorigin="anonymous">
    <link rel="icon" href="dist/css/images/brand-logo/LOGO_WHITE_100x100.webp">
</head>
<body>
    <jsp:include page="navbar.jsp" />
    <jsp:include page="cookies.jsp" />

    <div id="catalog-intro-section" class="w-full h-[30dvh] bg-primary z-0">
        <div id="ct-intro-spacing" class="w-full h-[10dvh] bg-secondary"></div>
        <div id="ct-intro-wrapper" class="w-full h-[20dvh] flex justify-center items-center">
            <div id="ct-intro" class="w-[85%] md:w-[90%] xl:w-[95%] h-[40%]">
                <h1 id="page-name" class="raleway-600 text-left text-4xl pointer-events-none select-none">Page Name</h1>
                <div id="ct-intro-links" class="mt-1">
                    <ul class="list-none raleway-300 text-xl flex gap-1 cursor-pointer">
                        <li class="flex">
                            <a href="${pageContext.request.contextPath}/" class="hover:opacity-80">Home</a>
                            <p class="pointer-events-none select-none">/</p>
                        </li>
                        <li class="flex">
                            <a id="category-first" class="hover:opacity-80">Category</a>
                            <p class="pointer-events-none select-none">/</p>
                        </li>
                        <li class="flex">
                            <a id="category-second" class="hover:opacity-80">SubCategory</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <div id="catalog-filters-mobile" class="w-full min-h-fit mb-8">
        <div id="ct-filters-toggle-wrapper" class="w-full min-h-fit flex justify-center">
            <div id="ct-filter-toggle" class="w-[85%] md:w-[90%] h-20 bg-secondary cursor-pointer">
                <div id="ct-filter-button-wrapper" class="h-full flex justify-center items-center">
                    <div id="ct-filter-button" class="hover:opacity-80 text-primary text-xl select-none">
                        <i class="bi bi-sliders2"></i>
                        <button class="raleway-400">Filtra e Ordina</button>
                    </div>
                </div>
            </div>
        </div>

        <div id="ct-mb-filters-container" class="hidden mx-auto w-[85%] min-h-fit bg-secondary border-t-2 border-gray-shade animate-show-down">
            <div id="ct-mb-filters" class="mx-auto w-[90%] min-h-fit flex flex-col py-8">
                <div id="ct-mb-filter-price">
                    <h1 class="raleway-500 text-lg text-primary cursor-none select-none">Price</h1>
                    <div id="ct-mb-price-toggle" class="">
                        <div id="price-range-mb"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="catalog-products-section-container" class="w-full">
        <div id="catalog-products-section" class="w-[85%] md:w-[90%] xl:w-[95%] min-h-fit flex justify-center mx-auto">
            <div id="catalog-filter-desktop" class="w-[24%] xl:w-[20%] min-h-fit bg-secondary mr-4">
                <div id="ct-dsk-filter-price" class="w-[90%] mx-auto py-4">
                    <div id="ct-dsk-price-head" class="flex justify-between">
                        <h1 class="raleway-500 text-lg text-primary cursor-none select-none">Price</h1>
                        <i id="ct-price-btn-dsk" class="bi bi-chevron-down text-xl text-primary cursor-pointer"></i>
                    </div>
                    <div id="ct-dsk-price-toggle" class="hidden">
                        <input id="price-range-dsk"/>
                    </div>
                </div>
            </div>

            <div id="ct-products-grid-container" class="w-full md:w-[75%] xl:w-[80%] min-h-fit">
                <div id="catalog-sorting-desktop" class="w-full"></div>
                <div id="ct-grid" class="w-full grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-4">

                    <div class="card flex flex-col animate-[pulse_1.5s_ease_infinite]">
                        <div class="card-image h-[70%] aspect-square bg-cover bg-white-shade"></div>
                        <div class="card-info-wrapper flex flex-col gap-4 my-auto bg-white-shade sm:mt-3 md:mt-4 lg:mt-5 xl:mt-6">
                            <div class="card-info-1 cursor-pointer select-none">
                                <p class="raleway-300 text-xl text-white-shade opacity-90">tmp</p>
                                <h1 class="raleway-600 text-2xl text-white-shade">tmp</h1>
                            </div>
                            <div class="card-info-2 flex gap-4 cursor-pointer ">
                                <p class="raleway-300 text-xl text-white-shade opacity-90 select-none">tmp</p>
                            </div>
                        </div>
                    </div>

                    <div class="card flex flex-col animate-[pulse_1.5s_ease_infinite]">
                        <div class="card-image h-[70%] aspect-square bg-cover bg-white-shade"></div>
                        <div class="card-info-wrapper flex flex-col gap-4 my-auto bg-white-shade sm:mt-3 md:mt-4 lg:mt-5 xl:mt-6">
                            <div class="card-info-1 cursor-pointer select-none">
                                <p class="raleway-300 text-xl text-white-shade opacity-90">tmp</p>
                                <h1 class="raleway-600 text-2xl text-white-shade">tmp</h1>
                            </div>
                            <div class="card-info-2 flex gap-4 cursor-pointer ">
                                <p class="raleway-300 text-xl text-white-shade opacity-90 select-none">tmp</p>
                            </div>
                        </div>
                    </div>

                    <div class="card flex flex-col animate-[pulse_1.5s_ease_infinite]">
                        <div class="card-image h-[70%] aspect-square bg-cover bg-white-shade"></div>
                        <div class="card-info-wrapper flex flex-col gap-4 my-auto bg-white-shade sm:mt-3 md:mt-4 lg:mt-5 xl:mt-6">
                            <div class="card-info-1 cursor-pointer select-none">
                                <p class="raleway-300 text-xl text-white-shade opacity-90">tmp</p>
                                <h1 class="raleway-600 text-2xl text-white-shade">tmp</h1>
                            </div>
                            <div class="card-info-2 flex gap-4 cursor-pointer ">
                                <p class="raleway-300 text-xl text-white-shade opacity-90 select-none">tmp</p>
                            </div>
                        </div>
                    </div>

                    <div class="card flex flex-col animate-[pulse_1.5s_ease_infinite]">
                        <div class="card-image h-[70%] aspect-square bg-cover bg-white-shade"></div>
                        <div class="card-info-wrapper flex flex-col gap-4 my-auto bg-white-shade sm:mt-3 md:mt-4 lg:mt-5 xl:mt-6">
                            <div class="card-info-1 cursor-pointer select-none">
                                <p class="raleway-300 text-xl text-white-shade opacity-90">tmp</p>
                                <h1 class="raleway-600 text-2xl text-white-shade">tmp</h1>
                            </div>
                            <div class="card-info-2 flex gap-4 cursor-pointer ">
                                <p class="raleway-300 text-xl text-white-shade opacity-90 select-none">tmp</p>
                            </div>
                        </div>
                    </div>

                    <div class="card flex flex-col animate-[pulse_1.5s_ease_infinite]">
                        <div class="card-image h-[70%] aspect-square bg-cover bg-white-shade"></div>
                        <div class="card-info-wrapper flex flex-col gap-4 my-auto bg-white-shade sm:mt-3 md:mt-4 lg:mt-5 xl:mt-6">
                            <div class="card-info-1 cursor-pointer select-none">
                                <p class="raleway-300 text-xl text-white-shade opacity-90">tmp</p>
                                <h1 class="raleway-600 text-2xl text-white-shade">tmp</h1>
                            </div>
                            <div class="card-info-2 flex gap-4 cursor-pointer ">
                                <p class="raleway-300 text-xl text-white-shade opacity-90 select-none">tmp</p>
                            </div>
                        </div>
                    </div>

                    <div class="card flex flex-col animate-[pulse_1.5s_ease_infinite]">
                        <div class="card-image h-[70%] aspect-square bg-cover bg-white-shade"></div>
                        <div class="card-info-wrapper flex flex-col gap-4 my-auto bg-white-shade sm:mt-3 md:mt-4 lg:mt-5 xl:mt-6">
                            <div class="card-info-1 cursor-pointer select-none">
                                <p class="raleway-300 text-xl text-white-shade opacity-90">tmp</p>
                                <h1 class="raleway-600 text-2xl text-white-shade">tmp</h1>
                            </div>
                            <div class="card-info-2 flex gap-4 cursor-pointer ">
                                <p class="raleway-300 text-xl text-white-shade opacity-90 select-none">tmp</p>
                            </div>
                        </div>
                    </div>

                    <div class="card flex flex-col animate-[pulse_1.5s_ease_infinite]">
                        <div class="card-image h-[70%] aspect-square bg-cover bg-white-shade"></div>
                        <div class="card-info-wrapper flex flex-col gap-4 my-auto bg-white-shade sm:mt-3 md:mt-4 lg:mt-5 xl:mt-6">
                            <div class="card-info-1 cursor-pointer select-none">
                                <p class="raleway-300 text-xl text-white-shade opacity-90">tmp</p>
                                <h1 class="raleway-600 text-2xl text-white-shade">tmp</h1>
                            </div>
                            <div class="card-info-2 flex gap-4 cursor-pointer ">
                                <p class="raleway-300 text-xl text-white-shade opacity-90 select-none">tmp</p>
                            </div>
                        </div>
                    </div>

                    <div class="card flex flex-col animate-[pulse_1.5s_ease_infinite]">
                        <div class="card-image h-[70%] aspect-square bg-cover bg-white-shade"></div>
                        <div class="card-info-wrapper flex flex-col gap-4 my-auto bg-white-shade sm:mt-3 md:mt-4 lg:mt-5 xl:mt-6">
                            <div class="card-info-1 cursor-pointer select-none">
                                <p class="raleway-300 text-xl text-white-shade opacity-90">tmp</p>
                                <h1 class="raleway-600 text-2xl text-white-shade">tmp</h1>
                            </div>
                            <div class="card-info-2 flex gap-4 cursor-pointer ">
                                <p class="raleway-300 text-xl text-white-shade opacity-90 select-none">tmp</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div id="catalog-pagination-section" class="w-full min-h-[15dvh] flex flex-col justify-center items-center my-4">
            <div id="ct-load-more-wrapper" class="w-[85%] h-full flex justify-center items-center">
                <button id="ct-load-more" class="raleway-500 text-secondary text-xl bg-primary px-9 py-3 rounded-3xl shadow-xl active:opacity-75">Altro</button>
            </div>
        </div>
    </div>

    <jsp:include page="footer.jsp" />

    <script src="https://code.jquery.com/jquery-3.6.4.min.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ion-rangeslider/2.3.1/css/ion.rangeSlider.min.css"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ion-rangeslider/2.3.1/js/ion.rangeSlider.min.js"></script>


    <script src="dist/javascript/utilities/input_parsing.js"></script>
    <script src="dist/javascript/utilities/product_utils.js"></script>
    <script src="dist/javascript/catalog.js"></script>

</body>
</html>
