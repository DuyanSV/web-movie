package com.movie.dao.impl;

import com.movie.constant.MethodConstant;
import com.movie.dao.ILikeDao;
import com.movie.entity.Likes;
import com.movie.entity.Movies;

import java.util.List;

public class LikeDao extends AbstractDao<Likes> implements ILikeDao {
    @Override
    public Likes findLikeByUserAndMovie(int userId, int movieId) {
        List<Likes> list = excuteQuery("findLikeByUserAndMovie",Likes.class,userId, movieId);
        return list.isEmpty() ? null : list.get(0);
    }

    @Override
    public List<Likes> findLikeByMovie(int movieId) {
        List<Likes> list = excuteQuery("findLikeByMovie",Likes.class, movieId);
        return list.isEmpty() ? null : list;
    }

    @Override
    public void insert(Likes likes) {
        excuteUpdate(likes, MethodConstant.INSERT);
    }

    @Override
    public void delete(Likes likes) {
        excuteUpdate(likes, MethodConstant.DELETE);
    }
}
