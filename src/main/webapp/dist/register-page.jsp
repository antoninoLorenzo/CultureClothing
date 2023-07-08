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
    <link rel="stylesheet" type="text/css" href="dist/css/register-page.css" />

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css" integrity="sha384-b6lVK+yci+bfDmaY1u0zE8YYJt0TZxLEAFyYSLHId4xoVvsrQu3INevFKo+Xir8e" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

    <link rel="icon" href="dist/css/images/brand-logo/LOGO_WHITE_100x100.webp">
</head>
<body>
    <jsp:include page="cookies.jsp" />

    <div id="mobile-register-section-container" class="w-full h-[100dvh]">
        <div id="mb-reg-logo" class="w-full h-[20%] bg-secondary flex justify-start items-center">
            <div class="w-fit h-fit ml-6 select-none">
                <a href="${pageContext.request.contextPath}/"><img src="dist/css/images/brand-logo/LOGO_WHITE_100x100.webp"></a>
            </div>
        </div>
        <div id="mb-reg-form-container" class="w-full h-[80dvh] bg-secondary">
            <form id="mb-reg-form-wrapper" class="w-full h-full bg-primary rounded-t-3xl flex justify-center" method="post" action="/register">
                <div id="mb-reg-form" class="w-[95%] h-full flex flex-col items-center justify-center">
                    <div id="mb-form-header" class="w-full">
                        <h1 class="raleway-700 text-secondary text-left text-3xl ml-6 pt-2 select-none">Create Account</h1>
                    </div>
                    <div id="mb-form-input-section" class="w-full">
                        <div id="mb-general-info-container" class="w-full mt-8">
                            <div id="mb-full-name" class="w-[80%] min-w-[12rem] max-w-md flex">
                                <input type="text" id="mb-first-name-in" name="first-name" class="ml-6 w-[48%] raleway-500 border-b-2 border-secondary outline-none" placeholder="First Name">
                                <input type="text" id="mb-last-name-in" name="last-name" class="ml-6 w-[48%] raleway-500 border-b-2 border-secondary outline-none" placeholder="Last Name">
                            </div>
                            <div id="mb-anagraphics" class="w-[80%] min-w-[12rem] max-w-md mt-6 flex">
                                <input type="date" id="mb-birthday-in" name="birthday" class="ml-6 w-[12rem] p-2 raleway-400 text-gray-shade outline-none border-secondary border-2 rounded-3xl">
                                <select id="mb-gender-selection" class="ml-6 w-[12rem] p-2 raleway-500 text-gray-shade outline-none border-secondary border-2 rounded-3xl">
                                    <option value="unisex">Gender</option>
                                    <option value="male">Male</option>
                                    <option value="female">Female</option>
                                </select>
                            </div>
                        </div>
                        <div id="mb-email-container" class="w-full mt-6">
                            <span class="absolute w-2 h-2 left-3 text-error text-lg">*</span>
                            <div class="ml-6">
                                <input type="text" id="mb-email-in" name="e-mail" class="w-[80%] min-w-[12rem] max-w-md raleway-500 border-b-2 border-secondary outline-none" placeholder="E-Mail" required>
                            </div>
                            <div id="mb-email-in-error" class="opacity-0">
                                <p class="ml-6 mt-1 raleway-300 text-error">Invalid E-Mail</p>
                            </div>
                        </div>
                        <div id="mb-password-container" class="w-full mt-6">
                            <div id="mb-password">
                                <span class="absolute w-2 h-2 left-3 text-error text-lg">*</span>
                                <div class="ml-6">
                                    <input type="password" id="mb-password-in" name="password" class="w-[80%] min-w-[12rem] max-w-md raleway-500 border-b-2 border-secondary outline-none" placeholder="Password" min="8" required>
                                    <span id="mb-visibility" class="material-symbols-outlined select-none cursor-pointer hover:opacity-80 active:opacity-60">visibility</span>
                                </div>
                                <div id="mb-password-in-error" class="opacity-0">
                                    <p class="ml-6 mt-1 raleway-300 text-error">Invalid Password</p>
                                </div>
                            </div>
                            <div id="mb-password-repeat" class="w-full mt-6">
                                <span class="absolute w-2 h-2 left-3 text-error text-lg">*</span>
                                <div class="ml-6">
                                    <input type="password" id="mb-password-repeat-in" name="password_check" class="w-[80%] min-w-[12rem] max-w-md raleway-500 border-b-2 border-secondary outline-none" placeholder="Repeat Password" min="8" required>
                                    <span id="mb-visibility-repeat" class="material-symbols-outlined select-none cursor-pointer hover:opacity-80 active:opacity-60">visibility</span>
                                </div>
                                <div id="mb-password-check-in-error" class="opacity-0">
                                    <p class="ml-6 mt-1 raleway-300 text-error">Password don't match</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="mb-submit-container" class="w-full my-8 opacity-60">
                        <button type="submit" id="mb-submit-button" class="ml-6 w-[80%] min-w-[12rem] max-w-md raleway-500 text-primary text-center text-xl outline-none border-2 rounded-3xl bg-secondary
                            px-12 py-3 shadow-sm active:mt-1">
                            Sign Up
                        </button>
                        <a href="${pageContext.request.contextPath}/login" class="raleway-400 text-secondary text-lg mt-4">Registered? Login</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div id="desktop-register-section" class="w-full h-[100dvh] flex">
        <div id="dsk-reg-logo" class="w-[30vw] h-full bg-secondary">
            <div class="w-full h-full flex justify-center items-center mx-auto">
                <div class="w-[80%] h-[80%] select-none">
                    <a href="${pageContext.request.contextPath}/"><img src="dist/css/images/brand-logo/LOGO_WHITE_100x100.webp"></a>
                </div>
            </div>
        </div>
        <div id="dsk-reg-form-container" class="w-[70vw] h-[100dvh] bg-secondary">
            <div id="dsk-reg-form-wrapper" class="w-full h-full bg-primary rounded-l-3xl flex justify-center items-center">
                <form id="dsk-reg-form" class="w-[80%] h-[80%]" method="post" action="${pageContext.request.contextPath}/register">
                    <div id="dsk-form-header" class="w-full">
                        <h1 class="raleway-700 text-secondary text-left text-6xl pt-7 select-none">Create Account</h1>
                    </div>
                    <div id="dsk-form-input-section" class="w-full h-fit grid grid-rows-1 grid-cols-2 mt-24 mb-24">
                        <div id="dsk-form-left" class="w-full h-full">
                            <div id="dsk-full-name" class="">
                                <input type="text" id="dsk-first-name-in" name="first-name" class="w-[90%] raleway-500 border-b-2 border-secondary outline-none" placeholder="First Name">
                                <div class="opacity-0"><p class="raleway-300 mt-1">spacing</p></div>
                                <input type="text" id="dsk-last-name-in" name="last-name" class="mt-6 w-[90%] raleway-500 border-b-2 border-secondary outline-none" placeholder="Last Name">
                                <div class="opacity-0"><p class="raleway-300 mt-1">spacing</p></div>
                            </div>
                            <div id="dsk-anagraphics" class="mt-6">
                                <input type="date" id="dsk-birthday-in" name="birthday" class="w-[45%] p-2 raleway-400 text-gray-shade outline-none border-secondary border-2 rounded-3xl">
                                <select id="dsk-gender-selection" class="w-[45%] p-2 raleway-500 text-gray-shade outline-none border-secondary border-2 rounded-3xl">
                                    <option value="unisex">Gender</option>
                                    <option value="male">Male</option>
                                    <option value="female">Female</option>
                                </select>
                            </div>
                        </div>
                        <div id="dsk-form-right" class="w-full h-full">
                            <div id="dsk-email-container" class="relative">
                                <span class="absolute w-2 h-2 left-3 text-error text-lg">*</span>
                                <div class="ml-6">
                                    <input type="text" id="dsk-email-in" name="e-mail" class="w-[90%] raleway-500 border-b-2 border-secondary outline-none" placeholder="E-Mail" required>
                                </div>
                                <div id="dsk-email-in-error" class="opacity-0">
                                    <p class="ml-6 mt-1 raleway-300 text-error">Invalid E-Mail</p>
                                </div>
                            </div>
                            <div id="dsk-password-container" class="mt-6">
                                <div id="dsk-password" class="relative">
                                    <span class="absolute w-2 h-2 left-3 text-error text-lg">*</span>
                                    <div class="ml-6">
                                        <input type="password" id="dsk-password-in" name="password" class="w-[90%] raleway-500 border-b-2 border-secondary outline-none" placeholder="Password" min="8" required>
                                        <span id="dsk-visibility" class="material-symbols-outlined select-none cursor-pointer hover:opacity-80 active:opacity-60">visibility</span>
                                    </div>
                                    <div id="dsk-password-in-error" class="opacity-0">
                                        <p class="ml-6 mt-1 raleway-300 text-error">Invalid Password</p>
                                    </div>
                                </div>
                                <div id="dsk-password-repeat" class="w-full mt-6 relative">
                                    <span class="absolute w-2 h-2 left-3 text-error text-lg">*</span>
                                    <div class="ml-6">
                                        <input type="password" id="dsk-password-repeat-in" name="password_check" class="w-[90%] raleway-500 border-b-2 border-secondary outline-none" placeholder="Repeat Password" min="8" required>
                                        <span id="dsk-visibility-repeat" class="material-symbols-outlined select-none cursor-pointer hover:opacity-80 active:opacity-60">visibility</span>
                                    </div>
                                    <div id="dsk-password-check-in-error" class="opacity-0">
                                        <p class="ml-6 mt-1 raleway-300 text-error">Password don't match</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="dsk-submit-container" class="w-full opacity-60">
                        <button type="submit" id="dsk-submit-button" class="w-full raleway-500 text-primary text-center text-xl outline-none border-2 rounded-3xl bg-secondary
                            px-12 py-3 shadow-sm active:mt-1">
                            Sign Up
                        </button>
                        <a href="${pageContext.request.contextPath}/login" class="raleway-400 text-secondary text-lg mt-4">Registered? Login</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <jsp:include page="footer.jsp" />

    <script src="https://code.jquery.com/jquery-3.6.4.min.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/dompurify/3.0.2/purify.js" integrity="sha512-/br4yZlcdP6Z2ueouEEUGOY/ZrYrDeKpY+vlPSeCtefYSUWlCMD6LyRD7DuiIa+Ps1E65P5dXJ+Jwi2swLuRUQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="dist/javascript/utilities/cookie_utils.js"></script>
    <script src="dist/javascript/utilities/access_utils.js"></script>
    <script src="dist/javascript/utilities/input_parsing.js"></script>
    <script src="dist/javascript/register_page.js"></script>
</body>
</html>
