<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="it">
<head>
  <meta charset="UTF-8" />
  <title>Culture Clothing | 404</title>
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <meta name="description" content="" />
  <link rel="stylesheet" type="text/css" href="./dist/css/general.css" />
  <link rel="stylesheet" type="text/css" href="./dist/css/output.css" />

  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css" integrity="sha384-b6lVK+yci+bfDmaY1u0zE8YYJt0TZxLEAFyYSLHId4xoVvsrQu3INevFKo+Xir8e" crossorigin="anonymous">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@100;200;300;400;500;600;700&display=swap" rel="stylesheet">

  <link rel="icon" href="./dist/css/images/brand-logo/LOGO_WHITE_100x100.webp">

  <style>
    @media only screen and (max-width: 768px) { #error-404 { font-size: 8rem;}  }
    @media only screen and (min-width: 768px) { #error-404 { font-size: 14rem;}  }
  </style>
</head>
<body>
<jsp:include page="navbar.jsp" />
<jsp:include page="cookies.jsp" />

<div class="w-full h-[100dvh] bg-secondary flex justify-center items-center">
  <h1 id="error-404" class="raleway-600 text-primary">404</h1>
</div>
<jsp:include page="footer.jsp" />

<script src="https://code.jquery.com/jquery-3.6.4.min.js" crossorigin="anonymous"></script>
<script src="dist/javascript/utilities/cookie_utils.js"></script>
<script src="dist/javascript/index.js"></script>
</body>
</html>
