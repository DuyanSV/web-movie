<%@include file="/commont/taglib.jsp"%>>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Đăng kí</title>
</head>
<body>
<section class="normal-breadcrumb set-bg" data-setbg="<c:url value="/template/web/img/normal-breadcrumb.jpg"/> ">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="normal__breadcrumb__text">
                    <h2>Sign Up</h2>
                    <p>Welcome to the official Anime blog.</p>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Normal Breadcrumb End -->

<!-- Signup Section Begin -->
<section class="signup spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="login__form">
                    <h3>Sign Up</h3>
                    <form method="post">
                        <div class="input__item">
                            <input type="text" style="color: black" value="${email}" name="email" placeholder="Địa chỉ email">
                            <span class="icon_mail"></span>
                        </div>
                        <div class="input__item">
                            <input type="text" style="color: black" value="${fullname}" name="fullname" placeholder="Tên của bạn">
                            <span class="icon_profile"></span>
                        </div>
                        <div class="input__item">
                            <input type="password" style="color: black" value="${password}" name="password" placeholder="Mật khẩu">
                            <span class="icon_lock"></span>
                        </div>
                        <div class="input__item">
                            <input type="password" style="color: black" value="${comfirmPassword}" name="comfirmPassword" placeholder="Nhập lại mật khẩu">
                            <span class="icon_lock"></span>
                        </div>
                        <button type="submit" formaction="<c:url value="/dang-ki"/> " class="site-btn onloader">Sign up</button>
                    </form>
                    <h5>Already have an account? <a href="<c:url value="/dang-nhap"/> ">Log In!</a></h5>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="login__social__links">
                    <h3>Login With:</h3>
                    <ul>
                        <li><a href="#" class="facebook"><i class="fa fa-facebook"></i> Sign in With Facebook</a>
                        </li>
                        <li><a href="#" class="google"><i class="fa fa-google"></i> Sign in With Google</a></li>
                        <li><a href="#" class="twitter"><i class="fa fa-twitter"></i> Sign in With Twitter</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>
