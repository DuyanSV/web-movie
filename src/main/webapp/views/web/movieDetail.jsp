<%@include file="/commont/taglib.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${movie.name}</title>
</head>
<body>
<%@include file="/component/web/buyMovie.jsp"%>
<%@include file="/component/web/buyFalse.jsp"%>
<%@include file="/component/web/buyDone.jsp"%>
<div class="breadcrumb-option">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb__links">
                    <a href="<c:url value="/trang-chu"/> "><i class="fa fa-home"></i> Trang chủ</a>
                    <a href="">${movie.name}</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumb End -->

<!-- Anime Section Begin -->
<section class="anime-details spad">
    <div class="container">
        <%@include file="/commont/alert/errorLike.jsp" %>
        <div class="anime__details__content">
            <div class="row">
                <div class="col-lg-3">
                    <div class="anime__details__pic set-bg"
                            <c:if test="${movie.getThumbnailUrl() == 'http'}">
                                data-setbg="<c:url value="${movie.thumbnail}"/> "
                            </c:if>
                            <c:if test="${movie.getThumbnailUrl() != 'http'}">
                                data-setbg="<c:url value="/images/thumnail/${movie.thumbnail}"/> "
                            </c:if>
                    >
                        <div class="comment"><i class="fa fa-comments"></i> 11</div>
                        <div class="view"><i class="fa fa-eye"></i> ${movie.views}</div>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="anime__details__text">
                        <div class="row">
                            <div class="col-lg-9">
                                <div class="anime__details__title">
                                    <h3>${movie.name}</h3>
                                    <span>${movie.actor}</span>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="anime__details__rating">
                                    <div class="rating">
                                        <c:if test="${star == 0}">
                                            <a href="#"><i class="fa fa-star-o"></i></a><a href="#"><i
                                                class="fa fa-star-o"></i></a><a href="#"><i
                                                class="fa fa-star-o"></i></a><a href="#"><i
                                                class="fa fa-star-o"></i></a><a href="#"><i
                                                class="fa fa-star-o"></i></a>
                                        </c:if>
                                        <c:if test="${star > 0 && star < 1}">
                                            <a href="#"><i class="fa fa-star-half-o"></i></a>
                                            <a href="#"><i class="fa fa-star-o"></i></a><a href="#"><i
                                                class="fa fa-star-o"></i></a><a href="#"><i
                                                class="fa fa-star-o"></i></a><a href="#"><i
                                                class="fa fa-star-o"></i></a>
                                        </c:if>
                                        <c:if test="${star == 1}">
                                            <a href="#"><i class="fa fa-star"></i></a><a href="#"><i
                                                class="fa fa-star-o"></i></a><a href="#"><i
                                                class="fa fa-star-o"></i></a><a href="#"><i
                                                class="fa fa-star-o"></i></a><a href="#"><i
                                                class="fa fa-star-o"></i></a>
                                        </c:if>
                                        <c:if test="${star > 1 && star < 2}">
                                            <a href="#"><i class="fa fa-star"></i></a><a href="#"><i
                                                class="fa fa-star-half-o"></i></a>
                                            <a href="#"><i class="fa fa-star-o"></i></a><a href="#"><i
                                                class="fa fa-star-o"></i></a><a href="#"><i
                                                class="fa fa-star-o"></i></a>
                                        </c:if>
                                        <c:if test="${star == 2}">
                                            <a href="#"><i class="fa fa-star"></i></a><a href="#"><i
                                                class="fa fa-star"></i></a><a href="#"><i
                                                class="fa fa-star-o"></i></a><a href="#"><i
                                                class="fa fa-star-o"></i></a><a href="#"><i
                                                class="fa fa-star-o"></i></a>
                                        </c:if>
                                        <c:if test="${star > 2 && star < 3}">
                                            <a href="#"><i class="fa fa-star"></i></a><a href="#"><i
                                                class="fa fa-star"></i></a>
                                            <a href="#"><i class="fa fa-star-half-o"></i></a>
                                            <a href="#"><i class="fa fa-star-o"></i></a><a href="#"><i
                                                class="fa fa-star-o"></i></a>
                                        </c:if>
                                        <c:if test="${star == 3}">
                                            <a href="#"><i class="fa fa-star"></i></a><a href="#"><i
                                                class="fa fa-star"></i></a><a href="#"><i class="fa fa-star"></i></a>
                                            <a href="#"><i class="fa fa-star-o"></i></a><a href="#"><i
                                                class="fa fa-star-o"></i></a>
                                        </c:if>
                                        <c:if test="${star > 3 && star <4}">
                                            <a href="#"><i class="fa fa-star"></i></a><a href="#"><i
                                                class="fa fa-star"></i></a><a href="#"><i class="fa fa-star"></i></a>
                                            <a href="#"><i class="fa fa-star-half-o"></i></a>
                                            <a href="#"><i class="fa fa-star-o"></i></a>
                                        </c:if>
                                        <c:if test="${star == 4}">
                                            <a href="#"><i class="fa fa-star"></i></a><a href="#"><i
                                                class="fa fa-star"></i></a><a href="#"><i class="fa fa-star"></i></a><a
                                                href="#"><i class="fa fa-star"></i></a>
                                            <a href="#"><i class="fa fa-star-o"></i></a>
                                        </c:if>
                                        <c:if test="${star > 4 && star < 5}">
                                            <a href="#"><i class="fa fa-star"></i></a><a href="#"><i
                                                class="fa fa-star"></i></a><a href="#"><i class="fa fa-star"></i></a><a
                                                href="#"><i class="fa fa-star"></i></a>
                                            <a href="#"><i class="fa fa-star-half-o"></i></a>
                                        </c:if>
                                        <c:if test="${star == 5}">
                                            <a href="#"><i class="fa fa-star"></i></a><a href="#"><i
                                                class="fa fa-star"></i></a><a href="#"><i class="fa fa-star"></i></a><a
                                                href="#"><i class="fa fa-star"></i></a><a href="#"><i
                                                class="fa fa-star"></i></a>
                                        </c:if>
                                    </div>
                                    <span id="avgstar"><fmt:formatNumber type="number" value="${star}"
                                                                         pattern="#.#"/></span>
                                    <span id="votess">${votes} Votes</span>
                                </div>
                            </div>
                        </div>
                        <%--                        <p>${movie.descreption}</p>--%>
                        <div class="anime__details__widget">
                            <div class="row">
                                <div class="col-lg-6 col-md-6">
                                    <ul>
                                        <li><span>Thể loại:</span> ${theLoai}</li>
                                        <li><span>Ngày phát sóng:</span> <fmt:formatDate pattern="dd-MM-yyyy"
                                                                                         value="${movie.dateAired}"/>
                                        </li>
                                        <li><span>Trạng thái:</span> Hoàn thành</li>
                                        <li><span>Chất lượng:</span> Ultra untimate super HD</li>
                                        <li><span>Ngôn ngữ:</span> Vietsub</li>
                                    </ul>
                                </div>
                                <div class="col-lg-6 col-md-6">
                                    <ul>
                                        <li><span>Điểm:</span> 8.5</li>
                                        <li><span>Xếp hạng:</span> 9/10</li>
                                        <li><span>Thời lượng:</span> ${movie.duration} phút/tập</li>
                                        <li><span>Lượt xem:</span> ${movie.views}</li>
                                        <c:if test="${movie.vip == 1}">
                                            <li><span>Loại phim:</span> <span
                                                    style="background-color: orange; width: 50px; text-align: center; border-radius: 8px; color: red"><b>VIP</b></span>
                                            </li>
                                        </c:if>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="anime__details__btn">
                            <input type="hidden" id="idMovieDetail" value="${movie.id}">
                            <div id="btnLike" onclick="onLike()" class="follow-btn" style="
                            <c:if test="${!onLike}">display: unset;</c:if>
                            <c:if test="${onLike}">display: none;</c:if>
                                    "><i class="bi bi-hand-thumbs-up"></i> Thích
                            </div>
                            <div id="btnUnLike" onclick="unLike()" class="follow-btn" style="
                            <c:if test="${onLike}">display: unset;</c:if>
                            <c:if test="${!onLike}">display: none;</c:if>
                                    "><i class="bi bi-hand-thumbs-up"></i> Đã thích
                            </div>

                            <a href="<c:url value="${url}&action=watching"/>"
                               style="
                               <c:if test="${block != null}">
                                       display: none;
                               </c:if>"
                               class="watch-btn" id="xemNgay"><span>Xem ngay</span>
                                <i class="fa fa-angle-right"></i></a>

                            <input type="hidden" value="${movie.price}" id="priceMovie">
                            <a onclick="onByMovie(${movie.price})" style="
                            <c:if test="${block == null}">
                                    display: none;
                            </c:if>" class="watch-btn" id="muaNgay"><span>Mua ngay</span>
                                <i class="fa fa-angle-right"></i></a>

                        </div>
                        <p style="margin-bottom: -10px; margin-top: 20px">Đánh giá của bạn</p>
                        <div class="stars">
                            <input class="star star-5" id="star-5" type="radio" name="star"/>
                            <label class="star star-5" for="star-5" onclick="fireStar()"></label>
                            <input class="star star-4" id="star-4" type="radio" name="star"/>
                            <label class="star star-4" for="star-4" onclick="fourStar()"></label>
                            <input class="star star-3" id="star-3" type="radio" name="star"/>
                            <label class="star star-3" for="star-3" onclick="threeStar()"></label>
                            <input class="star star-2" id="star-2" type="radio" name="star"/>
                            <label class="star star-2" for="star-2" onclick="twoStar()"></label>
                            <input class="star star-1" id="star-1" type="radio" name="star"/>
                            <label class="star star-1" for="star-1" onclick="oneStar()"></label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-8 col-md-8">
                <img style="margin-bottom: 50px"
                <c:if test="${movie.getBannerUrl() == 'http'}">
                     src="<c:url value="${movie.banner}"/> "
                </c:if>
                <c:if test="${movie.getBannerUrl() != 'http'}">
                     src="<c:url value="/images/banner/${movie.banner}"/> "
                </c:if>

                >
                <div class="section-title">
                    <h5>Nội dung</h5>
                </div>
                <p style="color: white; margin-bottom: 50px">
                    <c:out value="${movie.descreption}" escapeXml="false"/>
                </p>
                <div class="anime__details__review" id="divComment">
                    <div class="section-title">
                        <h5>Reviews</h5>
                    </div>
                    <c:forEach items="${comments}" var="comment">
                        <div class="anime__review__item">
                            <div class="anime__review__item__pic">
                                <img src="<c:url value="/images/regift.gif" />" alt="">
                            </div>
                            <div class="anime__review__item__text">
                                <h6>${comment.user.fullname} - <span><fmt:formatDate value="${comment.dateComment}"
                                                                                     pattern="dd-MM-yyyy hh:mm"/></span>
                                </h6>
                                <p>${comment.content}</p>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="anime__details__form">
                    <div class="section-title">
                        <h5>Your Comment</h5>
                    </div>
                    <div>
                        <input type="text" placeholder="Your Comment" id="valueComment"
                               style="width: 100%; border-radius: 10px; padding-top: 20px; padding-bottom: 20px; padding-left: 5px"/>
                        <br/>
                        <button onclick="addComment()" class="btn btn-danger" style="margin-top: 10px"><i
                                class="fa fa-location-arrow"></i> Review
                        </button>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-4">
                <div class="anime__details__sidebar">
                    <div class="section-title">
                        <h5>Có thể bạn cũng thích...</h5>
                    </div>
                    <c:forEach var="related" items="${movieRelated}">
                        <div class="product__sidebar__view__item set-bg phimNgangItem"
                                <c:if test="${related.getBannerUrl() == 'http'}">
                                    data-setbg="<c:url value="${related.banner}"/>"
                                </c:if>
                                <c:if test="${related.getBannerUrl() != 'http'}">
                                    data-setbg="<c:url value="/images/banner/${related.banner}"/>"
                                </c:if>
                        >
                            <div class="ep">${related.quality} / ${related.quality}</div>
                            <div class="view"><i class="fa fa-eye"></i> ${related.views}</div>
                            <h5><a href="<c:url value="${urlReplated}${related.id}"/> ">${related.name}</a></h5>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</section>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    function oneStar() {
        setStar(1);
    }

    function twoStar() {
        setStar(2);
    }

    function threeStar() {
        setStar(3);
    }

    function fourStar() {
        setStar(4);
    }

    function fireStar() {
        setStar(5);
    }

    function setStar(star) {
        var movieId = document.getElementById('idMovieDetail').value;
        var path = window.location.pathname
        $.ajax({
            url: path + '/star-add?star=' + star + '&movieId=' + movieId,
            error: function () {
                console.log("error")
            },
            success: function (data) {
                var index = data.indexOf('@');
                var star = data.substring(0, index);
                var vote = data.substring(index + 1, data.length);
                console.log(star)
                console.log(vote)
                document.getElementById('avgstar').innerText = star
                document.getElementById('votess').innerText = vote + ' votes'
            },
            type: 'POST'
        });
    }

    function onLike() {
        var path = window.location.pathname + "?movie_id=" + document.getElementById('idMovieDetail').value;
        var lo = window.location.href;
        var phim = lo.substring(lo.lastIndexOf('/phim'), lo.length);
        $.ajax({
            url: path + '&action=like',
            error: function () {
                console.log("error")
            },
            success: function (data) {
                if (data === 'NOTLOGIN') {
                    document.getElementById('errorLike').style.display = 'unset'
                    document.getElementsByName('urlHistory')[0].value = phim;
                } else {
                    document.getElementById('btnLike').style.display = 'none';
                    document.getElementById('btnUnLike').style.display = 'unset';

                }
            },
            type: 'POST'
        });
    }

    function unLike() {
        var path = window.location.pathname + "?movie_id=" + document.getElementById('idMovieDetail').value;
        $.ajax({
            url: path + '&action=unLike',
            error: function () {
                console.log("error")
            },
            success: function () {
                document.getElementById('btnLike').style.display = 'unset';
                document.getElementById('btnUnLike').style.display = 'none';
            },
            type: 'POST'
        });
    }

    function addComment() {
        var path = window.location.pathname;
        var lo = window.location.href;
        var phim = lo.substring(lo.lastIndexOf('/phim'), lo.length);
        console.log(document.getElementById('valueComment').value);

        var content = document.getElementById('valueComment').value;
        $.ajax({
            url: path.substring(0, path.length - 5) + '/comment?movie_id=' + document.getElementById('idMovieDetail').value + '&content= ' + document.getElementById('valueComment').value,
            error: function () {
                console.log("error")
            },
            success: function (data) {
                if (data === 'NOTLOGIN') {
                    document.getElementById('errorLike').style.display = 'unset'
                    document.getElementsByName('urlHistory')[0].value = phim;
                } else {
                    console.log(data)
                    var intdex = data.lastIndexOf('@');
                    var name = data.substring(0, intdex);
                    var dateC = data.substring(intdex + 1, data.length)
                    var htmlCm = "<div class='anime__review__item'><div class='anime__review__item__pic'><img src='<c:url value='/images/regift.gif' />' alt=''> </div> <div class='anime__review__item__text'> <h6>" + name + " - <span>" + dateC + "</span></h6> <p>" + content + "</p> </div> </div>";
                    document.getElementById('divComment').innerHTML = document.getElementById('divComment').innerHTML + htmlCm;
                }
            },
            type: 'POST'
        });
    }

    function onByMovie(price) {
        document.getElementById('swal2-html-container').innerText = 'Bạn có muốn thanh toán ' + price + 'vnđ' + ' cho bộ phim này?';
        document.getElementById('buyMovie').style.display = 'unset';
    }

    function closeByMovie() {
        document.getElementById('buyMovie').style.display = 'none';
    }

    function onByFalse(id) {
        document.getElementById('napNgayBuy').href += '?urlHistory=/phim?type=&id=' + id;
        document.getElementById('buyFalse').style.display = 'unset';
    }

    function cluseByFalse() {
        document.getElementById('buyFalse').style.display = 'none';
    }

    function closeByDone(){
        document.getElementById('buyDone').style.display = 'none';
    }

    function buyMovie() {
        closeByMovie();
        var movieId = document.getElementById('idMovieDetail').value;
        var price = document.getElementById('priceMovie').value;
        var path = window.location.pathname.substring(0, window.location.pathname.length - 5) + "/buy-movie?movieId=" + movieId + "&price=" + price;
        $.ajax({
            url: path,
            error: function () {
                console.log("error")
            },
            success: function (data) {
                if (data == 'khong_du_tien') {
                    onByFalse(movieId);
                } else {
                    document.getElementById('muaNgay').style.display = 'none';
                    document.getElementById('xemNgay').style.display = 'unset';
                    document.getElementById('buyDone').style.display = 'unset';
                }
            },
            type: 'POST'
        });

    }
</script>
</body>
</html>
