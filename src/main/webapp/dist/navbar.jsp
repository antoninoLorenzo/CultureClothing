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

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css" integrity="sha384-b6lVK+yci+bfDmaY1u0zE8YYJt0TZxLEAFyYSLHId4xoVvsrQu3INevFKo+Xir8e" crossorigin="anonymous">   
    <link rel="icon" href="dist/css/images/brand-logo/LOGO_WHITE_100x100.webp">
</head>
<body>
    <div id="navbar-desktop-container" class="w-full h-[10dvh] absolute top-0">
        <div id="dsk-nav-bg" class="w-full h-full bg-secondary absolute top-0 hidden"></div>
        <div id="navbar-desktop" class="w-full h-full flex">
            <div id="nv-dsk-logo" class="w-1/3 h-full flex justify-start items-center pl-[4vw] z-10 cursor-pointer">
                <a id="nv-dsk-logo-icon" href="${pageContext.request.contextPath}/"><img src="dist/css/images/brand-logo/LOGO_WHITE_100x100.webp" class="w-16 h-16 mx-auto"></a>
            </div>
            <div id="nv-dsk-links-container" class="w-1/3 h-full flex justify-center">
                <ul id="nv-dsk-links" class="text-primary raleway-400 text-3xl sm:text-lg lg:text-2xl space-y-5 flex sm:gap-2 md:gap-4 lg:gap-7 xl:gap-12">
                    <li class="grid items-center">
                        <a href="${pageContext.request.contextPath}/" class="drop-shadow-md select-none cursor-pointer hover:opacity-80">Home</a>
                    </li>
                    <li id="dsk-man-link" class="grid items-center mt-0 relative">
                        <a href="${pageContext.request.contextPath}/products?gender=male" class="drop-shadow-md select-none cursor-pointer hover:opacity-80">Uomo</a>
                        <div id="dsk-man-dropdown" class="absolute w-fit h-32 px-2 hidden top-[10dvh] flex-col justify-start raleway-300 text-base xl:text-lg bg-primary shadow-sm rounded-b-md">
                            <a href="${pageContext.request.contextPath}/products?gender=male&category=jackets" class="text-secondary hover:opacity-80 cursor-pointer pt-4">Jackets</a>
                            <a href="${pageContext.request.contextPath}/products?gender=male&category=knitwear" class="text-secondary hover:opacity-80 cursor-pointer">Knitwear</a>
                            <a href="${pageContext.request.contextPath}/products?gender=male&category=pants" class="text-secondary hover:opacity-80 cursor-pointer">Pants</a>
                            <a href="${pageContext.request.contextPath}/products?gender=unisex&category=footwear" class="text-secondary hover:opacity-80 cursor-pointer">Footwear</a>
                        </div>
                    </li>
                    <li id="dsk-woman-link" class="grid items-center relative">
                        <a href="${pageContext.request.contextPath}/products?gender=female" class="drop-shadow-md select-none cursor-pointer hover:opacity-80">Donna</a>
                        <div id="dsk-woman-dropdown" class="absolute w-fit h-32 px-2 top-[10dvh] hidden flex-col justify-start raleway-300 text-base xl:text-lg bg-primary shadow-sm rounded-b-md">
                            <a href="${pageContext.request.contextPath}/products?gender=female&category=jackets" class="text-secondary hover:opacity-80 cursor-pointer pt-4">Jackets</a>
                            <a href="${pageContext.request.contextPath}/products?gender=female&category=knitwear" class="text-secondary hover:opacity-80 cursor-pointer">Knitwear</a>
                            <a href="${pageContext.request.contextPath}/products?gender=female&category=pants" class="text-secondary hover:opacity-80 cursor-pointer">Pants</a>
                            <a href="${pageContext.request.contextPath}/products?gender=unisex&category=footwear" class="text-secondary hover:opacity-80 cursor-pointer">Footwear</a>
                        </div>
                    </li>
                    <li class="grid items-center">
                        <a href="${pageContext.request.contextPath}/brands" class="drop-shadow-md select-none cursor-pointer hover:opacity-80">Marche</a>
                    </li>
                </ul>
            </div>
            <div id="nv-dsk-icons" class="w-1/3 h-full flex justify-end items-center pr-[4vw] sm:gap-2 md:gap-4 lg:gap-7 xl:gap-12">
                <div id="nv-dsk-search-container" class="w-12 h-12 flex items-center justify-center">
                    <div id="nv-dsk-search" class="w-fit h-fit flex items-center justify-center relative">
                        <i class="bi bi-search text-primary text-3xl sm:text-xl lg:text-2xl active:opacity-80"></i>
                        <div id="nv-dsk-search-tooltip" class="absolute top-11 unselectable pointer-events-none hidden">
                            <span class="raleway-300 text-center text-sm text-secondary px-2 border-2 border-primary bg-primary rounded-3xl">Search</span>
                        </div>
                    </div>
                </div>
                <div id="nv-dsk-cart-container" class="w-12 h-12 flex items-center justify-center">
                    <div id="nv-dsk-cart" class="w-fit h-fit flex items-center justify-center relative">
                        <a href="${pageContext.request.contextPath}/cart"><i id="nv-dsk-cart-icon" class="bi bi-bag text-primary text-3xl sm:text-xl lg:text-2xl cursor-pointer hover:opacity-80"></i></a>
                        <p id="nav-dsk-cart-counter" class="raleway-400 text-primary text-base absolute -top-3 -right-2 select-none"></p>
                        <div id="nv-dsk-cart-tooltip" class="absolute top-11 unselectable pointer-events-none hidden">
                            <a href="${pageContext.request.contextPath}/cart"><span class="raleway-300 text-center text-sm text-secondary px-2 border-2 border-primary bg-primary rounded-3xl">Cart</span></a>
                        </div>
                    </div>
                </div>
                <div id="nv-dsk-account-container" class="w-12 h-12 flex items-center justify-center">
                    <div id="nv-dsk-account" class="w-fit h-fit flex items-center justify-center relative">
                        <div class="relative">
                            <i id="dsk-account-icon" class="bi bi-person text-primary text-4xl sm:text-2xl lg:text-3xl cursor-pointer hover:opacity-80"></i>
                            <div id="dsk-account-dropdown" class="absolute sm:w-36 lg:w-48 xl:w-60 h-fit bg-secondary top-12 right-0 border-t-2 border-primary hidden z-20">
                                <div id="dsk-not-logged-dropdown" class="w-full p-4 flex flex-col gap-3 animate-show-down">
                                    <a id="dsk-account-login" href="${pageContext.request.contextPath}/login" class="raleway-300 text-primary text-lg cursor-pointer unselectable active:opacity-80">Sign In</a>
                                    <a id="dsk-account-register" href="${pageContext.request.contextPath}/register" class="raleway-300 text-primary text-lg cursor-pointer unselectable active:opacity-80">Sign Up</a>
                                </div>
                                <div id="dsk-logged-dropdown" class="w-full p-4 flex flex-col gap-3 hidden animate-show-down">
                                    <div>
                                        <a href="${pageContext.request.contextPath}/cart"><i class="bi bi-bag text-lg text-primary"></i></a>
                                        <a id="dsk-account-cart" href="${pageContext.request.contextPath}/cart" class="raleway-300 text-primary text-lg cursor-pointer unselectable active:opacity-80">Cart</a>
                                    </div>
                                    <div>
                                        <i class="bi bi-box-arrow-left text-lg text-primary"></i>
                                        <a id="dsk-account-logout" href="${pageContext.request.contextPath}/logout" class="raleway-300 text-primary text-lg cursor-pointer unselectable active:opacity-80">Logout</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="nv-dsk-account-tooltip" class="absolute top-11 unselectable pointer-events-none hidden">
                            <span class="raleway-300 text-center text-sm text-secondary px-2 border-2 border-primary bg-primary rounded-3xl">Account</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="dsk-search-input" class="w-full h-12 absolute hidden">
            <input type="text" id="dsk-search-input-field" placeholder="Input text" class="w-[90%] pl-6 outline-none">
            <div class="w-[10%] flex justify-center items-center border-2 border-primary cursor-pointer active:opacity-80" style="background-color: #d8d8d8;">
                <i id="dsk-search-icon-input" class="bi bi-search text-secondary pb-1 text-2xl"></i>
            </div>
        </div>
        <div id="dsk-search-result" class="w-full min-h-[20dvh] bg-primary shadow-sm hidden">

        </div>
    </div>
    <div id="navbar-mobile-container" class="w-full h-[10dvh] absolute top-0 z-10">
        <div id="mb-nav-bg" class="w-full h-full bg-secondary absolute top-0 hidden"></div>
        <div id="navbar-mobile" class="w-full h-full flex justify-between">
            <div id="nv-mb-left-icons" class="w-4/12 h-full flex justify-center items-center gap-8">
                <div id="nv-mb-hamburger" class="w-12 h-12 flex items-center justify-center z-10 cursor-pointer hover:opacity-80">
                    <i class="bi bi-list text-primary text-3xl "></i>
                    <input type="radio" id="nv-mb-hamburger-radio" class="absolute opacity-0">
                </div>
                <div id="nv-mb-search-container" class="w-12 h-12 flex items-center justify-center relative">
                    <div id="nv-mb-search" class="w-fit h-fit flex items-center justify-center relative">
                        <i id="mb-search-icon" class="bi bi-search text-primary text-2xl active:opacity-80 cursor-pointer"></i>
                        <div id="nv-mb-search-tooltip" class="absolute top-11 unselectable pointer-events-none hidden">
                            <span class="raleway-300 text-center text-sm text-secondary px-2 border-2 border-primary bg-primary rounded-3xl">Search</span>
                        </div>
                    </div>
                </div>
            </div>
            <div id="nv-mb-logo" class="w-4/12 h-full flex justify-center items-center z-10">
                <div>
                    <a id="nv-mb-logo-icon" href="${pageContext.request.contextPath}/"><img src="dist/css/images/brand-logo/LOGO_WHITE_100x100.webp" class="w-16 h-16 aspect-square mx-auto"></a>
                </div>
            </div>
            <div id="nv-mb-right-icons" class="w-4/12 h-full flex justify-center items-center gap-8">
                <div id="nv-mb-cart-container" class="w-12 h-12 flex items-center justify-center">
                    <div id="nv-mb-cart" class="w-fit h-fit flex items-center justify-center relative">
                        <a href="${pageContext.request.contextPath}/cart"><i id="nv-mb-cart-icon" class="bi bi-bag text-primary text-2xl cursor-pointer hover:opacity-80"></i></a>
                        <p id="nav-mb-cart-counter" class="raleway-400 text-primary text-base absolute -top-3 -right-2"></p>
                        <div id="nv-mb-cart-tooltip" class="absolute top-11 unselectable pointer-events-none hidden">
                            <a href="${pageContext.request.contextPath}/cart"><span class="raleway-300 text-center text-sm text-secondary px-2 border-2 border-primary bg-primary rounded-3xl">Cart</span></a>
                        </div>
                    </div>
                </div>
                <div id="nv-mb-account-container" class="w-12 h-12 flex items-center justify-center z-20">
                    <div id="nv-mb-account" class="w-fit h-fit flex items-center justify-center relative">
                        <div class="">
                            <i id="mb-account-icon" class="bi bi-person text-primary text-3xl cursor-pointer hover:opacity-80"></i>
                            <div id="mb-account-dropdown" class="absolute w-28 h-fit bg-secondary top-12 right-0 border-t-2 border-primary hidden">
                                <div id="mb-not-logged-dropdown" class="w-full p-4 flex flex-col gap-2 animate-show-down">
                                    <a id="mb-account-login" href="${pageContext.request.contextPath}/login" class="raleway-300 text-primary text-base cursor-pointer unselectable active:opacity-80">Sign In</a>
                                    <a id="mb-account-register" href="${pageContext.request.contextPath}/register" class="raleway-300 text-primary text-base cursor-pointer unselectable active:opacity-80">Sign Up</a>
                                </div>
                                <div id="mb-logged-dropdown" class="w-full p-4 flex flex-col gap-2 animate-show-down">
                                    <div>
                                        <a href="${pageContext.request.contextPath}/cart"><i class="bi bi-bag text-lg text-primary"></i></a>
                                        <a id="mb-account-cart" href="${pageContext.request.contextPath}/cart" class="raleway-300 text-primary text-base cursor-pointer unselectable active:opacity-80">Cart</a>
                                    </div>
                                    <div>
                                        <i class="bi bi-box-arrow-left text-lg text-primary"></i>
                                        <a id="mb-account-logout" href="${pageContext.request.contextPath}/logout" class="raleway-300 text-primary text-base cursor-pointer unselectable active:opacity-80">Logout</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="nv-mb-account-tooltip" class="absolute top-11 unselectable pointer-events-none hidden">
                            <span class="raleway-300 text-center text-sm text-secondary px-2 border-2 border-primary bg-primary rounded-3xl">Account</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="navbar-mobile-menu" class="bg-primary w-full h-[90dvh] absolute top-0 z-20">
            <div id="navbar-mobile-menu-top" class="w-full h-[10dvh] flex justify-between items-center">
                <img src="dist/css/images/brand-logo/LOGO_BLACK_100x100.webp" class=" ml-4 w-16 h-16">
                <div>
                    <i class="bi bi-x-lg text-4xl mr-5 "></i>
                    <input type="radio" id="mobile-menu-close-radio" class="absolute top-8 right-5 w-10 h-10 opacity-0">
                </div>
            </div>
            <div id="navbar-mobile-links-container" class="w-full h-[80dvh] pt-4 pl-4">
                <ul id="navbar-mobile-links" class="text-secondary raleway-400 text-2xl space-y-5">
                    <li>
                        <a href="${pageContext.request.contextPath}/" class="drop-shadow-md cursor-pointer select-none hover:opacity-80">Home</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/products?gender=male" class="drop-shadow-md select-none cursor-pointer hover:opacity-80">Uomo</a>
                        <input type="checkbox" id="mb-man-checkbox" class="absolute w-8 h-8 right-4 opacity-0 z-10">
                        <i id="mb-man-dropdown-arrow" class="bi bi-chevron-down text-secondary text-xl absolute right-6"></i>
                        <div id="mb-expanded-man" class="w-full h-32 flex flex-col justify-start raleway-300 text-lg">
                            <a href="${pageContext.request.contextPath}/products?gender=male&category=jackets" class="hover:opacity-80 cursor-pointer pt-4">Jackets</a>
                            <a href="${pageContext.request.contextPath}/products?gender=male&category=knitwear" class="hover:opacity-80 cursor-pointer">Knitwear</a>
                            <a href="${pageContext.request.contextPath}/products?gender=male&category=pants" class="hover:opacity-80 cursor-pointer">Pants</a>
                            <a href="${pageContext.request.contextPath}/products?gender=unisex&category=footwear" class="hover:opacity-80 cursor-pointer">Footwear</a>
                        </div>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/products?gender=female" class="drop-shadow-md select-none cursor-pointer hover:opacity-80">Donna</a>
                        <input type="checkbox" id="mb-woman-checkbox" class="absolute w-8 h-8 right-4 opacity-0 z-10">
                        <i id="mb-woman-dropdown-arrow" class="bi bi-chevron-down text-secondary text-xl absolute right-6"></i>
                        <div id="mb-expanded-woman" class="w-full h-32 flex flex-col justify-start raleway-300 text-lg">
                            <a href="${pageContext.request.contextPath}/products?gender=female&category=jackets" class="hover:opacity-80 cursor-pointer pt-4">Jackets</a>
                            <a href="${pageContext.request.contextPath}/products?gender=female&category=knitwear" class="hover:opacity-80 cursor-pointer">Knitwear</a>
                            <a href="${pageContext.request.contextPath}/products?gender=female&category=pants" class="hover:opacity-80 cursor-pointer">Pants</a>
                            <a href="${pageContext.request.contextPath}/products?gender=unisex&category=footwear" class="hover:opacity-80 cursor-pointer">Footwear</a>
                        </div>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/brands" class="drop-shadow-md select-none cursor-pointer hover:opacity-80">Marche</a>
                    </li>
                </ul>
            </div>
        </div>
        <div id="mb-search-input" class="w-full h-12 absolute hidden">
            <input type="text" id="mb-search-input-field" placeholder="Cerca prodotto" class="w-[90%] pl-6 outline-none">
            <div class="w-[10%] flex justify-center items-center border-2 border-primary cursor-pointer" style="background-color: #d8d8d8;">
                <i id="mb-search-icon-input" class="bi bi-search text-primary pb-1 text-2xl active:opacity-80"></i>
            </div>
        </div>
        <div id="mb-search-result" class="w-full min-h-[20dvh] bg-primary shadow-sm hidden">

        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.4.min.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/dompurify/3.0.2/purify.js" integrity="sha512-/br4yZlcdP6Z2ueouEEUGOY/ZrYrDeKpY+vlPSeCtefYSUWlCMD6LyRD7DuiIa+Ps1E65P5dXJ+Jwi2swLuRUQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="dist/javascript/utilities/input_parsing.js"></script>
    <script src="dist/javascript/utilities/cookie_utils.js"></script>
    <script src="dist/javascript/navbar.js"></script>
</body>
</html>