<%@include file="/commont/taglib.jsp"%>>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Kết quả tìm kiếm</title>
</head>
<body>
<div class="breadcrumb-option">
  <div class="container">
    <div class="row">
      <div class="col-lg-12">
        <div class="breadcrumb__links">
          <a href="<c:url value="/trang-chu"/> "><i class="fa fa-home"></i> Trang chủ</a>
          <a href="">Kết quả tìm kiếm cho"${keyword}"</a>
        </div>
      </div>
    </div>
  </div>
</div>
<section class="product-page spad">
  <div class="container">
    <div class="row">
      <div class="col-lg-8">
        <div class="product__page__content">
          <div class="product__page__title">
            <div class="row">
              <div class="col-lg-8 col-md-8 col-sm-6">
                <div class="section-title">
                  <h4>Kết quả tìm kiếm</h4>
                </div>
              </div>
              <div class="col-lg-4 col-md-4 col-sm-6">
                <div class="product__page__filter">
                  <p>Order by:</p>
                  <select>
                    <option value="">A-Z</option>
                    <option value="">1-10</option>
                    <option value="">10-50</option>
                  </select>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <c:if test="${movies == null}">
              <div style="margin: 30px">
                <h4 style="color: white">Không tìm thấy bộ phim nào cho từ khóa "${keyword}"</h4>
              </div>
            </c:if>
            <c:forEach var="movieItem" items="${movies}">
              <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="product__item phimItem">
                  <a href="<c:url value="/phim?type=${movieItem.urlCategory}&id=${movieItem.movie.id}"/> ">
                    <div class="product__item__pic set-bg"
                            <c:if test="${movieItem.movie.getThumbnailUrl() == 'http'}">
                              data-setbg="<c:url value="${movieItem.movie.thumbnail}"/> "
                            </c:if>
                            <c:if test="${movieItem.movie.getThumbnailUrl() != 'http'}">
                              data-setbg="<c:url value="/images/thumnail/${movieItem.movie.thumbnail}"/> "
                            </c:if>
                    >
                      <div class="ep">${movieItem.movie.quality} / ${movieItem.movie.quality}</div>
                      <div class="comment"><i class="fa fa-comments"></i> 11</div>
                      <div class="view"><i class="fa fa-eye"></i> ${movieItem.movie.views}</div>
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
                    <h5><a href="<c:url value="/phim?type=${movieItem.urlCategory}&id=${movieItem.movie.id}"/> ">${movieItem.movie.name}</a></h5>
                  </div>
                </div>
              </div>
            </c:forEach>
          </div>
        </div>
        <div class="product__pagination">
          <c:forEach var="pageItem" items="${page}">
            <a href="<c:url value="/phim?search=${keyword}&page=${pageItem}"/> "
                    <c:if test="${pageItem == pageIndex}">
                      class="current-page"
                    </c:if>
            >${pageItem}</a>
          </c:forEach>
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
                <img src="img/sidebar/comment-1.jpg" alt="">
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
                <img src="img/sidebar/comment-2.jpg" alt="">
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
                <img src="img/sidebar/comment-3.jpg" alt="">
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
                <img src="img/sidebar/comment-4.jpg" alt="">
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
</body>
</html>
