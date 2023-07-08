
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8" />
    <title>Cart | Culture Clothing</title>
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <meta name="description" content="" />
    <link rel="stylesheet" type="text/css" href="dist/css/general.css" />
    <link rel="stylesheet" type="text/css" href="dist/css/output.css" />
    <link rel="stylesheet" type="text/css" href="dist/css/cart-page.css" />

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css" integrity="sha384-b6lVK+yci+bfDmaY1u0zE8YYJt0TZxLEAFyYSLHId4xoVvsrQu3INevFKo+Xir8e" crossorigin="anonymous">
    <link rel="icon" href="dist/css/images/brand-logo/LOGO_WHITE_100x100.webp">
</head>
<body>
    <jsp:include page="navbar.jsp" />
    <jsp:include page="cookies.jsp" />

    <div id="cp-main-section-container" class="w-full min-h-[100dvh] bg-white-shade">
        <div class="w-full h-[10dvh]"></div>
        <div id="cp-header-container" class="w-[90%] h-[10dvh] mx-auto grid items-center mt-7 mb-7">
            <div id="cp-header" class="flex gap-3">
                <i class="bi bi-bag text-secondary text-3xl select-none -ml-2"></i>
                <h1 class="raleway-700 text-secondary text-4xl select-none">My Cart</h1>
            </div>
            <div id="cp-back-to-shopping" class="flex gap-4 hover:opacity-70">
                <i class="bi bi-arrow-left text-gray-shade text-xl select-none"></i>
                <a href="${pageContext.request.contextPath}/"><h2 class="raleway-500 text-gray-shade text-xl select-none">Back To Shopping</h2></a>
            </div>
        </div>

        <div id="cp-main-section" class="w-[90%] min-h-fit mx-auto flex flex-col xl:flex-row pb-8 shadow-sm">
            <div id="mb-cp-products-section" class="w-full xl:w-[70%] min-h-fit grid grid-cols-1 md:grid-cols-2 xl:hidden bg-primary rounded-md">

            </div>

            <div id="dsk-cp-products-section" class="w-full xl:w-[70%] min-h-[70dvh] grid grid-cols-1 bg-primary rounded-md pb-4 ">

            </div>

            <div id="cp-summary-section" class="w-full xl:w-[30%] h-[30dvh] bg-primary mt-8 xl:mt-0 xl:ml-4 rounded-md shadow-sm">
                <div id="cp-summary-header" class="w-full h-[25%] bg-secondary rounded-t-md flex justify-center items-center">
                    <h2 class="raleway-600 text-primary text-2xl select-none">Order Summary</h2>
                </div>
                <div id="cp-summary-body" class="w-[90%] h-[75%] mx-auto bg-primary grid grid-rows-2 items-center">
                    <div id="cp-summary-total" class="flex justify-between">
                        <h2 class="raleway-600 text-secondary text-xl select-none">Total</h2>
                        <p id="cp-total-price" class="raleway-400 text-secondary text-xl select-none">price</p>
                    </div>
                    <div id="cp-summary-checkout" class="flex justify-center">
                        <a href="${pageContext.request.contextPath}/checkout">
                            <button class="raleway-600 bg-secondary text-primary text-xl rounded-xl w-[12rem] h-[4rem] select-none
                            shadow-lg hover:shadow-xl active:mt-1">
                            <i class="bi bi-cart-check"></i>
                            Checkout
                            </button>
                        </a>
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
    <script src="dist/javascript/cart-page.js"></script>
</body>
</html>
