package com.movie.utils;

import com.movie.constant.SystemConstant;
import com.movie.dao.impl.MovieDao;
import com.movie.entity.Category;
import com.movie.entity.CategoryItem;
import com.movie.entity.Movies;
import com.movie.model.DanhMucModel;
import com.movie.model.PageModel;
import com.movie.service.ICategoryItemService;
import com.movie.service.ICategoryService;
import com.movie.service.IMovieService;
import com.movie.service.IUserService;
import com.movie.service.impl.CategoryItemService;
import com.movie.service.impl.MovieService;

import javax.inject.Inject;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class InitMenu implements Filter {
    public static List<DanhMucModel> danhMucModelList = new ArrayList<>();

    @Inject
    private ICategoryService categoryService;

    @Inject
    private CategoryItemService categoryItemService;

    private ServletContext servletContext;
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.servletContext = filterConfig.getServletContext();
    }

    @Inject
    private IMovieService movieService;

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest rq = (HttpServletRequest) servletRequest;
        HttpServletResponse rp = (HttpServletResponse) servletResponse;
        String urlRq = rq.getRequestURI();
        if (urlRq.contains("/admin")) {
            filterChain.doFilter(servletRequest, servletResponse);
        } else {
            if(danhMucModelList.size() == 0){
                List<Category> listCategory = categoryService.findAll();
                listCategory.forEach((category) -> {
                    List<CategoryItem> listCategoryItem = categoryItemService.findCategoryItemByIdCategory(category.getId());
                    danhMucModelList.add(new DanhMucModel(category, listCategoryItem));
                });
            }
            servletRequest.setAttribute("listDanhMuc", danhMucModelList);
            filterChain.doFilter(servletRequest, servletResponse);
        }
    }

    @Override
    public void destroy() {

    }
}
