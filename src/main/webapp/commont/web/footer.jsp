<%@include file="/commont/taglib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Footer Section Begin -->
<footer class="footer">
    <div class="page-up">
        <a href="#" id="scrollToTopButton"><span class="arrow_carrot-up"></span></a>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="footer__logo">
                    <a href="./index.html"><img src="<c:url value="/template/web/img/logo.png"/> " alt=""></a>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="footer__nav">
                    <ul>
                        <li class="active"><a href="./index.html">Homepage</a></li>
                        <li><a href="./categories.html">Categories</a></li>
                        <li><a href="./blog.html">Our Blog</a></li>
                        <li><a href="#">Contacts</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-3">


            </div>
        </div>
    </div>
</footer>
<!-- Footer Section End -->

<!-- Search model Begin -->
<div class="search-model">
    <div class="h-100 d-flex align-items-center justify-content-center">
        <div class="search-close-switch"><i class="icon_close"></i></div>
        <form class="search-model-form" method="get" action="<c:url value="/phim"/> ">
            <input type="text" id="search-input" name="search" placeholder="Search here.....">
        </form>
    </div>
</div>