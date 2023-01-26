<%@ page import="com.movie.utils.CookieUtil" %>
<%@ page import="com.movie.entity.UserEntity" %>
<%@ page import="com.movie.utils.SessionUtil" %>
<%@ page import="com.movie.dao.impl.UserDao" %>
<!-- Header Section Begin -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/commont/taglib.jsp" %>
<%--<%--%>
<%--    String id = CookieUtil.getCookieUtil().get("ID", request);--%>
<%--    String email = CookieUtil.getCookieUtil().get("EMAIL", request);--%>
<%--    String avatar = CookieUtil.getCookieUtil().get("AVATAR", request);--%>
<%--    SessionUtil.getSession().removeUser(request,"USER");--%>
<%--    if (id != null) {--%>
<%--        UserDao userService = new UserDao();--%>
<%--        UserEntity userEntity = userService.findById(Integer.parseInt(id));--%>
<%--        SessionUtil.getSession().putUser(request, "USER", userEntity);--%>
<%--    }--%>
<%--%>--%>

<header class="header">
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <div class="header__logo">
                    <a href="<c:url value="/trang-chu"/> ">
                        <img src="<c:url value="/template/web/img/logo.png"/> " alt="">
                    </a>
                </div>
            </div>
            <div class="col-lg-4 float-right">
                <div class="header__right">
                    <a href="#" class="search-switch"><span class="icon_search"></span></a>
                    <c:if test="${empty USER}">
                        <a class="onloader" href="<c:url value="/dang-nhap"/> ">
                            <p style="color: white; display: inline-block">Đăng nhập</p>
                            <span style="color: white" class="icon_profile"></span>
                        </a>
                    </c:if>
                    <c:if test="${not empty USER}">
                        <a class="onloader" href="<c:url value="/profile"/> ">
                            <p style="color: white; display: inline-block">${USER.fullname}</p>
                            <span style="color: white" class="icon_profile"></span></a>
                        </a>
                    </c:if>
                </div>
            </div>
            <div class="col-lg-12">
                <div class="header__nav">
                    <nav class="header__menu mobile-menu">
                        <ul>
                            <li class="active" style="padding-top: 0px"><a
                                    style="padding-top: 10px; padding-bottom: 10px" href="<c:url value="/trang-chu"/> ">Trang
                                chủ</a></li>
                            <c:forEach var="danhMuc" items="${listDanhMuc}">
                                <li><a href="<c:url value="/trang-chu"/> ">${danhMuc.categoryEntity.categoryName} <span
                                        class="arrow_carrot-down"></span></a href="
                                    <c:url value="/trang-chu"/> ">
                                    <ul class="dropdown">
                                        <c:forEach var="danhMucItem" items="${danhMuc.listCategoryItem}">
                                            <li><a style="padding-top: 10px; padding-bottom: 10px;"
                                                   href="<c:url value="/phim?type=${danhMucItem.url}"/> ">${danhMucItem.categoryName}</a>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </li>
                            </c:forEach>
                            <c:if test="${not empty USER}">
                                <li><a style="padding-top: 10px; padding-bottom: 10px"
                                       href="<c:url value="/phim?type=phim-cua-ban"/> ">Phim của bạn</a></li>
                            </c:if>
                            <c:if test="${USER.role == 1}">
                                <li><a style="padding-top: 10px; padding-bottom: 10px"
                                       href="<c:url value="/admin/trang-chu"/> ">Quản trị</a></li>
                            </c:if>
                            <c:if test="${USER.role == 0}">
                                <li><a style="padding-top: 10px; padding-bottom: 10px" href="#">Liên hệ</a></li>
                            </c:if>
                            <li><a href="">Ngôn ngữ <span class="arrow_carrot-down"></span></a>
                                <ul class="dropdown">
                                    <li>
                                        <a href="#" onclick="doGTranslate('vi|vi');return false;" title="Tiếng Việt"
                                        ><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/Flag_of_North_Vietnam_%281955%E2%80%931976%29.svg/230px-Flag_of_North_Vietnam_%281955%E2%80%931976%29.svg.png"
                                              style="width: 25px"
                                              alt="English"/> Tiếng Việt</a>
                                    </li>
                                    <li>
                                        <a href="#" onclick="doGTranslate('vi|zh-CN');return false;" title="Tiếng Trung"
                                        ><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Flag_of_the_People%27s_Republic_of_China.svg/225px-Flag_of_the_People%27s_Republic_of_China.svg.png"
                                              style="width: 25px"
                                              alt="English"/> Tiếng Trung</a>
                                    </li>
                                    <li>
                                        <a href="#" onclick="doGTranslate('vi|en');return false;" title="Tiếng Anh"
                                        ><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/ae/Flag_of_the_United_Kingdom.svg/300px-Flag_of_the_United_Kingdom.svg.png"
                                              style="width: 25px"
                                              alt="English"/> Tiếng Anh</a>
                                    </li>
                                    <li>
                                        <a href="#" onclick="doGTranslate('vi|ko');return false;" title="Tiếng Hàn"
                                        ><img src="https://globalmap.edu.vn/wp-content/uploads/2020/10/flag_of_the_provisional_government_of_the_republic_of_korea-svg.png"
                                              style="width: 25px"
                                              alt="English"/> Tiếng Hàn</a>
                                    </li>
                                    <li>
                                        <a href="#" onclick="doGTranslate('vi|ja');return false;" title="Tiếng Nhật"
                                        ><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Flag_of_Japan.svg/225px-Flag_of_Japan.svg.png"
                                              style="width: 25px"
                                              alt="English"/> Tiếng Nhật</a>
                                    </li>
                                    <li>
                                        <a href="#" onclick="doGTranslate('vi|id');return false;" title="Tiếng Indonesian"
                                        ><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/9f/Flag_of_Indonesia.svg/225px-Flag_of_Indonesia.svg.png"
                                              style="width: 25px"
                                              alt="English"/> Tiếng Indonesian</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
        <div id="mobile-menu-wrap"></div>
    </div>
</header>
