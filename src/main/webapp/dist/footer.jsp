<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8" />
    <title>Culture Clothing</title>
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <meta name="description" content="" />
    <link rel="stylesheet" type="text/css" href="dist/css/general.css" />
    <link rel="stylesheet" type="text/css" href="dist/css/dialog.css">
    <link rel="stylesheet" type="text/css" href="dist/css/output.css" />

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css" integrity="sha384-b6lVK+yci+bfDmaY1u0zE8YYJt0TZxLEAFyYSLHId4xoVvsrQu3INevFKo+Xir8e" crossorigin="anonymous">    
    <link rel="icon" href="dist/css/images/brand-logo/LOGO_WHITE_100x100.webp">
</head>
<body>
    <div id="footer-mobile" class="bg-secondary w-full min-h-[50dvh] pb-12">
        <div id="ft-mb-top" class="w-full h-52 grid grid-cols-2 grid-rows-1">
            <div id="ft-mb-logo" class="w-full h-full grid items-center">
                <img src="dist/css/images/brand-logo/LOGO_WHITE_100x100.webp" class="pl-6">
            </div>
            <div id="ft-mb-social" class="w-full h-full flex flex-col justify-center">
                <h2 class="raleway-600 text-primary text-xl mb-2">FOLLOW ON</h2>
                <div id="mb-social-icons" class="flex gap-8">
                    <div id="mb-instagram">
                        <i class="bi bi-instagram text-primary text-2xl cursor-pointer hover:opacity-80"></i>
                    </div>
                    <div id="mb-facebook">
                        <i class="bi bi-facebook text-primary text-2xl cursor-pointer hover:opacity-80"></i>
                    </div>
                    <div id="mb-twitter">
                        <i class="bi bi-twitter text-primary text-2xl cursor-pointer hover:opacity-80"></i>
                    </div>
                </div>
            </div>
        </div>
        <div id="ft-mb-info">
            <div id="mb-legal-info" class="w-full min-h-[6rem]">
                <div id="collapsed-legal-info" class="flex justify-between border-t-2 border-primary">
                    <div class="flex justify-center items-center h-24">
                        <h2 class="raleway-600 text-primary text-xl mb-2 pl-6 bg unselectable pointer-events-none">INFORMAZIONI LEGALI</h2>
                    </div>
                    <div class="flex justify-center items-center h-24">
                        <i id="mb-legal-info-arrow" class="bi bi-chevron-down text-primary text-xl absolute right-6"></i>
                        <input type="checkbox" id="mb-legal-info-radio"  class="absolute w-8 h-8 right-4 opacity-0">
                    </div>
                </div>
                <div id="expanded-legal-info" class="w-full h-24 pl-6 flex">
                    <div class="flex flex-col justify-center items-center h-24">
                        <!--<h3 class="raleway-400 text-primary text-lg cursor-pointer unselectable hover:opacity-80">Privacy Policy</h3>-->
                        <h3 id="open-cookie-policy" class="raleway-400 text-primary text-lg cursor-pointer unselectable hover:opacity-80">Cookie Policy</h3>
                    </div>
                </div>
            </div>
            <div id="mb-contact-info" class="w-full min-h-[6rem]">
                <div id="collapsed-contact-info" class="flex justify-between border-t-2 border-primary">
                    <div class="flex justify-center items-center h-24">
                        <h2 class="raleway-600 text-primary text-xl mb-2 pl-6 bg unselectable pointer-events-none">CONTATTI</h2>
                    </div>
                    <div class="flex justify-center items-center h-24">
                        <i id="mb-contact-info-arrow" class="bi bi-chevron-down text-primary text-xl absolute right-6"></i>
                        <input type="checkbox" id="mb-contact-info-checkbox" class="absolute w-8 h-8 right-4 opacity-0">
                    </div>
                </div>
                <div id="expanded-contact-info" class="w-full h-24 pl-6 border-b-2 border-primary flex">
                    <div class="flex flex-col justify-center items-center h-24">
                        <div class="flex gap-2 mr-11">
                            <i class="bi bi-whatsapp text-primary text-2xl"></i>
                            <h3 class="raleway-400 text-primary text-lg cursor-pointer hover:opacity-80">+39 xxx xxx xxxx</h3>
                        </div>
                        <div class="flex justify-start gap-2">
                            <i class="bi bi-envelope-fill text-primary text-2xl"></i>
                            <h3 class="raleway-400 text-primary text-lg cursor-pointer hover:opacity-80">example@gmail.com</h3>
                        </div>
                    </div>
                </div>
            </div>
            <div id="mb-payment-info" class="w-full min-h-[6rem]">
                <div id="collapsed-payment-info" class="flex justify-between border-t-2 border-primary">
                    <div class="flex justify-center items-center h-24">
                        <h2 class="raleway-600 text-primary text-xl mb-2 pl-6 bg unselectable pointer-events-none">METODI DI PAGAMENTO</h2>
                    </div>
                    <div class="flex justify-center items-center h-24">
                        <i id="mb-payment-info-arrow" class="bi bi-chevron-down text-primary text-xl absolute right-6"></i>
                        <input type="checkbox" id="mb-payment-info-checkbox" class="absolute w-8 h-8 right-4 opacity-0">
                    </div>
                </div>
                <div id="expanded-payment-info" class="w-full min-h-24 pl-6 border-b-2 border-primary flex">
                    <div class="flex justify-center items-center min-h-24">
                        <div class="flex w-full min-h-12 gap-2 mb-2">
                            <img src="dist/css/images/payment_logos/mastercard_logo.png" class="bg-primary w-[4rem] h-[4rem] lg:w-[12rem] lg:h-[12rem]" alt="">
                            <img src="dist/css/images/payment_logos/visa_logo.png" class="bg-primary w-[4rem] h-[4rem] lg:w-[12rem] lg:h-[12rem]" alt="">
                            <img src="dist/css/images/payment_logos/paypal_logo.png" class="bg-primary w-[4rem] h-[4rem] lg:w-[12rem] lg:h-[12rem]" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <script src="https://code.jquery.com/jquery-3.6.4.min.js" crossorigin="anonymous"></script>
    <script src="dist/javascript/utilities/cookie_utils.js"></script>
    <script src="dist/javascript/footer.js"></script>
</body>
</html>