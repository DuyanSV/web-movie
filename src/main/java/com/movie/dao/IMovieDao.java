package com.movie.dao;

import com.movie.entity.Movies;
import com.movie.model.PageModel;

import java.util.List;

public interface IMovieDao extends GenegicDao<Movies>{
    void update(Movies movies);
    void insert(Movies movies);
    void delete(Movies movies);
    List<Movies> findByCategoryAndPage(String url, PageModel pageModel);
    List<Movies> findByCategory(String url);
    List<Movies> findByKeyword(String keyword);
    List<Movies> findByKeywordAndPage(String keyword, PageModel pageModel);
    Movies findById(int id);
    Movies findMovieVipByUser(int userId, int movieId);
    Movies findMovieByProperties(String name, String thumbnail, String banner, String actor);
    List<Movies> findBySlider();
    List<Movies> findMovieTopLike();
    List<Movies> findAll();
    List<Movies> findTopView();
    List<Movies> findMovieNew();
    List<Movies> findMovieRelated(String url, int id);
    List<Movies> findMovieHis(String his);
    List<Movies> findMovieByUserLike(int id, PageModel pageModel);
    List<Movies> countMovieByUserLike(int id);
}
