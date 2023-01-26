package com.movie.controller.admin.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.movie.action.admin.MovieAction;
import com.movie.action.admin.MovieApiAction;
import com.movie.entity.Movies;
import com.movie.entity.UserEntity;
import com.movie.model.MovieApiModel;
import com.movie.utils.HttpUtil;
import com.movie.utils.SessionUtil;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

@WebServlet(urlPatterns = {"/api-admin-movie"})
public class MovieApi extends HttpServlet {
    @Inject
    private MovieApiAction movieApiAction;

    @Inject
    private MovieAction movieAction;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ObjectMapper objectMapper = new ObjectMapper();
        System.out.println("ok");
        req.setCharacterEncoding("utf-8");
        resp.setContentType("application/json");
        MovieApiModel movies = HttpUtil.of(req.getReader()).toModel(MovieApiModel.class);
        Date now = new Date();
        movies.setCreateBy("admin");
        movies.setCreateDate(now);
        objectMapper.writeValue(resp.getOutputStream(), movies);
//        movieApiAction.addMovie(movies);
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        Movies movies = HttpUtil.of(req.getReader()).toModel(Movies.class);
        movieAction.deleteMovie(movies.getId());
    }
}
