package com.movie.dao.impl;

import com.movie.constant.MethodConstant;
import com.movie.dao.ICategoryDao;
import com.movie.entity.Category;

import java.util.List;

public class CategoryDao extends AbstractDao<Category> implements ICategoryDao {
    @Override
    public List<Category> findAll() {
        List<Category> listCategories = excuteQuery("findAllCategory", Category.class);
        return listCategories.isEmpty() ? null :listCategories;
    }

    @Override
    public void insert(Category category) {
        excuteUpdate(category, MethodConstant.INSERT);
    }

    @Override
    public void update(Category category) {
        excuteUpdate(category, MethodConstant.UPDATE);
    }

    @Override
    public void delete(Category category) {
        excuteUpdate(category, MethodConstant.DELETE);
    }

    @Override
    public Category findById(int id) {
        return em.find(Category.class, id);
    }
}
