<%@ page import="java.util.List" %>
<%@ page import="com.movie.entity.Movies" %>
<%@ page import="com.movie.model.MovieSearchModel" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.movie.dao.impl.MovieDao" %>
<%@ page import="com.movie.entity.CategoryItemMovie" %>
<%@ page import="com.movie.dao.impl.CategoryItemMovieDao" %>
<%@include file="/commont/taglib.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Movies> listMovies = new MovieDao().findTopView();
    List<MovieSearchModel> movieTop = new ArrayList<>();
    for(Movies movie : listMovies){
        CategoryItemMovie categoryItemMovie = new CategoryItemMovieDao().findByMovieId(movie.getId()).get(0);
        movieTop.add(new MovieSearchModel(movie, categoryItemMovie.getCategoryItem().getUrl()));
    }
    request.setAttribute("movieTop", movieTop);
%>
<div class="product__sidebar__view">
    <div class="section-title">
        <h5>Top Views</h5>
    </div>
    <ul class="filter__controls">
        <li class="active" data-filter="*">Day</li>
        <li data-filter=".week">Week</li>
        <li data-filter=".month">Month</li>
        <li data-filter=".years">Years</li>
    </ul>
    <div class="filter__gallery">
        <c:forEach var="movie" items="${movieTop}">
            <%--                    <div class="product__sidebar__view__item set-bg mix day years"--%>
            <%--                         data-setbg="img/sidebar/tv-1.jpg">--%>
            <%--                        <div class="ep">18 / ?</div>--%>
            <%--                        <div class="view"><i class="fa fa-eye"></i> 9141</div>--%>
            <%--                        <h5><a href="#">Boruto: Naruto next generations</a></h5>--%>
            <%--                    </div>--%>
            <a href="<c:url value="/phim?type=${movie.urlCategory}&id=${movie.movie.id}"/> ">
                <div class="product__sidebar__view__item set-bg mix day years phimNgangItem"
                        <c:if test="${movie.movie.getBannerUrl() == 'http'}">
                            data-setbg="<c:url value="${movie.movie.banner}"/> "
                        </c:if>
                        <c:if test="${movie.movie.getBannerUrl() != 'http'}">
                            data-setbg="<c:url value="/images/banner/${movie.movie.banner}"/> "
                        </c:if>
                >
                    <div class="ep">${movie.movie.quality} / ${movie.movie.quality}</div>
                    <div class="view"><i class="fa fa-eye"></i> ${movie.movie.views}</div>
                    <h5><a href="<c:url value="/phim?type=${movie.urlCategory}&id=${movie.movie.id}"/> ">${movie.movie.name}</a></h5>
                </div>
            </a>
        </c:forEach>
        <%--        <div class="product__sidebar__view__item set-bg mix month week"--%>
        <%--             data-setbg="img/sidebar/tv-2.jpg">--%>
        <%--            <div class="ep">18 / ?</div>--%>
        <%--            <div class="view"><i class="fa fa-eye"></i> 9141</div>--%>
        <%--            <h5><a href="#">The Seven Deadly Sins: Wrath of the Gods</a></h5>--%>
        <%--        </div>--%>
        <%--        <div class="product__sidebar__view__item set-bg mix week years"--%>
        <%--             data-setbg="img/sidebar/tv-3.jpg">--%>
        <%--            <div class="ep">18 / ?</div>--%>
        <%--            <div class="view"><i class="fa fa-eye"></i> 9141</div>--%>
        <%--            <h5><a href="#">Sword art online alicization war of underworld</a></h5>--%>
        <%--        </div>--%>
        <%--        <div class="product__sidebar__view__item set-bg mix years month"--%>
        <%--             data-setbg="img/sidebar/tv-4.jpg">--%>
        <%--            <div class="ep">18 / ?</div>--%>
        <%--            <div class="view"><i class="fa fa-eye"></i> 9141</div>--%>
        <%--            <h5><a href="#">Fate/stay night: Heaven's Feel I. presage flower</a></h5>--%>
        <%--        </div>--%>
        <%--        <div class="product__sidebar__view__item set-bg mix day"--%>
        <%--             data-setbg="img/sidebar/tv-5.jpg">--%>
        <%--            <div class="ep">18 / ?</div>--%>
        <%--            <div class="view"><i class="fa fa-eye"></i> 9141</div>--%>
        <%--            <h5><a href="#">Fate stay night unlimited blade works</a></h5>--%>
        <%--        </div>--%>
    </div>
</div>