package com.movie.service;

import com.movie.entity.Movies;
import com.movie.entity.Slider;

import java.util.List;

public interface IMovieService {
    List<Movies> findByCategoryAndPage(String url, int pageIndex);
    List<Movies> findByCategory(String url);
    List<Movies> findByKeyword(String keyword);
    List<Movies> findByKeywordAndPage(String keyword, int pageIndex);
    Movies findByid(int id);
    Movies findMovieVipByUser(int userId, int movieId);
    Movies findMovieByProperties(String name, String thumbnail, String banner, String actor);
    void update(Movies movies);
    void insert(Movies movies);
    void delete(Movies movies);
    List<Movies> findBySlider();
    List<Movies> findMovieTopLike();
    List<Movies> findMovieNew();
    List<Movies> findAll();
    List<Movies> findMovieRelated(String url, int id);
    List<Movies> findMovieHis(String his);
    List<Movies> findMovieByUserLike(int id, int pageIndex);
    List<Movies> countMovieByUserLike(int id);
}
