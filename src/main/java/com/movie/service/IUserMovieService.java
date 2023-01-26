package com.movie.service;

import com.movie.entity.UserMovie;

import java.util.List;

public interface IUserMovieService {
    void insert(UserMovie userMovie);
    List<UserMovie> findByUser(int userId);
    List<UserMovie> findAll();
}
