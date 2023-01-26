package com.movie.dao;

import com.movie.entity.Star;

import java.util.List;

public interface IStarDao extends GenegicDao<Star>{
    void insert(Star star);
    List<Star> avgStar(int movieId);
}
