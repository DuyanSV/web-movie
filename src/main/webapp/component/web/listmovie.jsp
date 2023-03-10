<%@include file="/commont/taglib.jsp"%>>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col-lg-8">
    <div class="product__page__content">
        <div class="product__page__title">
            <div class="row">
                <div class="col-lg-8 col-md-8 col-sm-6">
                    <div class="section-title">
                        <h4>Romance</h4>
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
            <c:forEach var="movieItem" items="${movies}">
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg"
                                <c:if test="${movieItem.getThumbnailUrl() == 'http'}">
                                    data-setbg="<c:url value="${movieItem.thumbnail}"/> "
                                </c:if>
                                <c:if test="${movieItem.getThumbnailUrl() != 'http'}">
                                    data-setbg="<c:url value="/images/thumnail/${movieItem.thumbnail}"/> "
                                </c:if>
                        >
                            <div class="ep">18 / 18</div>
                            <div class="comment"><i class="fa fa-comments"></i> 11</div>
                            <div class="view"><i class="fa fa-eye"></i> 9141</div>
                        </div>
                        <div class="product__item__text">
                            <ul>
                                <li>Active</li>
                                <li>Movie</li>
                            </ul>
                            <h5><a href="#">Sen to Chihiro no Kamikakushi</a></h5>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <div class="product__pagination">
        <a href="#" class="current-page">1</a>
        <a href="#">2</a>
        <a href="#">3</a>
        <a href="#">4</a>
        <a href="#">5</a>
        <a href="#"><i class="fa fa-angle-double-right"></i></a>
    </div>
</div>
