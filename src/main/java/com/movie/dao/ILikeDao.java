package com.movie.dao;

import com.movie.entity.Likes;

import java.util.List;

public interface ILikeDao extends GenegicDao<Likes>{
    Likes findLikeByUserAndMovie(int userId, int movieId);
    List<Likes> findLikeByMovie(int movieId);
    void insert(Likes likes);
    void delete(Likes likes);
}
