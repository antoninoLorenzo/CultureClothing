<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8" />
    <title>Checkout | Culture Clothing</title>
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <meta name="description" content="" />
    <link rel="stylesheet" type="text/css" href="dist/css/general.css" />
    <link rel="stylesheet" type="text/css" href="dist/css/output.css" />
    <link rel="stylesheet" type="text/css" href="dist/css/landing-page.css" />

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css" integrity="sha384-b6lVK+yci+bfDmaY1u0zE8YYJt0TZxLEAFyYSLHId4xoVvsrQu3INevFKo+Xir8e" crossorigin="anonymous">    
    <link rel="icon" href="dist/css/images/brand-logo/LOGO_WHITE_100x100.webp">
</head>
<body>
    <jsp:include page="navbar.jsp" />
    <jsp:include page="cookies.jsp" />

    <div class="w-full">
        <div class="w-full h-[10dvh]"></div>
        <div class="flex flex-col lg:flex-row">
            <div id="ck-form-container" class="w-full lg:w-[70%] min-h-[90dvh] bg-primary relative">
                <div class="w-[85%] mx-auto py-8 lg:mt-14 h-[10dvh] lg:h-[15dvh]">
                    <h1 class="raleway-700 text-secondary text-2xl lg:text-3xl select-none">Check Out</h1>
                </div>
                <div id="ck-progress-bar-desktop" class="w-full hidden lg:block">
                    <div class="w-[85%] mx-auto flex flex-row justify-between">
                        <div id="ck-dsk-step-1" class="flex flex-col gap-3 items-center">
                            <i class="bi bi-1-circle text-gray-shade text-3xl select-none"></i>
                            <p class="raleway-500 text-xl select-none mt-0">Spedizione</p>
                        </div>
                        <div id="ck-dsk-step-2" class="flex flex-col gap-3 items-center">
                            <i class="bi bi-2-circle text-gray-shade text-3xl select-none"></i>
                            <p class="raleway-500 text-secondary text-xl select-none mt-0">Pagamento</p>
                        </div>
                        <div id="ck-dsk-step-3" class="flex flex-col gap-3 items-center">
                            <i class="bi bi-3-circle text-gray-shade text-3xl select-none"></i>
                            <p class="raleway-500 text-secondary text-xl select-none mt-0">Conferma</p>
                        </div>
                    </div>
                </div>

                <div id="ck-forms" class="flex flex-col py-8">
                    <div>
                        <div class="ml-5 lg:hidden">
                            <i class="bi bi-1-circle text-4xl"></i>
                        </div>
                        <div id="ck-shipping-form-container" class="w-[85%] mx-auto flex flex-col border-l-2 border-white-shade lg:border-l-0">
                            <form id="ck-shipping-form" class="w-[80%] lg:w-full mx-auto flex flex-col gap-8 py-8">
                                <input type="text" id="ck-email" name="email" class="raleway-500 border-b-2 border-secondary outline-none" placeholder="E-Mail" required
                                pattern="[^@\s]+@[^@\s]+\.[^@\s]+">
                                <div class="flex flex-col lg:flex-row gap-8">
                                    <input type="text" id="ck-first-name" name="first-name" class="raleway-500 border-b-2 border-secondary outline-none lg:w-[50%]" placeholder="Nome" required>
                                    <input type="text" id="ck-second-name" name="second-name" class="raleway-500 border-b-2 border-secondary outline-none lg:w-[50%]" placeholder="Cognome" required>
                                </div>
                                <select id="ck-country" name="country" class="raleway-500 border-b-2 border-secondary outline-none">
                                    <option value="IT">IT</option>
                                </select>
                                <input type="text" id="ck-city-state" name="city-state" class="raleway-500 border-b-2 border-secondary outline-none" placeholder="Citta', Regione" required>
                                <input type="text" id="ck-address" name="address" class="raleway-500 border-b-2 border-secondary outline-none" placeholder="Indirizzo" required>
                                <input type="text" id="ck-cap" name="cap" class="raleway-500 border-b-2 border-secondary outline-none" placeholder="CAP" required>
                                <select id="ck-delivery-type" name="delivery-type" class="raleway-500 border-b-2 border-secondary outline-none">
                                    <option value="standard delivery">Standard</option>
                                    <option value="express delivery">Express</option>
                                    <option value="next-day delivery">Next-Day</option>
                                </select>
                            </form>
                        </div>
                    </div>
                    <div>
                        <div class="ml-5 lg:hidden">
                            <i class="bi bi-2-circle text-4xl"></i>
                        </div>
                        <div id="ck-payment-form-container" class="w-[85%] mx-auto flex flex-col lg:hidden border-l-2 border-white-shade lg:border-l-0">
                            <form id="ck-payment-form" class="w-[80%] lg:w-full mx-auto flex flex-col gap-8 py-8">
                                <div>
                                    <h2 class="raleway-500 text-gray-shade text-lg mb-2">Metodo di Pagamento</h2>
                                    <div class="flex gap-4">
                                        <div id="ck-payment-mastercard" class="relative cursor-pointer">
                                            <img src="dist/css/images/payment_logos/mastercard_logo.png" class="bg-primary w-[6rem] aspect-auto border-2">
                                            <input type="radio" id="ck-mastercard-radio" name="payment_type" value="mastercard" class="absolute top-0 left-4 w-16 h-16 opacity-0">
                                        </div>
                                        <div id="ck-payment-visa" class="relative cursor-pointer">
                                            <img src="dist/css/images/payment_logos/visa_logo.png" class="bg-primary w-[6rem] aspect-auto border-2">
                                            <input type="radio" id="ck-visa-radio" name="payment_type" value="visa" class="absolute top-0 left-4 w-16 h-16 opacity-0">
                                        </div>
                                        <div id="ck-payment-paypal" class="relative cursor-pointer">
                                            <img src="dist/css/images/payment_logos/paypal_logo.png" class="bg-primary w-[6rem] aspect-auto border-2">
                                            <input type="radio" id="ck-paypal-radio" name="payment_type" value="paypal" class="absolute top-0 left-4 w-16 h-16 opacity-0">
                                        </div>
                                    </div>
                                </div>
                                <input type="text" pattern="\d{16}" id="ck-card-number" name="card-number" class="raleway-500 border-b-2 border-secondary outline-none" placeholder="1234 5678 9123 4567" required>
                                <input type="text" pattern="(0[1-9]|1[0-2])\/20\d{2}" id="ck-card-expiring" name="expiring-date" class="raleway-500 border-b-2 border-secondary outline-none" placeholder="MM/YYYY" required>
                                <input type="text" pattern="\d{3,4}" id="ck-card-code" name="cvv" class="raleway-500 border-b-2 border-secondary outline-none" placeholder="CVV" required>
                            </form>
                        </div>
                    </div>
                    <div>
                        <div class="ml-5 lg:hidden">
                            <i class="bi bi-3-circle text-4xl"></i>
                        </div>
                        <div id="ck-confirm-container" class="w-[85%] mx-auto flex flex-col lg:hidden border-l-2 border-white-shade lg:border-l-0">
                            <div id="ck-confirm" class="w-[80%] lg:w-full mx-auto flex flex-col gap-8 py-8">
                                <div>
                                    <h2 id="ck-user-data" class="raleway-700 text-secondary text-lg select-none mb-2">Dati Utente</h2>
                                    <p id="ck-user-email" class="raleway-500 text-secondary text-lg select-none">E-Mail</p>
                                    <p id="ck-user-name" class="raleway-500 text-secondary text-lg select-none">Cognome, Nome</p>
                                </div>
                                <div>
                                    <h2 class="raleway-700 text-secondary text-lg select-none mb-2">Dettagli spedizione</h2>
                                    <p id="ck-user-location" class="raleway-500 text-secondary text-lg select-none">Citta', Regione CAP, IT</p>
                                    <p id="ck-user-address" class="raleway-500 text-secondary text-lg select-none">Indirizzo</p>
                                    <p id="ck-user-delivery" class="raleway-500 text-secondary text-lg select-none">Metodo di Spedizione</p>
                                </div>
                                <div>
                                    <h2 class="raleway-700 text-secondary text-lg select-none mb-2">Metodo di Pagamento</h2>
                                    <p id="ck-user-payment" class="raleway-500 text-secondary text-lg select-none">Mastercard</p>
                                    <p id="ck-user-card" class="raleway-500 text-secondary text-lg select-none">**** **** **** 4567</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="w-[85%] mx-auto hidden lg:flex justify-between text-2xl">
                    <i id="ck-chevron-left" class="bi bi-chevron-left cursor-pointer opacity-50"></i>
                    <i id="ck-chevron-right" class="bi bi-chevron-right cursor-pointer"></i>
                </div>
            </div>

            <div id="ck-recap-container" class="w-full lg:w-[30%] min-h-[40dvh] bg-white-shade">
                <div class="w-[85%] mx-auto py-8 lg:mt-14">
                    <h2 class="raleway-700 text-secondary text-2xl lg:text-3xl select-none">Riepilogo Ordine</h2>
                    <div id="ck-recap-products" class="border-b-2 border-gray-shade pb-8">
                        <div class="ck-recap-product w-full flex mx-auto pt-8">
                            <div class="ck-recap-product-image w-[6rem] h-[6rem] bg-cover aspect-square bg-primary"></div>
                            <div class="ck-recap-product-info-wrapper w-[80%] flex justify-center items-center">
                                <div class="ck-recap-product-info w-[80%] flex flex-col justify-between">
                                    <h2 class="raleway-500 text-secondary text-lg select-none">Product Name</h2>
                                    <p class="raleway-500 text-secondary text-lg select-none">price</p>
                                </div>
                            </div>
                        </div>
                        <div class="ck-recap-product-loading w-full flex mx-auto pt-8 animate-[pulse_1.5s_ease_infinite]">
                            <div class="w-[6rem] h-[6rem] bg-cover aspect-square bg-primary"></div>
                            <div class="w-[80%] ml-2 flex justify-center items-center bg-primary">
                                <div class="w-[80%] flex flex-col justify-between">
                                    <h2 class="raleway-500 text-secondary text-lg select-none"></h2>
                                    <p class="raleway-500 text-secondary text-lg select-none"></p>
                                </div>
                            </div>
                        </div>  
                    </div>
                    <div class="border-b-2 border-gray-shade py-8 flex flex-col gap-6">
                        <div class="flex justify-between">
                            <p class="raleway-500 text-secondary text-lg select-none">Subtotale: </p>
                            <p id="ck-products-total-price" class="raleway-500 text-secondary text-lg select-none">price</p>
                        </div>
                        <div class="flex justify-between">
                            <p class="raleway-500 text-secondary text-lg select-none">Spedizione: </p>
                            <p id="ck-delivery-price" class="raleway-500 text-secondary text-lg select-none">price</p>
                        </div>
                    </div>
                    <div class="py-8 flex justify-between">
                        <p class="raleway-700 text-secondary text-xl select-none">Totale: </p>
                        <p id="ck-total-price" class="raleway-700 text-secondary text-xl select-none">price</p>
                    </div>
                    <div id="ck-confirm-order" class="flex justify-center">
                        <button id="ck-confirm-button" class="raleway-700 text-secondary text-xl bg-primary px-10 py-4 rounded-3xl shadow-sm select-none hover:opacity-80 active:mt-1">Conferma Ordine</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="footer.jsp" />

    <script src="https://code.jquery.com/jquery-3.6.4.min.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/dompurify/3.0.2/purify.js" integrity="sha512-/br4yZlcdP6Z2ueouEEUGOY/ZrYrDeKpY+vlPSeCtefYSUWlCMD6LyRD7DuiIa+Ps1E65P5dXJ+Jwi2swLuRUQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="dist/javascript/utilities/cookie_utils.js"></script>
    <script src="dist/javascript/utilities/input_parsing.js"></script>
    <script src="dist/javascript/checkout.js"></script>
</body>
</html>