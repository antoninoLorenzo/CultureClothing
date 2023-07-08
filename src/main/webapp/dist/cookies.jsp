
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Culture Clothing</title>
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <meta name="description" content="" />
    <link rel="stylesheet" type="text/css" href="dist/css/general.css" />
    <link rel="stylesheet" type="text/css" href="dist/css/output.css" />
    <link rel="stylesheet" type="text/css" href="dist/css/landing-page.css" />

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css" integrity="sha384-b6lVK+yci+bfDmaY1u0zE8YYJt0TZxLEAFyYSLHId4xoVvsrQu3INevFKo+Xir8e" crossorigin="anonymous">
    <link rel="icon" href="dist/css/images/brand-logo/LOGO_WHITE_100x100.webp">
</head>
<body>
    <div id="cookie-banner-container" class="w-full min-h-60 sm:h-60 xl:h-36 lg:h-40 fixed z-10 bottom-3 left-0">
        <div id="cookie-banner" class="max-w-[90%] lg:max-w-[95%] h-full grid grid-cols-1 lg:grid-cols-2 grid-rows-2 lg:grid-rows-1 bg-primary rounded-3xl mx-auto p-2 shadow-lg">
            <div id="cookie-text-container" class="mb-4 pt-4 lg:flex lg:flex-col lg:justify-center">
                <h1 class="raleway-300 text-base text-center text-secondary lg:text-left select-none">
                    By clicking ''Accept All Cookies'', you agree to the storing of cookies on your device
                    to enhance site navigation, analyze site usage, and assist in our marketing efforts.
                    <a id="cookie-policy-cookie-banner">Cookie Policy</a>
                </h1>
            </div>
            <div id="cookie-buttons-container" class="flex flex-col lg:flex-row justify-center items-center gap-4 pb-4">
                <button id="cookie-accept-button" class="raleway-500 text-lg text-primary bg-secondary px-12 py-3 max-h-14
                        rounded-3xl shadow-sm hover:shadow-lg transition-shadow duration-150 active:opacity-80 cursor-pointer unselectable">
                    Accept Cookies</button>
                <button id="cookie-decline" class="raleway-500 text-lg text-secondary px-12 py-3 border-2 border-secondary max-h-14
                        rounded-3xl shadow-sm transition-shadow duration-150 active:opacity-80 cursor-pointer unselectable">
                    Decline</button>
            </div>
        </div>
    </div>

    <%@ include file="cookie-policy.html" %>

    <script src="https://code.jquery.com/jquery-3.6.4.min.js" crossorigin="anonymous"></script>
    <script src="dist/javascript/utilities/cookie_utils.js"></script>
    <script src="dist/javascript/cookies_banner.js"></script>
</body>
</html>
