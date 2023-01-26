<%@include file="/commont/taglib.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Profile</title>
</head>
<body>
<!-- Blog Details Section Begin -->
<section class="blog-details spad">
    <div class="container">
        <div class="row d-flex justify-content-center">
            <div class="col-lg-8">
                <div class="blog__details__title">
                    <h6>Action, Magic <span>- March 08, 2020</span></h6>
                    <h2>Xin chào: ${USER.fullname}</h2>
                    <div class="blog__details__social" style="text-align: center">
                        <a href="<c:url value="/dang-nhap"/> " class="facebook" style="text-align: center; padding: 15px 20px">Đổi tài khoản</a>
                        <a href="<c:url value="/dang-xuat"/> " class="pinterest" style="text-align: center; padding: 15px 20px">Đăng xuất</a>
                        <a href="<c:url value="/phim?type=phim-cua-ban"/> " class="linkedin" style="text-align: center; padding: 15px 20px">Phim của bạn</a>
                        <a href="<c:url value="/nap-tien" />" class="twitter" style="text-align: center; padding: 15px 20px">Số
                            dư: <fmt:formatNumber value="${USER.surplus}" maxFractionDigits = "3"/>vnđ, Nạp tiền</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-10">
                <h4 style="color: white">Lịch sử mua</h4>
                <div class="blog__details__content">
                    <table class="table table-striped" style="color: white">
                        <thead>
                        <tr>
                            <th scope="col">Tên phim</th>
                            <th scope="col">Giá</th>
                            <th scope="col">Ngày mua</th>
                            <th scope="col"></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="ob" items="${userMovies}">
                            <tr>
                                <td>${ob.movies.name}</td>
                                <td><fmt:formatNumber value="${ob.price}" maxFractionDigits = "3"/>vnđ</td>
                                <td><fmt:formatDate value="${ob.buyDate}" pattern="dd-MM-yyyy"/> </td>
                                <td>
                                    <a href="<c:url value="/phim?type=&id=${ob.movies.id}" />" class="btn btn-danger float-right">Xem ngay</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>

</body>
</html>
