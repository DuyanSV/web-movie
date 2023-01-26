package com.movie.dao.impl;

import com.movie.constant.MethodConstant;
import com.movie.dao.IUserMovieDao;
import com.movie.entity.Star;
import com.movie.entity.UserMovie;

import java.util.List;

public class UserMovieDao extends AbstractDao<UserMovie> implements IUserMovieDao {
    @Override
    public void insert(UserMovie userMovie) {
        excuteUpdate(userMovie, MethodConstant.INSERT);
    }

    @Override
    public List<UserMovie> findByUser(int userId) {
        List<UserMovie> list = excuteQuery("findVipBuyUser", UserMovie.class, userId);
        return list.isEmpty() ? null : list;
    }

    @Override
    public List<UserMovie> findAll() {
        String jpql = "select o from UserMovie o";
        List<UserMovie> list = excuteQuery2(jpql, UserMovie.class);
        return list.isEmpty() ? null : list;
    }
}
