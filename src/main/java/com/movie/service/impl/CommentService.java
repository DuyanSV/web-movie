package com.movie.service.impl;

import com.movie.dao.ICommentDao;
import com.movie.entity.Comments;
import com.movie.service.ICommentServie;

import javax.inject.Inject;
import java.util.List;

public class CommentService implements ICommentServie {
    @Inject
    private ICommentDao commentDao;

    @Override
    public void insert(Comments comments) {
        commentDao.insert(comments);
    }

    @Override
    public List<Comments> findCommentsByMovie(int movieId) {
        return commentDao.findCommentsByMovie(movieId);
    }
}
