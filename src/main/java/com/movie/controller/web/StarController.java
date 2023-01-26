package com.movie.controller.web;

import com.movie.entity.Movies;
import com.movie.entity.Star;
import com.movie.service.impl.MovieService;
import com.movie.service.impl.StarService;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(urlPatterns = {"/phim/star-add"})
public class StarController extends HttpServlet {
    @Inject
    private MovieService movieService;

    @Inject
    private StarService starService;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String movieId = req.getParameter("movieId");
        PrintWriter out = resp.getWriter();
        String star = req.getParameter("star");
        Movies movies = movieService.findByid(Integer.parseInt(movieId));
        Star starNew = new Star(movies, Integer.parseInt(star));
        starService.insert(starNew);
        List<Star> listStar = starService.avgStar(Integer.parseInt(movieId));
        float sum = 0;
        for (Star stars : listStar) {
            sum += stars.getStar();
        }
        String a = String.format("%.1f", sum/listStar.size());
        out.print(a +"@"+ listStar.size());
    }
}
