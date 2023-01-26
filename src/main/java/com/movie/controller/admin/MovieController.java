package com.movie.controller.admin;

import com.movie.action.admin.MovieAction;
import com.movie.entity.CategoryItem;
import com.movie.entity.MovieDetail;
import com.movie.entity.Movies;
import com.movie.entity.UserEntity;
import com.movie.service.ICategoryItemService;
import com.movie.service.IMovieDetailService;
import com.movie.service.IMovieService;
import com.movie.utils.SessionUtil;
import org.apache.commons.beanutils.BeanUtils;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet(urlPatterns = {"/admin/phim", "/admin/phim/add", "/admin/phim/edit","/admin/phim/delete","/admin/phim/add_episode"})
@javax.servlet.annotation.MultipartConfig
public class MovieController extends HttpServlet {
    @Inject
    private IMovieService movieService;

    @Inject
    private ICategoryItemService categoryItemService;

    @Inject
    private MovieAction movieAction;

    @Inject
    private IMovieDetailService movieDetailService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String view = "";
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        String uri = req.getRequestURI();
        if (uri.contains("/admin/phim/add")) {
            List<CategoryItem> categoryItemList = categoryItemService.findAll();
            req.setAttribute("categoryItem", categoryItemList);
            view = "/views/admin/addMovie.jsp";
        } else {
            String id = req.getParameter("movie_id");
            String action = req.getParameter("action");
            if (id != null && action != null && action.equals("edit_episode")) {
                List<MovieDetail> movieDetailList = movieDetailService.findByMovieId(Integer.parseInt(id));
                req.setAttribute("movieDetails", movieDetailList);
                req.setAttribute("movieId", id);
                view = "/views/admin/danhsachtap.jsp";
            } else if (id != null && action != null && action.equals("edit_movie")) {
                Movies movies = movieService.findByid(Integer.parseInt(id));
                req.setAttribute("movie", movies);

                StringBuilder theLoai = new StringBuilder();
                StringBuilder genre = new StringBuilder();
                List<CategoryItem> categoryItemList = categoryItemService.findCategoryItemByMovieId(movies.getId());
                if(categoryItemList != null){
                    categoryItemList.forEach((categoryItem) -> {
                        theLoai.append(categoryItem.getCategoryName() + "\n");
                        genre.append("','" + categoryItem.getUrl());
                    });
                } else {
                    theLoai.append("");
                    genre.append("");
                }
                List<CategoryItem> categoryItemList1 = categoryItemService.findAll();
                req.setAttribute("categoryItem", categoryItemList1);
                req.setAttribute("theloai", theLoai);
                req.setAttribute("genre", genre);
                view = "/views/admin/editMovie.jsp";
            } else {
                String status = req.getParameter("status");
                if (status != null && status.equals("insert_success")) {
                    req.setAttribute("messengeSuccess", "Thêm phim thành công!");
                }
                if (status != null && status.equals("update_success")) {
                    req.setAttribute("messengeSuccess", "Cập nhật phim thành công!");
                }
                if (status != null && status.equals("delete_success")) {
                    req.setAttribute("messengeSuccess", "Xoá phim thành công!");
                }
                view = "/views/admin/movie.jsp";
            }
        }
        List<Movies> movieList = movieService.findAll();
        req.setAttribute("movies", movieList);
        RequestDispatcher rd = req.getRequestDispatcher(view);
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        String view = "";
        String uri = req.getRequestURI();
        if (uri.contains("/admin/phim/add_episode")) {
            String movieId = req.getParameter("movieId");
            movieAction.addEpisode(req, movieId);
            resp.sendRedirect(req.getContextPath() + "/admin/phim?movie_id=" + movieId + "&action=edit_episode");
            return;
        } else if (uri.contains("/admin/phim/add")) {
            movieAction.addMovie(req);
            resp.sendRedirect(req.getContextPath() + "/admin/phim?status=insert_success");
            return;
        } else if (uri.contains("/admin/phim/edit")) {
            movieAction.editMovie(req);
            resp.sendRedirect(req.getContextPath() + "/admin/phim?status=update_success");
            return;
        } else if (uri.contains("/admin/phim/delete")) {
            int id = Integer.parseInt(req.getParameter("movieId"));
            movieAction.deleteMovie(id);
            resp.sendRedirect(req.getContextPath() + "/admin/phim?status=delete_success");
            return;
        } else {
            List<Movies> movieList = movieService.findAll();
            req.setAttribute("movies", movieList);
        }
        RequestDispatcher rd = req.getRequestDispatcher(view);
        rd.forward(req, resp);
    }
}
