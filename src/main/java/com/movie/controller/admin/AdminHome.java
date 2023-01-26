package com.movie.controller.admin;

import com.movie.entity.UserMovie;
import com.movie.service.impl.UserMovieService;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/admin/trang-chu"})
public class AdminHome extends HttpServlet {
    @Inject
    private UserMovieService userMovieService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String view = "/views/admin/trangchu.jsp";
        List<UserMovie> userMovies = userMovieService.findAll();
        req.setAttribute("usermovies", userMovies);
        RequestDispatcher rd = req.getRequestDispatcher(view);
        rd.forward(req, resp);
    }
}
