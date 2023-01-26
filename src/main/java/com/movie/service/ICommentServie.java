package com.movie.service;

import com.movie.entity.Comments;

import java.util.List;

public interface ICommentServie {
    void insert(Comments comments);
    List<Comments> findCommentsByMovie(int movieId);
}
