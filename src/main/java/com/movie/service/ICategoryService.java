package com.movie.service;

import com.movie.entity.Category;

import java.util.List;

public interface ICategoryService {
    List<Category> findAll();
    void insert(Category category);
    void update(Category category);
    void delete(Category category);
    Category findById(int id);
}
