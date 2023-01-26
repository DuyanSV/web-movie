package com.movie.service;

import com.movie.entity.MovieDetail;

import java.util.List;

public interface IMovieDetailService {
    List<MovieDetail> findByMovieId(int id);
    void insert(MovieDetail movieDetail);
    void delete(MovieDetail movieDetail);
}
