package com.movie.dao.impl;

import com.movie.constant.MethodConstant;
import com.movie.dao.ICommentDao;
import com.movie.entity.Comments;
import com.movie.entity.Likes;

import java.util.List;

public class CommentDao extends AbstractDao<Comments> implements ICommentDao {
    @Override
    public void insert(Comments comments) {
        excuteUpdate(comments, MethodConstant.INSERT);
    }

    @Override
    public List<Comments> findCommentsByMovie(int movieId) {
        List<Comments> list = excuteQuery("findCommentByMovie",Comments.class, movieId);
        return list.isEmpty() ? null : list;
    }
}
