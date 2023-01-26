package com.movie.dao;

import com.movie.entity.Category;

import java.util.List;

public interface ICategoryDao extends GenegicDao<Category>{
    List<Category> findAll();
    void insert(Category category);
    void update(Category category);
    void delete(Category category);
    Category findById(int id);
}
