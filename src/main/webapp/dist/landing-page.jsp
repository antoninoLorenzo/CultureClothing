<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8" />
    <title>Culture Clothing</title>
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <meta name="description" content="" />
    <link rel="stylesheet" type="text/css" href="dist/css/output.css" />
    <link rel="stylesheet" type="text/css" href="dist/css/general.css" />
    <link rel="stylesheet" type="text/css" href="dist/css/landing-page.css" />

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css" integrity="sha384-b6lVK+yci+bfDmaY1u0zE8YYJt0TZxLEAFyYSLHId4xoVvsrQu3INevFKo+Xir8e" crossorigin="anonymous">
    <link rel="icon" href="dist/css/images/brand-logo/LOGO_WHITE_100x100.webp">
</head>
<body>
    <jsp:include page="navbar.jsp" />
    <jsp:include page="cookies.jsp" />

    <div id="ld-collection-section" class="bg-secondary w-full h-[90dvh] bg-cover bg-no-repeat">
        <div id="ld-collection-cta-container" class="w-full h-[90%] flex justify-center items-center">
            <div id="ld-collection-cta" class="w-[90%] h-96 flex flex-col justify-center pt-56">
                <h1 id="ld-collection-name" class="raleway-700 text-primary text-4xl sm:text-5xl text-center sm:text-left mb-6 unselectable pointer-events-none"></h1>
                <div class="flex justify-center sm:justify-start raleway-500 text-lg sm:text-xl text-secondary">
                    <a href="${pageContext.request.contextPath}/products?brand=karl_kani" id="ld-shop-button" class="bg-primary px-12 py-3 rounded-3xl shadow-sm active:opacity-80 unselectable">SHOP NOW</a>
                </div>
            </div>
        </div>
        <div id="ld-collection-switch-container" class="w-full h-[10%] flex justify-center sm:justify-end sm:pr-[4vw]">
            <div id="ld-collection-switch" class="flex justify-center items-center gap-6">
                <div id="switch-left">
                    <img id="switch-left-img" src="dist/css/images/landing-page/webp/arrow_left.webp">
                </div>
                <div id="switch-right">
                    <img id="switch-right-img" src="dist/css/images/landing-page/webp/arrow_right.webp">
                </div>
            </div>
        </div>
    </div>
    <div class="bg-secondary w-full h-[10dvh]"></div>
    <div id="ld-gender-section" class="w-full min-h-[100dvh] bg-primary border-b-2">
        <div id="ld-gender-header" class="h-[10dvh] sm:h-[20dvh] flex justify-center items-center">
            <h1 class="raleway-700 text-2xl sm:text-4xl unselectable pointer-events-none drop-shadow-sm">Per chi stai facendo shopping?</h1>
        </div>
        <div id="ld-gender-options-container" class="min-h-[90dvh] sm:min-h-[80dvh]">
            <div id="ld-gender-options" class="w-[90vw] sm:w-[85vw] min-h-full sm:min-h-[70vh] grid grid-rows-2 md:grid-rows-1 grid-cols-1 md:grid-cols-2 mx-auto gap-8 pb-12">
                <div id="ld-gender-card-man" class="w-72 h-72 sm:w-80 sm:h-80 lg:w-96 lg:h-96 mx-auto my-auto rounded-2xl bg-no-repeat bg-cover bg-center shadow-lg hover:shadow-xl">
                    <div class="w-full h-full flex justify-center items-center cursor-pointer opacity-0 hover:opacity-100 transition-opacity duration-150">
                        <a href="${pageContext.request.contextPath}/products?gender=male" class="raleway-600 text-3xl text-primary drop-shadow-lg unselectable">UOMO</a>
                    </div>
                </div>
                <div id="ld-gender-card-woman" class="w-72 h-72 sm:w-80 sm:h-80 lg:w-96 lg:h-96 mx-auto my-auto rounded-2xl bg-no-repeat bg-cover bg-center shadow-lg hover:shadow-xl">
                    <div class="w-full h-full flex justify-center items-center cursor-pointer opacity-0 hover:opacity-100 transition-opacity duration-150">
                        <a href="${pageContext.request.contextPath}/products?gender=female" class="raleway-600 text-3xl text-primary drop-shadow-lg unselectable">DONNA</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="ld-brands-section" class="bg-primary w-full min-h-[100dvh]">
        <div id="ld-brands-header" class="h-[10dvh] flex justify-center items-center">
            <h1 class="raleway-700 text-2xl sm:text-4xl unselectable pointer-events-none drop-shadow-sm">TOP BRANDS</h1>
        </div>

        <div id="ld-brands-options" class="w-full min-h-[90dvh] flex flex-col lg:flex-row justify-center items-center space-y-4 mb-4 mx-auto xl:gap-20">
            <div id="ld-brand-card-nike" class="w-72 sm:w-80 lg:w-96 h-[32rem] sm:h-[34rem] lg:h-[38rem] cursor-pointer lg:pt-10">
                <div id="nike-card-img" class="w-full max-h-[30rem] drop-shadow-md hover:drop-shadow-xl overflow-hidden rounded-3xl flex justify-center">
                    <img src="dist/css/images/landing-page/webp/shop_nike.webp" class="h-[30rem] rounded-3xl">
                </div>
                <div id="nike-card-text" class="flex justify-center items-center mt-2">
                    <a href="${pageContext.request.contextPath}/products?brand=nike" class="raleway-500 text-center text-lg sm:text-xl text-secondary unselectable drop-shadow-sm hover:border-b-2">NIKE</a>
                </div>
            </div>
            <!--
            <div id="ld-brand-card-carhartt" class="w-72 sm:w-80 lg:w-96 h-[32rem] sm:h-[34rem] lg:h-[38rem] cursor-pointer">
                <div id="carhartt-card-img" class="w-full max-h-[30rem] drop-shadow-md hover:drop-shadow-xl overflow-hidden rounded-3xl flex justify-center">
                    <img src="dist/css/images/landing-page/webp/shop_carhartt.webp" class="h-[30rem] rounded-3xl">
                </div>
                <div id="carhartt-card-text" class="flex justify-center items-center mt-2">
                    <a class="raleway-500 text-center text-lg sm:text-xl text-secondary unselectable drop-shadow-sm hover:border-b-2">CARHARTT</a>
                </div>
            </div>
            -->
            <div id="ld-brand-card-stussy" class="w-72 sm:w-80 lg:w-96 h-[32rem] sm:h-[34rem] lg:h-[38rem] cursor-pointer lg:pt-10">
                <div id="stussy-card-img" class="w-full max-h-[30rem] drop-shadow-md hover:drop-shadow-xl overflow-hidden rounded-3xl flex justify-center">
                    <img src="dist/css/images/landing-page/webp/shop_stussy.webp" class="h-[30rem] rounded-3xl">
                </div>
                <div id="stussy-card-text" class="flex justify-center items-center mt-2">
                    <a href="${pageContext.request.contextPath}/products?brand=karl_kani" class="raleway-500 text-center text-lg sm:text-xl text-secondary unselectable drop-shadow-sm hover:border-b-2">KARL KANI</a>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="footer.jsp" />

    <%
        synchronized (application) {
            try {
                int count = (int) application.getAttribute("visit-count");
                count++;
                application.setAttribute("visit-count", count);
            } catch (NullPointerException ex) {
                //application.setAttribute("visit-count", 1);
            }
        }
    %>

    <script src="https://code.jquery.com/jquery-3.6.4.min.js" crossorigin="anonymous"></script>
    <script src="dist/javascript/index.js"></script>
</body>
</html>