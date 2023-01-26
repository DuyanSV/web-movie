package com.movie.controller.web;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.movie.entity.CategoryItem;
import com.movie.entity.Movies;
import com.movie.model.SliderModel;
import com.movie.service.ICategoryItemService;
import com.movie.service.IMovieService;
import com.movie.utils.CookieUtil;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

@WebServlet(urlPatterns = {"/trang-chu"})
public class WebHome extends HttpServlet {
    @Inject
    private IMovieService movieService;

    @Inject
    private ICategoryItemService categoryItemService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String view = "/views/web/trangchu.jsp";
        String status = req.getParameter("status");

        List<Movies> moviesList = movieService.findBySlider();
        List<Movies> moviesTopLike = movieService.findMovieTopLike();
        if (moviesTopLike != null) {
            req.setAttribute("movieTopLike", moviesTopLike);
        }
        List<Movies> moviesNew = movieService.findMovieNew();
        if (moviesNew != null) {
            req.setAttribute("movieNew", moviesNew);
        }
        if (status != null && status.equals("login-success")) {
            req.setAttribute("messengeSuccess", "Đăng nhập thành công!");
        }
        List<String> listType = new ArrayList<>();
        moviesList.forEach((movie) -> {
            List<CategoryItem> categoryItemList = categoryItemService.findCategoryItemByMovieId(movie.getId());
            listType.add(categoryItemList.get(0).getUrl());
        });
        List<SliderModel> sliderList = new ArrayList<>();
        for (int i = 0; i < moviesList.size(); i++) {
            sliderList.add(new SliderModel(moviesList.get(i), listType.get(i)));
        }
        ObjectMapper objectMapper = new ObjectMapper();
        String movieHis = CookieUtil.getCookieUtil().get("MOVIEHIS", req);
//        movieHis = movieHis.substring(1, movieHis.length() - 1);
//        List<Movies> hiss = movieService.findMovieHis(movieHis);
//        System.out.println(hiss.size());
        if(movieHis != null && movieHis.length() > 0){
            movieHis = movieHis.replace("@", ",");
            List<Integer> his = Arrays.asList(objectMapper.readValue(movieHis, Integer[].class));
            Collections.reverse(his);
            List<Movies> moviesListHis = new ArrayList<>();
            for(Integer a : his){
                moviesListHis.add(movieService.findByid(a));
            }
            req.setAttribute("movieHis", moviesListHis);
        }
        req.setAttribute("slider", sliderList);
        RequestDispatcher rd = req.getRequestDispatcher(view);
        rd.forward(req, resp);
    }
}
