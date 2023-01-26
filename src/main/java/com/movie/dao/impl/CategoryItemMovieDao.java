package com.movie.dao.impl;

import com.movie.constant.MethodConstant;
import com.movie.dao.ICategoryItemMovieDao;
import com.movie.entity.CategoryItem;
import com.movie.entity.CategoryItemMovie;

import java.util.List;

public class CategoryItemMovieDao extends AbstractDao<CategoryItemMovie> implements ICategoryItemMovieDao {
    @Override
    public void insert(CategoryItemMovie categoryItemMovie) {
        excuteUpdate(categoryItemMovie, MethodConstant.INSERT);
    }

    @Override
    public void delete(CategoryItemMovie categoryItemMovie) {
        excuteUpdate(categoryItemMovie, MethodConstant.DELETE);
    }

    @Override
    public List<CategoryItemMovie> findByMovieId(int id) {
        List<CategoryItemMovie> list = excuteQuery("findCategoryItemByIdMovie", CategoryItemMovie.class, id);
        return list.isEmpty() ? null : list;
    }

    @Override
    public List<CategoryItemMovie> findByIdCategoryItem(int id) {
        List<CategoryItemMovie> list = excuteQuery("findByIdCategoryItem", CategoryItemMovie.class, id);
        return list.isEmpty() ? null : list;
    }
}
