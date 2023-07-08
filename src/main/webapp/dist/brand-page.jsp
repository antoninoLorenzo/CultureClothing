<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="it">
<head>
    <meta charset="UTF-8" />
    <title>Brands | Culture Clothing</title>
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <meta name="description" content="" />
    <link rel="stylesheet" type="text/css" href="dist/css/general.css" />
    <link rel="stylesheet" type="text/css" href="dist/css/output.css" />

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css" integrity="sha384-b6lVK+yci+bfDmaY1u0zE8YYJt0TZxLEAFyYSLHId4xoVvsrQu3INevFKo+Xir8e" crossorigin="anonymous">
    <link rel="icon" href="dist/css/images/brand-logo/LOGO_WHITE_100x100.webp">
</head>
<body>
    <jsp:include page="navbar.jsp" />
    <jsp:include page="cookies.jsp" />

    <div id="brands-section-container" class="w-full min-h-[100dvh]">
        <div class="w-full h-[10dvh] bg-secondary"></div>
        <div id="brands-grid-container" class="w-full flex justify-center">
            <div id="brands-grid" class="w-[82vw] min-h-[90dvh] grid grid-cols-1 md:grid-cols-2 xl:grid-cols-3 2xl:grid-cols-4 gap-10">
                <div id="nike-card" class="mx-auto max-w-[20rem] max-h-[20rem] m-4 border-2 border-secondary rounded-xl shadow-sm hover:shadow-xl cursor-pointer">
                    <div class="aspect-square flex items-center justify-center">
                        <img class="p-8 select-none" src="https://res.cloudinary.com/dnkkpp8pj/image/upload/v1683281807/brands_logos/nike_logo_bn9p9m.svg", alt="">
                    </div>
                    <div class="w-full flex justify-center mt-4 md:mt-8">
                        <a href="${pageContext.request.contextPath}/products?brand=nike" class="raleway-700 text-secondary text-3xl text-center select-none">Nike</a>
                    </div>
                </div>

                <div id="karlkani-card" class="mx-auto max-w-[20rem] max-h-[20rem] m-4 border-2 border-secondary rounded-xl shadow-sm hover:shadow-xl cursor-pointer">
                    <div class="aspect-square flex items-center justify-center">
                        <img class="p-8 select-none" src="https://res.cloudinary.com/dnkkpp8pj/image/upload/v1683281732/brands_logos/karl_kani_logo_ggkb3m.svg", alt="">
                    </div>
                    <div class="w-full flex justify-center mt-4 md:mt-8">
                        <a href="${pageContext.request.contextPath}/products?brand=karl_kani" class="raleway-700 text-secondary text-3xl text-center select-none">Karl Kani</a>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <jsp:include page="footer.jsp" />

    <script>
        $(document).ready(() => {
           $("#karlkani-card").click(() => {
                document.cookie = "brand=karl_kani";
           });
        });
    </script>

    <script src="https://code.jquery.com/jquery-3.6.4.min.js" crossorigin="anonymous"></script>
    <script src="dist/javascript/utilities/access_utils.js"></script>
</body>
</html>
