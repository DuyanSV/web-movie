package com.movie.action.admin;

import com.movie.entity.*;
import com.movie.service.ICategoryItemMovieService;
import com.movie.service.IMovieDetailService;
import com.movie.service.IMovieService;
import com.movie.service.impl.CategoryItemService;
import com.movie.utils.SessionUtil;
import org.apache.commons.beanutils.BeanUtils;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@javax.servlet.annotation.MultipartConfig
public class MovieAction {
    @Inject
    private CategoryItemService categoryItemService;

    @Inject
    private ICategoryItemMovieService categoryItemMovieService;

    @Inject
    private IMovieService movieService;

    @Inject
    private IMovieDetailService movieDetailService;

    public void addMovie(HttpServletRequest req) throws ServletException, IOException {
        String pathBanner = req.getServletContext().getRealPath("/images/banner");
        File dirBanner = new File(pathBanner);
        if (!dirBanner.exists()) {
            dirBanner.mkdirs();
        }
        String pathThumbnail = req.getServletContext().getRealPath("/images/thumnail");
        File dirThumbnail = new File(pathThumbnail);
        if (!dirThumbnail.exists()) {
            dirThumbnail.mkdirs();
        }
        Part banner = req.getPart("banner");
        File bannerFile = new File(dirBanner, banner.getSubmittedFileName());
        Part thumbnail = req.getPart("thumbnail");
        File thumbnailFile = new File(dirThumbnail, thumbnail.getSubmittedFileName());

        String dateAired1 = req.getParameter("dateAired1");
        String genre = req.getParameter("theLoaiOut");
        String bannerName = banner.getSubmittedFileName();
        String thumbnailName = thumbnail.getSubmittedFileName();
        UserEntity userEntity = (UserEntity) SessionUtil.getSession().getUser(req, "USER");
        Date now = new Date();
        Movies movies = new Movies();
        try {
            BeanUtils.populate(movies, req.getParameterMap());
            movies.setThumbnail(thumbnailName);
            movies.setBanner(bannerName);
            movies.setDateAired(new SimpleDateFormat("yyyy-MM-dd").parse(dateAired1));

            movies.setCreateBy(userEntity.getFullname());
            movies.setCreateDate(now);
            movieService.insert(movies);
        } catch (Exception e) {
            e.printStackTrace();
        }
        // add thể loại
        Movies moviesNew = movieService.findMovieByProperties(movies.getName(), movies.getThumbnail(), movies.getBanner(), movies.getActor());
        String urlList = genre.substring(2, genre.length());
        urlList = urlList + "'";
        List<CategoryItem> categoryItemList = categoryItemService.findCategoryItemByUrlList(urlList);
        for(CategoryItem categoryItem : categoryItemList){
            CategoryItemMovie categoryItemMovie = new CategoryItemMovie(categoryItem, moviesNew);
            categoryItemMovieService.insert(categoryItemMovie);
        }
        // lưu file ảnh
        banner.write(bannerFile.getAbsolutePath());
        thumbnail.write(thumbnailFile.getAbsolutePath());
    }

    public void addEpisode(HttpServletRequest req, String movieId){
        Movies movies = movieService.findByid(Integer.parseInt(movieId));
        String episode = req.getParameter("episode");
        String url = req.getParameter("url");
        MovieDetail movieDetail = new MovieDetail(movies, Integer.parseInt(episode), url);
        movieDetailService.insert(movieDetail);
    }

    public void editMovie(HttpServletRequest req){
        String dateAired1 = req.getParameter("dateAired1");
        Movies movies = new Movies();
        try {
            BeanUtils.populate(movies, req.getParameterMap());
            Movies movieOld = movieService.findByid(movies.getId());
            movies.setCreateDate(movieOld.getCreateDate());
            movies.setThumbnail(movieOld.getThumbnail());
            movies.setBanner(movieOld.getBanner());
            movies.setViews(movieOld.getViews());
            movies.setCreateBy(movieOld.getCreateBy());
            movies.setDateAired(new SimpleDateFormat("yyyy-MM-dd").parse(dateAired1));
            String banner = req.getPart("banner").getSubmittedFileName();
            String thumbnail = req.getPart("thumbnail").getSubmittedFileName();
            if(!banner.isEmpty()){  //kiểm tra thay đổi banner không
                String pathBanner = req.getServletContext().getRealPath("/images/banner");
                File dirBanner = new File(pathBanner);
                if (!dirBanner.exists()) {
                    dirBanner.mkdirs();
                }
                Part bannerPart = req.getPart("banner");
                File bannerFile = new File(dirBanner, banner);
                bannerPart.write(bannerFile.getAbsolutePath());
                movies.setBanner(banner);
            }
            if(!thumbnail.isEmpty()){  // kiểm tra thay đổi thumbnail không
                String pathThumbnail = req.getServletContext().getRealPath("/images/thumnail");
                File dirThumbnail = new File(pathThumbnail);
                if (!dirThumbnail.exists()) {
                    dirThumbnail.mkdirs();
                }
                Part thumbnailPart = req.getPart("thumbnail");
                File thumbnailFile = new File(dirThumbnail, thumbnail);
                thumbnailPart.write(thumbnailFile.getAbsolutePath());
                movies.setThumbnail(thumbnail);
            }
            // check thay đổi thể loại
            String genre = req.getParameter("theLoaiOut");
            String urlList = genre.substring(2, genre.length());
            urlList = urlList + "'";
            List<CategoryItem> categoryItemList = categoryItemService.findCategoryItemByMovieId(movies.getId());
            StringBuilder urlOld = new StringBuilder();
            if(categoryItemList != null){
                categoryItemList.forEach((categoryItem) -> {
                    urlOld.append("'" + categoryItem.getUrl() + "',");
                });
            } else {
                urlOld.append("truoc do chua them the loai");
            }
            String urlListOld = urlOld.toString().substring(0, urlOld.toString().length() - 1);
            if(!urlListOld.equals(urlList)){ // tiến hành cập nhật thể loại
                System.out.println("cap nhat the loai");
                List<CategoryItemMovie> categoryItemMovieList = categoryItemMovieService.findByMovieId(movies.getId());
                if(categoryItemMovieList != null){
                    for(CategoryItemMovie categoryItemMovie : categoryItemMovieList){
                        categoryItemMovieService.delete(categoryItemMovie);
                    }
                }
                List<CategoryItem> categoryItemList1 = categoryItemService.findCategoryItemByUrlList(urlList);
                for(CategoryItem categoryItem : categoryItemList1){
                    System.out.println(categoryItem.getCategoryName());
                    CategoryItemMovie categoryItemMovie = new CategoryItemMovie(categoryItem, movies);
                    categoryItemMovieService.insert(categoryItemMovie);
                }
            }
            movieService.update(movies);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteMovie(int id){
        List<CategoryItemMovie> categoryItemMovieList = categoryItemMovieService.findByMovieId(id);
        if(categoryItemMovieList != null){
            for(CategoryItemMovie categoryItemMovie : categoryItemMovieList){
                categoryItemMovieService.delete(categoryItemMovie);
            }
        }
        List<MovieDetail> movieDetailList = movieDetailService.findByMovieId(id);
        if(movieDetailList != null){
            for(MovieDetail movieDetail : movieDetailList){
                movieDetailService.delete(movieDetail);
            }
        }
        Movies movies = movieService.findByid(id);
        movieService.delete(movies);
    }


}
