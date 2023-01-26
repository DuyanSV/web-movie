package com.movie.service.impl;

import com.movie.dao.ILikeDao;
import com.movie.entity.Likes;
import com.movie.service.ILikeService;

import javax.inject.Inject;
import java.util.List;

public class LikeService implements ILikeService {
    @Inject
    private ILikeDao likeDao;

    @Override
    public Likes findByUserAndMovie(int userId, int movieId) {
        return likeDao.findLikeByUserAndMovie(userId, movieId);
    }

    @Override
    public List<Likes> findByMovie(int movieId) {
        return likeDao.findLikeByMovie(movieId);
    }

    @Override
    public void insert(Likes likes) {
        likeDao.insert(likes);
    }

    @Override
    public void delete(Likes likes) {
        likeDao.delete(likes);
    }
}
