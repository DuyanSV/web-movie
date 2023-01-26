package com.movie.dao.impl;

import com.movie.constant.MethodConstant;
import com.movie.dao.IMovieDetailDao;
import com.movie.entity.MovieDetail;

import java.util.List;

public class MovieDetailDao extends AbstractDao<MovieDetail> implements IMovieDetailDao {
    @Override
    public List<MovieDetail> findByMovieId(int id) {
        List<MovieDetail> list = excuteQuery("findMovieDetailByMovieId",MovieDetail.class,id);
        return list.isEmpty() ? null : list;
    }

    @Override
    public void insert(MovieDetail movieDetail) {
        excuteUpdate(movieDetail, MethodConstant.INSERT);
    }

    @Override
    public void delete(MovieDetail movieDetail) {
        excuteUpdate(movieDetail, MethodConstant.DELETE);
    }
}
