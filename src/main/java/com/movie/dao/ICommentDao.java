package com.movie.dao;

import com.movie.entity.Comments;

import java.util.List;

public interface ICommentDao extends GenegicDao<Comments>{
    void insert(Comments comments);
    List<Comments> findCommentsByMovie(int movieId);
}
