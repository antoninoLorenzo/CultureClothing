<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8" />
    <title>Culture Clothing | Login</title>
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <meta name="description" content="" />
    <link rel="stylesheet" type="text/css" href="dist/css/general.css" />
    <link rel="stylesheet" type="text/css" href="dist/css/output.css" />
    <link rel="stylesheet" type="text/css" href="dist/css/login-page.css" />

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css" integrity="sha384-b6lVK+yci+bfDmaY1u0zE8YYJt0TZxLEAFyYSLHId4xoVvsrQu3INevFKo+Xir8e" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

    <link rel="icon" href="dist/css/images/brand-logo/LOGO_WHITE_100x100.webp">
</head>
<body>
    <jsp:include page="cookies.jsp" />

    <div id="mobile-login-section-container" class="w-full min-h-[100dvh]">
        <div id="mb-login-logo" class="w-full h-[20%] bg-secondary flex justify-start items-center">
            <div class="w-fit h-fit ml-6 select-none">
                <a href="${pageContext.request.contextPath}/"><img src="dist/css/images/brand-logo/LOGO_WHITE_100x100.webp"></a>
            </div>
        </div>
        <div id="mb-login-form-container" class="w-full min-h-[80dvh] bg-secondary">
            <form id="mb-login-form-wrapper" class="w-full min-h-[80dvh] bg-primary rounded-t-3xl flex flex-col justify-center" method="post" action="${pageContext.request.contextPath}/login">
                <div id="mb-login-form" class="w-[95%] h-full flex flex-col items-center justify-center">
                    <div id="mb-login-form-header" class="w-full">
                        <h1 class="raleway-700 text-secondary text-left text-3xl ml-6 pt-2 select-none">Sign In</h1>
                    </div>
                    <div id="mb-login-form-input-section" class="w-full">
                        <div id="mb-login-email-container" class="w-full mt-6">
                            <div class="ml-6">
                                <input type="text" id="mb-log-email-in" name="e-mail" class="w-[80%] min-w-[12rem] max-w-md raleway-500 border-b-2 border-secondary outline-none" placeholder="E-Mail" required>
                            </div>
                        </div>
                        <div id="mb-log-password-container" class="w-full mt-6">
                            <div id="mb-log-password">
                                <div class="ml-6">
                                    <input type="password" id="mb-log-password-in" name="password" class="w-[80%] min-w-[12rem] max-w-md raleway-500 border-b-2 border-secondary outline-none" placeholder="Password" min="8" required>
                                    <span id="mb-log-visibility" class="material-symbols-outlined select-none cursor-pointer hover:opacity-80 active:opacity-60">visibility</span>
                                </div>
                                <div id="mb-log-error" class="opacity-0">
                                    <p class="ml-6 mt-1 raleway-300 text-error">Invalid Credentials</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="mb-login-submit-container" class="w-full mt-8">
                        <button type="submit" id="mb-login-submit-button" class="ml-6 w-[80%] min-w-[12rem] max-w-md raleway-500 text-primary text-center text-xl outline-none border-2 rounded-3xl bg-secondary
                            px-12 py-3 shadow-sm active:opacity-80">
                            Sign In
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <div id="desktop-login-section" class="w-full h-[100dvh] flex">
        <div id="dsk-login-logo" class="w-[30vw] h-full bg-secondary">
            <div class="w-full h-full flex justify-center items-center mx-auto">
                <div class="w-[80%] h-[80%] select-none">
                    <a href="${pageContext.request.contextPath}/"><img src="dist/css/images/brand-logo/LOGO_WHITE_100x100.webp"></a>
                </div>
            </div>
        </div>
        <div id="dsk-login-form-container" class="w-[70vw] h-[100dvh] bg-secondary">
            <div id="dsk-login-form-wrapper" class="w-full h-full bg-primary rounded-l-3xl flex justify-center items-center">
                <form id="dsk-login-form" class="w-[80%] h-[80%]" method="post" action="${pageContext.request.contextPath}/login">
                    <div id="dsk-login-form-header" class="w-full">
                        <h1 class="raleway-700 text-secondary text-left text-6xl pt-7 select-none">Sign In</h1>
                    </div>
                    <div id="dsk-login-form-input-section" class="w-full h-fit mt-24 mb-24">
                        <div id="dsk-login-email-container" class="relative">
                            <div class="ml-6">
                                <input type="text" id="dsk-log-email-in" name="e-mail" class="w-[90%] raleway-500 border-b-2 border-secondary outline-none" placeholder="E-Mail" required>
                            </div>
                        </div>
                        <div id="dsk-login-password-container" class="mt-6">
                            <div id="dsk-login-password" class="relative">
                                <div class="ml-6">
                                    <input type="password" id="dsk-log-password-in" name="password" class="w-[90%] raleway-500 border-b-2 border-secondary outline-none" placeholder="Password" min="8" required>
                                    <span id="dsk-log-visibility" class="material-symbols-outlined select-none cursor-pointer hover:opacity-80 active:opacity-60">visibility</span>
                                </div>
                                <div id="dsk-login-error" class="opacity-0">
                                    <p class="ml-6 mt-1 raleway-300 text-error select-none">Invalid Credentials</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="dsk-login-submit-container" class="w-full">
                        <button type="submit" id="dsk-login-submit-button" class="w-full raleway-500 text-primary text-center text-xl outline-none rounded-3xl bg-secondary
                            px-12 py-3 shadow-lg hover:shadow-xl active:opacity-80 select-none">
                            Sign In
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <jsp:include page="footer.jsp" />

    <script src="https://code.jquery.com/jquery-3.6.4.min.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/dompurify/3.0.2/purify.js" integrity="sha512-/br4yZlcdP6Z2ueouEEUGOY/ZrYrDeKpY+vlPSeCtefYSUWlCMD6LyRD7DuiIa+Ps1E65P5dXJ+Jwi2swLuRUQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="dist/javascript/utilities/cookie_utils.js"></script>
    <script src="dist/javascript/utilities/access_utils.js"></script>
    <script src="dist/javascript/utilities/input_parsing.js"></script>
    <script src="dist/javascript/login_page.js"></script>
</body>
</html>
