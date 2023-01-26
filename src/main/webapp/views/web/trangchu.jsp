<%@include file="/commont/taglib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<!-- Page Preloder -->

<!-- Hero Section Begin -->
<section class="hero">
    <div class="container">
        <div class="hero__slider owl-carousel">
            <c:forEach var="sliderItem" items="${slider}">
                <div class="hero__items set-bg"
                        <c:if test="${sliderItem.movies.getBannerUrl() == 'http'}">
                            data-setbg="<c:url value="${sliderItem.movies.banner}"/> "
                        </c:if>
                        <c:if test="${sliderItem.movies.getBannerUrl() != 'http'}">
                            data-setbg="<c:url value="/images/banner/${sliderItem.movies.banner}"/> "
                        </c:if>
                >
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="hero__text">
                                <div class="label">Lượt xem: <i class="fa fa-eye"></i>${sliderItem.movies.views}</div>
                                <h2>${sliderItem.movies.name}</h2>
                                <p>Thời lượng: ${sliderItem.movies.duration} phút/tập</p>
                                <a href="<c:url value="/phim?type=${sliderItem.type}&id=${sliderItem.movies.id}&action=watching&episode=1"/> "><span>Watch Now</span> <i class="fa fa-angle-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>
<!-- Hero Section End -->

<!-- Product Section Begin -->
<section class="product spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <div class="trending__product">
                    <div class="row">
                        <div class="col-lg-8 col-md-8 col-sm-8">
                            <div class="section-title">
                                <h4>Những bộ phim được yêu thích nhất</h4>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-4">
                            <div class="btn__all">
                                <a href="#" class="primary-btn">View All <span class="arrow_right"></span></a>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <c:forEach var="movieItem" items="${movieTopLike}">
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item phimItem">
                                    <a href="<c:url value="/phim?type=${type}&id=${movieItem.id}"/> ">
                                        <div class="product__item__pic set-bg"
                                                <c:if test="${movieItem.getThumbnailUrl() == 'http'}">
                                                    data-setbg="<c:url value="${movieItem.thumbnail}"/> "
                                                </c:if>
                                                <c:if test="${movieItem.getThumbnailUrl() != 'http'}">
                                                    data-setbg="<c:url value="/images/thumnail/${movieItem.thumbnail}"/> "
                                                </c:if>
                                        >
                                            <div class="ep">${movieItem.quality} / ${movieItem.quality}</div>
                                            <div class="comment"><i class="bi bi-hand-thumbs-up"></i> ${movieItem.countLikes()}</div>
                                            <div class="view"><i class="fa fa-eye"></i> ${movieItem.views}</div>
                                        </div>
                                    </a>
                                    <div class="product__item__text">
                                        <ul>
                                            <li style="background-color: #1e7e34; color: black">Active</li>
                                            <c:if test="${movieItem.vip == 1}">
                                                <li style="background-color: yellow; color: darkred">VIP</li>
                                            </c:if>
                                            <c:if test="${movieItem.vip == 0}">
                                                <li>Movie</li>
                                            </c:if>
                                        </ul>
                                        <h5><a href="<c:url value="/phim?type=${type}&id=${movieItem.id}"/> ">${movieItem.name}</a></h5>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <div class="popular__product">
                    <div class="row">
                        <div class="col-lg-8 col-md-8 col-sm-8">
                            <div class="section-title">
                                <h4>Phim mới</h4>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-4">
                            <div class="btn__all">
                                <a href="#" class="primary-btn">View All <span class="arrow_right"></span></a>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <c:forEach var="movieItem" items="${movieNew}">
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item phimItem">
                                    <a href="<c:url value="/phim?type=${type}&id=${movieItem.id}"/> ">
                                        <div class="product__item__pic set-bg"
                                                <c:if test="${movieItem.getThumbnailUrl() == 'http'}">
                                                    data-setbg="<c:url value="${movieItem.thumbnail}"/> "
                                                </c:if>
                                                <c:if test="${movieItem.getThumbnailUrl() != 'http'}">
                                                    data-setbg="<c:url value="/images/thumnail/${movieItem.thumbnail}"/> "
                                                </c:if>
                                        >
                                            <div class="ep">${movieItem.quality} / ${movieItem.quality}</div>
                                            <div class="comment"><i class="bi bi-hand-thumbs-up"></i> ${movieItem.countLikes()}</div>
                                            <div class="view"><i class="fa fa-eye"></i> ${movieItem.views}</div>
                                        </div>
                                    </a>
                                    <div class="product__item__text">
                                        <ul>
                                            <li style="background-color: #1e7e34; color: black">Active</li>
                                            <c:if test="${movieItem.vip == 1}">
                                                <li style="background-color: yellow; color: darkred">VIP</li>
                                            </c:if>
                                            <c:if test="${movieItem.vip == 0}">
                                                <li>Movie</li>
                                            </c:if>
                                        </ul>
                                        <h5><a href="<c:url value="/phim?type=${type}&id=${movieItem.id}"/> ">${movieItem.name}</a></h5>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <div class="recent__product">
                    <div class="row">
                        <div class="col-lg-8 col-md-8 col-sm-8">
                            <div class="section-title">
                                <h4>Lịch sử xem</h4>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-4">
                            <div class="btn__all">
                                <a href="#" class="primary-btn">View All <span class="arrow_right"></span></a>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <c:if test="${movieHis == null}">
                            <p style="color: white;">Bạn chưa xem bộ phim nào!</p>
                        </c:if>
                        <c:forEach var="movieItem" items="${movieHis}">
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item phimItem">
                                    <a href="<c:url value="/phim?type=${type}&id=${movieItem.id}"/> ">
                                        <div class="product__item__pic set-bg"
                                                <c:if test="${movieItem.getThumbnailUrl() == 'http'}">
                                                    data-setbg="<c:url value="${movieItem.thumbnail}"/> "
                                                </c:if>
                                                <c:if test="${movieItem.getThumbnailUrl() != 'http'}">
                                                    data-setbg="<c:url value="/images/thumnail/${movieItem.thumbnail}"/> "
                                                </c:if>
                                        >
                                            <div class="ep">${movieItem.quality} / ${movieItem.quality}</div>
                                            <div class="comment"><i class="bi bi-hand-thumbs-up"></i> ${movieItem.countLikes()}</div>
                                            <div class="view"><i class="fa fa-eye"></i> ${movieItem.views}</div>
                                        </div>
                                    </a>
                                    <div class="product__item__text">
                                        <ul>
                                            <li style="background-color: #1e7e34; color: black">Active</li>
                                            <c:if test="${movieItem.vip == 1}">
                                                <li style="background-color: yellow; color: darkred">VIP</li>
                                            </c:if>
                                            <c:if test="${movieItem.vip == 0}">
                                                <li>Movie</li>
                                            </c:if>
                                        </ul>
                                        <h5><a href="<c:url value="/phim?type=${type}&id=${movieItem.id}"/> ">${movieItem.name}</a></h5>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <div class="live__product">
                    <div class="row">
                        <div class="col-lg-8 col-md-8 col-sm-8">
                            <div class="section-title">
                                <h4>Live Action</h4>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-4">
                            <div class="btn__all">
                                <a href="#" class="primary-btn">View All <span class="arrow_right"></span></a>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="<c:url value="/template/web/img/live/live-1.jpg"/> ">
                                    <div class="ep">18 / 18</div>
                                    <div class="comment"><i class="fa fa-comments"></i> 11</div>
                                    <div class="view"><i class="fa fa-eye"></i> 9141</div>
                                </div>
                                <div class="product__item__text">
                                    <ul>
                                        <li>Active</li>
                                        <li>Movie</li>
                                    </ul>
                                    <h5><a href="#">Shouwa Genroku Rakugo Shinjuu</a></h5>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="<c:url value="/template/web/img/live/live-2.jpg"/> ">
                                    <div class="ep">18 / 18</div>
                                    <div class="comment"><i class="fa fa-comments"></i> 11</div>
                                    <div class="view"><i class="fa fa-eye"></i> 9141</div>
                                </div>
                                <div class="product__item__text">
                                    <ul>
                                        <li>Active</li>
                                        <li>Movie</li>
                                    </ul>
                                    <h5><a href="#">Mushishi Zoku Shou 2nd Season</a></h5>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="<c:url value="/template/web/img/live/live-3.jpg"/> ">
                                    <div class="ep">18 / 18</div>
                                    <div class="comment"><i class="fa fa-comments"></i> 11</div>
                                    <div class="view"><i class="fa fa-eye"></i> 9141</div>
                                </div>
                                <div class="product__item__text">
                                    <ul>
                                        <li>Active</li>
                                        <li>Movie</li>
                                    </ul>
                                    <h5><a href="#">Mushishi Zoku Shou: Suzu no Shizuku</a></h5>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="<c:url value="/template/web/img/live/live-4.jpg"/> ">
                                    <div class="ep">18 / 18</div>
                                    <div class="comment"><i class="fa fa-comments"></i> 11</div>
                                    <div class="view"><i class="fa fa-eye"></i> 9141</div>
                                </div>
                                <div class="product__item__text">
                                    <ul>
                                        <li>Active</li>
                                        <li>Movie</li>
                                    </ul>
                                    <h5><a href="#">The Seven Deadly Sins: Wrath of the Gods</a></h5>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="<c:url value="/template/web/img/live/live-5.jpg"/> ">
                                    <div class="ep">18 / 18</div>
                                    <div class="comment"><i class="fa fa-comments"></i> 11</div>
                                    <div class="view"><i class="fa fa-eye"></i> 9141</div>
                                </div>
                                <div class="product__item__text">
                                    <ul>
                                        <li>Active</li>
                                        <li>Movie</li>
                                    </ul>
                                    <h5><a href="#">Fate/stay night Movie: Heaven's Feel - II. Lost</a></h5>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="<c:url value="/template/web/img/live/live-6.jpg"/> ">
                                    <div class="ep">18 / 18</div>
                                    <div class="comment"><i class="fa fa-comments"></i> 11</div>
                                    <div class="view"><i class="fa fa-eye"></i> 9141</div>
                                </div>
                                <div class="product__item__text">
                                    <ul>
                                        <li>Active</li>
                                        <li>Movie</li>
                                    </ul>
                                    <h5><a href="#">Kizumonogatari II: Nekketsu-hen</a></h5>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-8">
                <div class="product__sidebar">
                    <%@include file="/component/web/topview.jsp"%>
                    <div class="product__sidebar__comment">
                        <div class="section-title">
                            <h5>New Comment</h5>
                        </div>
                        <div class="product__sidebar__comment__item">
                            <div class="product__sidebar__comment__item__pic">
                                <img src="<c:url value="/template/web/img/sidebar/comment-1.jpg"/> " alt="">
                            </div>
                            <div class="product__sidebar__comment__item__text">
                                <ul>
                                    <li>Active</li>
                                    <li>Movie</li>
                                </ul>
                                <h5><a href="#">The Seven Deadly Sins: Wrath of the Gods</a></h5>
                                <span><i class="fa fa-eye"></i> 19.141 Viewes</span>
                            </div>
                        </div>
                        <div class="product__sidebar__comment__item">
                            <div class="product__sidebar__comment__item__pic">
                                <img src="<c:url value="/template/web/img/sidebar/comment-2.jpg"/> " alt="">
                            </div>
                            <div class="product__sidebar__comment__item__text">
                                <ul>
                                    <li>Active</li>
                                    <li>Movie</li>
                                </ul>
                                <h5><a href="#">Shirogane Tamashii hen Kouhan sen</a></h5>
                                <span><i class="fa fa-eye"></i> 19.141 Viewes</span>
                            </div>
                        </div>
                        <div class="product__sidebar__comment__item">
                            <div class="product__sidebar__comment__item__pic">
                                <img src="<c:url value="/template/web/img/sidebar/comment-3.jpg"/> " alt="">
                            </div>
                            <div class="product__sidebar__comment__item__text">
                                <ul>
                                    <li>Active</li>
                                    <li>Movie</li>
                                </ul>
                                <h5><a href="#">Kizumonogatari III: Reiket su-hen</a></h5>
                                <span><i class="fa fa-eye"></i> 19.141 Viewes</span>
                            </div>
                        </div>
                        <div class="product__sidebar__comment__item">
                            <div class="product__sidebar__comment__item__pic">
                                <img src="<c:url value="/template/web/img/sidebar/comment-4.jpg"/> " alt="">
                            </div>
                            <div class="product__sidebar__comment__item__text">
                                <ul>
                                    <li>Active</li>
                                    <li>Movie</li>
                                </ul>
                                <h5><a href="#">Monogatari Series: Second Season</a></h5>
                                <span><i class="fa fa-eye"></i> 19.141 Viewes</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Product Section End -->

</body>
</html>
