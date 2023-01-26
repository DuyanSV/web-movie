package com.movie.service.impl;

import com.movie.dao.impl.UserMovieDao;
import com.movie.entity.UserMovie;
import com.movie.service.IUserMovieService;

import javax.inject.Inject;
import java.util.List;

public class UserMovieService implements IUserMovieService {
    @Inject
    private UserMovieDao userMovieDao;

    @Override
    public void insert(UserMovie userMovie) {
        userMovieDao.insert(userMovie);
    }

    @Override
    public List<UserMovie> findByUser(int userId) {
        return userMovieDao.findByUser(userId);
    }

    @Override
    public List<UserMovie> findAll() {
        return userMovieDao.findAll();
    }
}
