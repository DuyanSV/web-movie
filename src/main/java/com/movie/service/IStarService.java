package com.movie.service;

import com.movie.entity.Star;

import java.util.List;

public interface IStarService {
    void insert(Star star);
    List<Star> avgStar(int movieId);
}
