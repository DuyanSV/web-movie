package com.movie.service.impl;

import com.movie.dao.impl.StarDao;
import com.movie.entity.Star;
import com.movie.service.IStarService;

import javax.inject.Inject;
import java.util.List;

public class StarService implements IStarService {
    @Inject
    private StarDao starDao;

    @Override
    public void insert(Star star) {
        starDao.insert(star);
    }

    @Override
    public List<Star> avgStar(int movieId) {
        return starDao.avgStar(movieId);
    }
}
