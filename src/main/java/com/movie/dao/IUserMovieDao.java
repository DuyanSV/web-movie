package com.movie.dao;

import com.movie.entity.UserMovie;

import java.util.List;

public interface IUserMovieDao extends GenegicDao<UserMovie>{
    void insert(UserMovie userMovie);
    List<UserMovie> findByUser(int userId);
    List<UserMovie> findAll();
}
