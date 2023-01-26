package com.movie.dao;

import com.movie.entity.MovieDetail;
import com.movie.entity.Movies;

import java.util.List;

public interface IMovieDetailDao extends GenegicDao<MovieDetail>{
    List<MovieDetail> findByMovieId(int id);
    void insert(MovieDetail movieDetail);
    void delete(MovieDetail movieDetail);
}
