package com.movie.dao;

import com.movie.entity.CategoryItemMovie;

import java.util.List;

public interface ICategoryItemMovieDao extends GenegicDao<CategoryItemMovie>{
    void insert(CategoryItemMovie categoryItemMovie);
    void delete(CategoryItemMovie categoryItemMovie);
    List<CategoryItemMovie> findByMovieId(int id);
    List<CategoryItemMovie> findByIdCategoryItem(int id);
}
