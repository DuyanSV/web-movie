package com.movie.service;

import com.movie.entity.CategoryItemMovie;

import java.util.List;

public interface ICategoryItemMovieService {
    void insert(CategoryItemMovie categoryItemMovie);
    void delete(CategoryItemMovie categoryItemMovie);
    List<CategoryItemMovie> findByMovieId(int id);
    List<CategoryItemMovie> findByIdCategoryItem(int id);
}
