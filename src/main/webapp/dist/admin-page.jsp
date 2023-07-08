<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="it">
<head>
    <meta charset="UTF-8" />
    <title>Admin | Culture Clothing</title>
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <meta name="description" content="" />
    <link rel="stylesheet" type="text/css" href="dist/css/general.css" />
    <link rel="stylesheet" type="text/css" href="dist/css/output.css" />

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css" integrity="sha384-b6lVK+yci+bfDmaY1u0zE8YYJt0TZxLEAFyYSLHId4xoVvsrQu3INevFKo+Xir8e" crossorigin="anonymous">    
    <link rel="icon" href="dist/css/images/brand-logo/LOGO_WHITE_100x100.webp">
</head>
<body>
    <div class="flex flex-col lg:flex-row">
        <div id="admin-navbar" class="w-full lg:w-[30dvw] xl:w-[25dvw] h-[10dvh] relative bg-primary">
            <div class="w-[90%] mx-auto h-full lg:h-[10dvh] flex justify-between lg:border-b-2">
                <div class="flex items-center gap-3">
                    <a href="${pageContext.request.contextPath}/"><img src="dist/css/images/brand-logo/LOGO_BLACK_100x100.webp" class="w-12 h-12 aspect-square mx-auto"></a>
                    <a href="${pageContext.request.contextPath}/"><h1 class="raleway-700 text-secondary text-2xl select-none">Culture Clothing</h1></a>
                </div>
                <div id="admin-menu-icon" class="w-12 h-12 my-auto flex items-center justify-center z-10 cursor-pointer">
                    <i id="admin-open" class="bi bi-list text-secondary text-4xl mb-1 active:opacity-80 lg:hidden"></i>
                    <i id="admin-close" class="bi bi-x-lg text-secondary text-3xl hover:opacity-80 hidden"></i>
                    <input type="checkbox" id="admin-menu-checkbox" class="absolute opacity-0">
                </div>
            </div>
            <div id="navbar-expanded" class="w-full h-[90dvh] hidden lg:flex flex flex-col justify-between z-10 bg-primary absolute shadow-sm">
                <div class="w-[90%] mx-auto h-[90dvh] flex flex-col justify-between py-8">
                    <ul>
                        <li class="flex gap-3">
                            <i class="bi bi-house-fill text-secondary text-2xl"></i>
                            <a href="${pageContext.request.contextPath}/admin"><p class="raleway-600 text-secondary text-2xl select-none">Dashboard</p></a>
                        </li>
                    </ul>
                    <div class="flex gap-3">
                        <i class="bi bi-box-arrow-left text-secondary text-2xl"></i>
                        <a href="${pageContext.request.contextPath}/logout"><p class="raleway-600 text-secondary text-2xl select-none">Logout</p></a>
                    </div>
                </div>
            </div>
        </div>

        <div id="admin-main-content-wrapper" class="w-full lg:w-[70dvw] xl:w-[75dvw] min-h-[90dvh] lg:min-h-[100dvh] bg-white-shade z-0">
            <div id="admin-main-content" class="w-[90%] mx-auto">
                <div class="w-full h-[28rem] lg:h-[20dvh] grid grid-cols-2 lg:grid-cols-4 grid-rows-2 lg:grid-rows-1 gap-4 py-4">
                    <div class="flex flex-col justify-center bg-primary rounded-lg shadow-sm">
                        <div class="pl-4">
                            <div class="mb-4">
                                <div class="flex gap-2">
                                    <i class="bi bi-bar-chart-fill text-xl"></i>
                                    <p class="raleway-700 text-secondary text-2xl select-none">Visitors</p>
                                </div>
                                <p class="raleway-500 text-white-shade text-lg select-none">last month</p>
                            </div>
                            <p id="visitors-paragraph" class="raleway-600 text-secondary text-xl select-none">1000</p>
                        </div>
                    </div>
                    <div class="flex flex-col justify-center bg-primary rounded-lg shadow-sm">
                        <div class="pl-4">
                            <div class="mb-4">
                                <div class="flex gap-2">
                                    <i class="bi bi-cart-fill text-xl"></i>
                                    <p class="raleway-700 text-secondary text-2xl select-none">Sales</p>
                                </div>
                                <p class="raleway-500 text-white-shade text-lg select-none">last month</p>
                            </div>
                            <p id="sales-paragraph" class="raleway-600 text-secondary text-xl select-none">10</p>
                        </div>
                    </div>
                    <div class="flex flex-col justify-center bg-primary rounded-lg shadow-sm">
                        <div class="pl-4">
                            <div class="mb-4">
                                <div class="flex gap-2">
                                    <!--<i class="bi bi-bar-chart-fill text-xl"></i>-->
                                    <p class="raleway-700 text-secondary text-2xl select-none">CVR</p>
                                </div>
                                <p class="raleway-500 text-white-shade text-lg select-none">last month</p>
                            </div>
                            <p id="cvr-paragraph" class="raleway-600 text-secondary text-xl select-none">1000</p>
                        </div>
                    </div>
                    <div class="flex flex-col justify-center bg-primary rounded-lg shadow-sm">
                        <div class="pl-4">
                            <div class="mb-4">
                                <div class="flex gap-2">
                                    <i class="bi bi-currency-euro text-2xl"></i>
                                    <p class="raleway-700 text-secondary text-2xl select-none">Revenue</p>
                                </div>
                                <p class="raleway-500 text-white-shade text-lg select-none">last month</p>
                            </div>
                            <p id="revenue-paragraph" class="raleway-600 text-secondary text-xl select-none">400 €</p>
                        </div>
                    </div>
                    <div class="bg-primary rounded-lg"></div>
                    <div class="bg-primary rounded-lg"></div>
                    <div class="bg-primary rounded-lg"></div>
                </div>
                <div class="w-full min-h-[79dvh] mb-4 lg:mb-0 bg-primary rounded-lg">

                </div>
            </div>
        </div>
    </div>
    
    <script src="https://code.jquery.com/jquery-3.6.4.min.js" crossorigin="anonymous"></script>
    <script src="dist/javascript/admin.js"></script>
</body>
</html>
