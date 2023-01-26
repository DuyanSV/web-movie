package com.movie.service.impl;

import com.movie.dao.ICategoryItemMovieDao;
import com.movie.entity.CategoryItemMovie;
import com.movie.service.ICategoryItemMovieService;

import javax.inject.Inject;
import java.util.List;

public class CategoryItemMovieService implements ICategoryItemMovieService {
    @Inject
    private ICategoryItemMovieDao categoryItemMovieDao;

    @Override
    public void insert(CategoryItemMovie categoryItemMovie) {
        categoryItemMovieDao.insert(categoryItemMovie);
    }

    @Override
    public void delete(CategoryItemMovie categoryItemMovie) {
        categoryItemMovieDao.delete(categoryItemMovie);
    }

    @Override
    public List<CategoryItemMovie> findByMovieId(int id) {
        return categoryItemMovieDao.findByMovieId(id);
    }

    @Override
    public List<CategoryItemMovie> findByIdCategoryItem(int id) {
        return categoryItemMovieDao.findByIdCategoryItem(id);
    }
}
