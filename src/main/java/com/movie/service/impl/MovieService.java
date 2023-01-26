package com.movie.service.impl;

import com.movie.constant.SystemConstant;
import com.movie.dao.impl.MovieDao;
import com.movie.entity.Movies;
import com.movie.model.PageModel;
import com.movie.service.IMovieService;

import javax.inject.Inject;
import java.util.List;

public class MovieService implements IMovieService {
    @Inject
    private MovieDao movieDao;

    @Override
    public List<Movies> findByCategoryAndPage(String url, int pageIndex) {
        PageModel.getPageModel().setMaxPage(SystemConstant.MAXPAGEPHIM);
        PageModel.getPageModel().setPageIndex(pageIndex);
        return movieDao.findByCategoryAndPage(url, PageModel.getPageModel());
    }

    @Override
    public List<Movies> findByCategory(String url) {
        return movieDao.findByCategory(url);
    }

    @Override
    public List<Movies> findByKeyword(String keyword) {
        keyword = "%" + keyword + "%";
        return movieDao.findByKeyword(keyword);
    }

    @Override
    public List<Movies> findByKeywordAndPage(String keyword, int pageIndex) {
        PageModel.getPageModel().setMaxPage(SystemConstant.MAXPAGEPHIM);
        PageModel.getPageModel().setPageIndex(pageIndex);
        keyword = "%" + keyword + "%";
        return movieDao.findByKeywordAndPage(keyword, PageModel.getPageModel());
    }

    @Override
    public Movies findByid(int id) {
        return movieDao.findById(id);
    }

    @Override
    public Movies findMovieVipByUser(int userId, int movieId) {
        return movieDao.findMovieVipByUser(userId, movieId);
    }

    @Override
    public Movies findMovieByProperties(String name, String thumbnail, String banner, String actor) {
        return movieDao.findMovieByProperties(name, thumbnail, banner, actor);
    }

    @Override
    public void update(Movies movies) {
        movieDao.update(movies);
    }

    @Override
    public void insert(Movies movies) {
        movieDao.insert(movies);
    }

    @Override
    public void delete(Movies movies) {
        movieDao.delete(movies);
    }

    @Override
    public List<Movies> findBySlider() {
        List<Movies> moviesList = movieDao.findBySlider();
        return moviesList;
    }

    @Override
    public List<Movies> findMovieTopLike() {
        return movieDao.findMovieTopLike();
    }

    @Override
    public List<Movies> findMovieNew() {
        return movieDao.findMovieNew();
    }

    @Override
    public List<Movies> findAll() {
        return movieDao.findAll();
    }

    @Override
    public List<Movies> findMovieRelated(String url, int id) {
        List<Movies> moviesList = movieDao.findMovieRelated(url, id);
        return moviesList;
    }

    @Override
    public List<Movies> findMovieHis(String his) {
        return movieDao.findMovieHis(his);
    }

    @Override
    public List<Movies> findMovieByUserLike(int id, int pageIndex) {
        PageModel.getPageModel().setMaxPage(SystemConstant.MAXPAGEPHIM);
        PageModel.getPageModel().setPageIndex(pageIndex);
        return movieDao.findMovieByUserLike(id, PageModel.getPageModel());
    }

    @Override
    public List<Movies> countMovieByUserLike(int id) {
        return movieDao.countMovieByUserLike(id);
    }
}
