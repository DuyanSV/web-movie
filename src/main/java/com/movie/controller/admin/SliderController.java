package com.movie.controller.admin;

import com.movie.entity.Movies;
import com.movie.entity.Slider;
import com.movie.service.IMovieService;
import com.movie.service.ISliderService;
import org.apache.commons.beanutils.BeanUtils;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

@WebServlet(urlPatterns = {"/admin/slider", "/admin/slider/add", "/admin/slider/update", "/admin/slider/delete"})
public class SliderController extends HttpServlet {
    @Inject
    private ISliderService sliderService;

    @Inject
    private IMovieService movieService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String view = "/views/admin/slider.jsp";
        List<Slider> sliderList = sliderService.findAll();
        req.setAttribute("sliders", sliderList);
        RequestDispatcher rd = req.getRequestDispatcher(view);
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String movieId = req.getParameter("movie_id");
        String uri = req.getRequestURI();
        if (uri.contains("/admin/slider/add")) {
            PrintWriter out = resp.getWriter();
            Slider slider = sliderService.findByMovie(Integer.parseInt(movieId));
            if (slider != null) {
                out.print("EMPTY");
            } else {
                int max;
                List<Slider> sliderList = sliderService.findAll();
                if (sliderList != null) {
                    max = sliderList.get(sliderList.size() - 1).getStt();
                    Movies movies = movieService.findByid(Integer.parseInt(movieId));
                    Slider sliderNew = new Slider(movies, max + 1);
                    sliderService.insert(sliderNew);
                    out.println("SUCCESS");
                }
            }
        } else if (uri.contains("/admin/slider/update")) {
            String index = req.getParameter("index");
            String id = req.getParameter("id");
            Slider slider = sliderService.findByStt(Integer.parseInt(index));
            if (slider != null) {
                String indexOld = req.getParameter("indexOld");
                slider.setStt(Integer.parseInt(indexOld));
                sliderService.update(slider);

            }
            Slider sliderUpdate = sliderService.findById(Integer.parseInt(id));
            sliderUpdate.setStt(Integer.parseInt(index));
            sliderService.update(sliderUpdate);
            resp.sendRedirect(req.getContextPath() + "/admin/slider?status=update_success");
            return;
        } else if (uri.contains("/admin/slider/delete")) {
            Slider slider = sliderService.findById(Integer.parseInt(req.getParameter("id")));
            sliderService.delete(slider);
            resp.sendRedirect(req.getContextPath() + "/admin/slider?status=delete_success");
            return;
        }
    }
}
