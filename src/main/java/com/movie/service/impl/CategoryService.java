package com.movie.service.impl;

import com.movie.dao.impl.CategoryDao;
import com.movie.entity.Category;
import com.movie.service.ICategoryService;

import javax.inject.Inject;
import java.util.List;

public class CategoryService implements ICategoryService {
    @Inject
    private CategoryDao categoryDao;

    @Override
    public List<Category> findAll() {
        return categoryDao.findAll();
    }

    @Override
    public void insert(Category category) {
        categoryDao.insert(category);
    }

    @Override
    public void update(Category category) {
        categoryDao.update(category);
    }

    @Override
    public void delete(Category category) {
        categoryDao.delete(category);
    }

    @Override
    public Category findById(int id) {
        return categoryDao.findById(id);
    }
}
