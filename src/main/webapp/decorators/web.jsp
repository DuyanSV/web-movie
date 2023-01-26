<%@include file="/commont/taglib.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<fmts:setLocale value="en" scope="request"/>
<fmts:setBundle basename="global" scope="request"/>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Anime Template">
    <meta name="keywords" content="Anime, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title><dec:title default="Trang chủ"></dec:title></title>
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
          rel="stylesheet">

    <link rel="stylesheet" href="<c:url value='/template/web/css/bootstrap.min.css' />" type="text/css">
    <link rel="stylesheet" href="<c:url value='/template/web/css/font-awesome.min.css' />" type="text/css">
    <link rel="stylesheet" href="<c:url value='/template/web/css/elegant-icons.css' />" type="text/css">
    <link rel="stylesheet" href="<c:url value='/template/web/css/plyr.css' />" type="text/css">
    <link rel="stylesheet" href="<c:url value='/template/web/css/nice-select.css' />" type="text/css">
    <link rel="stylesheet" href="<c:url value='/template/web/css/owl.carousel.min.css' />" type="text/css">
    <link rel="stylesheet" href="<c:url value='/template/web/css/slicknav.min.css' />" type="text/css">
    <link rel="stylesheet" href="<c:url value='/template/web/css/style.css' />" type="text/css">
    <link href="<c:url value="/template/alert/sweetalert2.min.css"/>" rel="stylesheet"/>
    <link href="<c:url value="/template/myTemplate/myStyle.css"/>" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<div id="preloder">
    <div class="loader"></div>
</div>

<div class="loaderWeb" style="display: none">
    <span class="fas fa-spinner xoay iconLoad" style="color: #00aeff"></span>
</div>
<%@include file="/commont/web/header.jsp" %>
<%@include file="/commont/alert/errorAlert.jsp" %>
<%@include file="/commont/alert/successAlert.jsp" %>
<div id="google_translate_element2">

</div>
<dec:body></dec:body>
<%@include file="/commont/web/footer.jsp" %>

<script src="<c:url value='/template/web/js/jquery-3.3.1.min.js' />"></script>
<script src="<c:url value='/template/web/js/bootstrap.min.js' />"></script>
<script src="<c:url value='/template/web/js/player.js' />"></script>
<script src="<c:url value='/template/web/js/jquery.nice-select.min.js' />"></script>
<script src="<c:url value='/template/web/js/mixitup.min.js' />"></script>
<script src="<c:url value='/template/web/js/jquery.slicknav.js' />"></script>
<script src="<c:url value='/template/web/js/owl.carousel.min.js' />"></script>
<script src="<c:url value='/template/web/js/main.js' />"></script>
<script src="<c:url value="/template/alert/sweetalert2.all.min.js" />"></script>
<script src="<c:url value="/template/myTemplate/myJs.js" />"></script>
<script type="text/javascript" src="https://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit2"></script>
<script src="<c:url value='/template/web/js/language.js' />"></script>
<link rel="stylesheet" href="<c:url value='/template/web/css/mystyle2.css' />" type="text/css">

</body>
</html>
