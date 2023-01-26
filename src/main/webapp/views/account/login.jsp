<%@include file="/commont/taglib.jsp"%>>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Đăng nhập</title>
</head>
<body>
<!-- Normal Breadcrumb Begin -->
<section class="normal-breadcrumb set-bg" data-setbg="<c:url value="/template/web/img/normal-breadcrumb.jpg"/> ">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="normal__breadcrumb__text">
                    <h2>Login</h2>
                    <p>Welcome to the official Anime blog.</p>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Normal Breadcrumb End -->

<!-- Login Section Begin -->
<section class="login spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="login__form">
                    <h3>Login</h3>
                    <form method="post">
                        <div class="input__item">
                            <input style="color: black" type="text" placeholder="Địa chỉ email" name="email" value="${email}">
                            <span class="icon_mail"></span>
                        </div>
                        <div class="input__item">
                            <input style="color: black" type="password" placeholder="Mật khẩu" name="password" value="${password}">
                            <span class="icon_lock"></span>
                        </div>
                        <button type="submit" formaction="<c:url value="/dang-nhap"/> " class="site-btn">Login Now</button>
                    </form>
                    <a href="#" class="forget_pass">Forgot Your Password?</a>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="login__register">
                    <h3>Dont’t Have An Account?</h3>
                    <a href="<c:url value="/dang-ki"/> " class="primary-btn">Register Now</a>
                </div>
            </div>
        </div>
        <div class="login__social">
            <div class="row d-flex justify-content-center">
                <div class="col-lg-6">
                    <div class="login__social__links">
                        <span>or</span>
                        <ul>
                            <meta name="google-signin-client_id" content="602512153091-mnrunr4kle1t2km7aua87janm4odnamq.apps.googleusercontent.com">
                            <li><a href="#" class="facebook"><i class="fa fa-facebook"></i> Sign in With
                                Facebook</a></li>
                            <li onclick="setStatus()"><a class="google"><div class="g-signin2" style="margin-left: 35%" data-onsuccess="onSignIn"></div></a></li>
                            <li><a href="#" class="twitter"><i class="fa fa-twitter"></i> Sign in With Twitter</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<div class="g-signin2" style="margin-left: 35%" data-onsuccess="onSignIn"></div>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    var status = 0;
    function setStatus(){
        status = 1;
    }
    function onSignIn(googleUser) {
        if(status == 1){
            var profile = googleUser.getBasicProfile();
            console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
            console.log('Name: ' + profile.getName());
            console.log('Image URL: ' + profile.getImageUrl());
            console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
            $.ajax({
                url: window.location.pathname.substring(0, window.location.pathname.length - 10) + "/login-with-google?fullname=" + profile.getName() +"&avatar=" +profile.getImageUrl() + "&email=" + profile.getEmail(),
                error: function () {
                    console.log("error")
                },
                success: function (data) {
                    window.location.href = window.location.href.substring(0, window.location.href.length - 10) + "/trang-chu?status=login-success";
                },
                type: 'POST'
            });
        }
    }
</script>
</body>
</html>
