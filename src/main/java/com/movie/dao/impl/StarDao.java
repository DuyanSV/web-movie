package com.movie.dao.impl;

import com.movie.constant.MethodConstant;
import com.movie.dao.IStarDao;
import com.movie.entity.Star;

import java.util.List;

public class StarDao extends AbstractDao<Star> implements IStarDao {
    @Override
    public void insert(Star star) {
        excuteUpdate(star, MethodConstant.INSERT);
    }

    @Override
    public List<Star> avgStar(int movieId) {
        List<Star> list = excuteQuery("findStarByMovieId", Star.class, movieId);
        return list.isEmpty() ? null : list;
    }
}
