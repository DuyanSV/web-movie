package com.movie.service;

import com.movie.entity.Likes;

import java.util.List;

public interface ILikeService {
    Likes findByUserAndMovie(int userId, int movieId);
    List<Likes> findByMovie(int movieId);
    void insert(Likes likes);
    void delete(Likes likes);
}
