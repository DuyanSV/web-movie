package com.movie.service.impl;

import com.movie.dao.impl.MovieDetailDao;
import com.movie.entity.MovieDetail;
import com.movie.service.IMovieDetailService;

import javax.inject.Inject;
import java.util.List;

public class MovieDetailService implements IMovieDetailService {
    @Inject
    private MovieDetailDao movieDetailDao;

    @Override
    public List<MovieDetail> findByMovieId(int id) {
        return movieDetailDao.findByMovieId(id);
    }

    @Override
    public void insert(MovieDetail movieDetail) {
        movieDetailDao.insert(movieDetail);
    }

    @Override
    public void delete(MovieDetail movieDetail) {
        movieDetailDao.delete(movieDetail);
    }
}
