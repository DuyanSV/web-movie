package com.movie.controller.web;

import com.movie.entity.Comments;
import com.movie.entity.Likes;
import com.movie.entity.Movies;
import com.movie.entity.UserEntity;
import com.movie.service.ICommentServie;
import com.movie.service.IMovieService;
import com.movie.utils.SessionUtil;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(urlPatterns = {"/comment"})
public class CommentController extends HttpServlet {
    @Inject
    private IMovieService movieService;

    @Inject
    private ICommentServie commentServie;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        String id = req.getParameter("movie_id");
        String content = req.getParameter("content");
        UserEntity user = (UserEntity) SessionUtil.getSession().getUser(req, "USER");
        System.out.println(id);
        System.out.println(content);
        if (user == null) {
            out.print("NOTLOGIN");
            System.out.println("not login");
        } else {
            if (content.trim().length() != 0) {
                System.out.println("add cm");
                Movies movies = movieService.findByid(Integer.parseInt(id));
                Date now = new Date();
                String dateCM = new SimpleDateFormat("dd-MM-yyyy hh:mm").format(now);
                Comments comments = new Comments(user, movies, content, now);
                commentServie.insert(comments);
                out.println(user.getFullname() + "@" + dateCM);
            }
        }
    }
}
