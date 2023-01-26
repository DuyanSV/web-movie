package com.movie.controller.web;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.movie.constant.SystemConstant;
import com.movie.dao.impl.MovieDao;
import com.movie.entity.*;
import com.movie.model.MovieHis;
import com.movie.model.MovieSearchModel;
import com.movie.service.*;
import com.movie.service.impl.LikeService;
import com.movie.service.impl.MovieService;
import com.movie.utils.CookieUtil;
import com.movie.utils.SessionUtil;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@WebServlet(urlPatterns = {"/phim", "/phim/search"})
public class MovieController extends HttpServlet {
    String view = "";

    @Inject
    private IMovieService movieService;

    @Inject
    private ICategoryItemService categoryItemService;

    @Inject
    private IMovieDetailService movieDetailService;

    @Inject
    private ILikeService likeService;

    @Inject
    private ICommentServie commentServie;

    @Inject
    private IStarService starService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String type = req.getParameter("type");
        String id = req.getParameter("id");
        if (id != null) {
            //page one movie
            Movies movie = movieService.findByid(Integer.parseInt(id));
            req.setAttribute("movie", movie);
            String action = req.getParameter("action");
            List<Integer> movieHisList = new ArrayList<>();
            boolean onLike = false;
            if (action != null && action.equals("watching")) {
                if(movie.getVip() == 1){
                    UserEntity userEntity = (UserEntity) SessionUtil.getSession().getUser(req,"USER");
                    if(userEntity == null){
                        String path = req.getServletPath();
                        String url = path + "?type=" + type + "&id=" + id;
                        resp.sendRedirect(req.getContextPath() + "/dang-nhap?messenge=movievip&urlHistory=" + url);
                        return;
                    } else {
                        Movies movieVip = movieService.findMovieVipByUser(userEntity.getId(), movie.getId());
                        if(movieVip == null){
                            resp.sendRedirect(req.getContextPath() + "/phim?type=" +type+ "&id=" +id);
                            return;
                        }
                    }
                }
                ObjectMapper objectMapper = new ObjectMapper();
                String movieHis = CookieUtil.getCookieUtil().get("MOVIEHIS", req);
                System.out.println("json: "+movieHis);
                if(movieHis != null){
                    movieHis = movieHis.replace("@",",");
                    movieHisList = Arrays.asList(objectMapper.readValue(movieHis, Integer[].class));
                }
                List<Integer> bbb = new ArrayList<>();
                for(Integer a : movieHisList){
                    bbb.add(a);
                }
                if (bbb.size() == 6) {
                    bbb.remove(0);
                }
                if(bbb.contains(Integer.parseInt(id))){
                    Integer a = Integer.valueOf(id);
                    bbb.remove(a);
                }
                bbb.add(Integer.parseInt(id));
                String aaa = objectMapper.writeValueAsString(bbb);
                int hour1 = 60 * 60 * 60 * 60;
                aaa = aaa.replace(",", "@");
                System.out.println(aaa);
                CookieUtil.getCookieUtil().add("MOVIEHIS", aaa, hour1, resp);
                // page movie watching
                String episode = req.getParameter("episode");
                int hour = 60 * 3;
                String idCookie = CookieUtil.getCookieUtil().get("ID", req);
                if (idCookie == null || !idCookie.equals(id)) {
                    CookieUtil.getCookieUtil().add("ID", id, hour, resp);
                    movie.setViews(movie.getViews() + 1);
                    movieService.update(movie);
                }
                int ep = episode == null ? 1 : Integer.parseInt(episode);
                List<MovieDetail> movieDetailList = movieDetailService.findByMovieId(Integer.parseInt(id));
                req.setAttribute("movieDetail", movieDetailList);
                List<Integer> listEpisode = new ArrayList<>();
                if (movieDetailList != null) {
                    for (int i = 1; i < movieDetailList.size() + 1; i++) {
                        listEpisode.add(i);
                    }
                    req.setAttribute("movieDetail", movieDetailList.get(ep - 1));
                }
                req.setAttribute("episode", ep);
                req.setAttribute("listEpisode", listEpisode);
                req.setAttribute("url", "/phim?type=" + type + "&id=" + id + "&action=" + action + "&episode=");
                view = "/views/web/movieWatching.jsp";
            } else {
                UserEntity user = (UserEntity) SessionUtil.getSession().getUser(req, "USER");
                if (user != null) {
                    Likes likes = likeService.findByUserAndMovie(user.getId(), movie.getId());
                    if (likes != null) {
                        onLike = true;
                    }
                }
                if(user != null){
                    if(movie.getVip() == 1){
                        Movies movieVip = movieService.findMovieVipByUser(user.getId(), movie.getId());
                        if(movieVip == null){
                            req.setAttribute("block","block");
                        }
                    }
                }
                // page one movie
                List<Star> listStar = starService.avgStar(Integer.parseInt(id));
                float sum = 0;
                if(listStar != null){
                    for(Star star : listStar){
                        sum += star.getStar();
                    }
                    req.setAttribute("star", sum/listStar.size());
                    req.setAttribute("votes", listStar.size());
                } else {
                    req.setAttribute("star", 0);
                    req.setAttribute("votes", 0);
                }
                StringBuilder theLoai = new StringBuilder();
                List<CategoryItem> categoryItemList = categoryItemService.findCategoryItemByMovieId(movie.getId());
                if(categoryItemList != null){
                    categoryItemList.forEach((categoryItem) -> {
                        theLoai.append(categoryItem.getCategoryName() + ", ");
                    });
                }
                String theLoaiOut = "";
                if(theLoai.toString().length() > 0){
                    theLoaiOut = theLoai.substring(0, theLoai.toString().length() - 2);
                }
                List<Movies> movieRelated = movieService.findMovieRelated(type, Integer.parseInt(id));
                List<Comments> comments = commentServie.findCommentsByMovie(movie.getId());
                req.setAttribute("onLike", onLike);
                req.setAttribute("comments", comments);
                req.setAttribute("movieRelated", movieRelated);
                req.setAttribute("urlReplated", "/phim?type=" + type + "&id=");
                req.setAttribute("theLoai", theLoaiOut);
                req.setAttribute("url", "/phim?type=" + type + "&id=" + id);
                view = "/views/web/movieDetail.jsp";
            }
        } else {
            // page list movie
            String page = req.getParameter("page");
            int pageIndex = 1;
            if (page != null) {
                pageIndex = Integer.parseInt(page);
            }
            List<Movies> countMovies = new ArrayList<>();
            float countMovie = 0;
            String search = req.getParameter("search");
            if (search != null) {
                countMovies = movieService.findByKeyword(search);
                if (countMovies != null) {
                    countMovie = countMovies == null ? 1 : countMovies.size();
                    List<Movies> listMovie = movieService.findByKeywordAndPage(search, pageIndex);
                    List<MovieSearchModel> listResult = new ArrayList<>();
                    listMovie.forEach((movie) -> {
                        listResult.add(new MovieSearchModel(movie, movie.getListCategoryItemMovies().get(0).getCategoryItem().getUrl()));
                    });
                    req.setAttribute("movies", listResult);
                    req.setAttribute("keyword", search);
                }
                view = "/views/web/movieSearch.jsp";
            } else {
                CategoryItem categoryItem = new CategoryItem();
                if (type.equals("phim-cua-ban")) {
                    UserEntity user = (UserEntity) SessionUtil.getSession().getUser(req, "USER");
                    categoryItem.setCategoryName("Phim mà bạn thích");
                    countMovies = movieService.countMovieByUserLike(user.getId());
                    countMovie = countMovies == null ? 1 : countMovies.size();
                    List<Movies> listMovie = movieService.findMovieByUserLike(user.getId(), pageIndex);
                    if (listMovie != null) {
                        req.setAttribute("movies", listMovie);
                    }
                } else {
                    categoryItem = categoryItemService.findCategoryItemByUrl(type);
                    countMovies = movieService.findByCategory(type);
                    countMovie = countMovies == null ? 1 : countMovies.size();
                    List<Movies> listMovie = movieService.findByCategoryAndPage(type, pageIndex);
                    if (listMovie != null) {
                        req.setAttribute("movies", listMovie);
                    }
                }
                req.setAttribute("category", categoryItem);
                req.setAttribute("type", type);
                req.setAttribute("url", "/phim?type=" + type + "&page=");
                view = "/views/web/movie.jsp";
            }
            float a = countMovie / Float.valueOf(SystemConstant.MAXPAGEPHIM);
            int b = (int) a;
            int countPage = a == b ? b : b + 1;
            List<Integer> listPage = new ArrayList<>();
            for (int i = 1; i < countPage + 1; i++) {
                listPage.add(i);
            }
            req.setAttribute("pageIndex", pageIndex);
            req.setAttribute("page", listPage);
        }
        RequestDispatcher rd = req.getRequestDispatcher(view);
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("movie_id");
        String action = req.getParameter("action");
        UserEntity user = (UserEntity) SessionUtil.getSession().getUser(req, "USER");
        PrintWriter out = resp.getWriter();
        if (action != null && action.equals("like")) {
            if (user == null) {
                out.print("NOTLOGIN");
            } else {
                Movies movies = movieService.findByid(Integer.parseInt(id));
                likeService.insert(new Likes(user, movies));
            }
        } else if (action != null && action.equals("unLike")) {
            Movies movie = movieService.findByid(Integer.parseInt(id));
            Likes likes = likeService.findByUserAndMovie(user.getId(), movie.getId());
            likeService.delete(likes);
        }

    }

}
