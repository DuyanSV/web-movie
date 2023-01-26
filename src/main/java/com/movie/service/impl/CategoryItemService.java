package com.movie.service.impl;

import com.movie.dao.ICategoryItemDao;
import com.movie.entity.CategoryItem;
import com.movie.service.ICategoryItemService;

import javax.inject.Inject;
import java.util.List;

public class CategoryItemService implements ICategoryItemService {
    @Inject
    private ICategoryItemDao categoryItemDao;

    @Override
    public List<CategoryItem> findCategoryItemByIdCategory(int id) {
        return categoryItemDao.findCategoryItemByIdCategory(id);
    }

    @Override
    public CategoryItem findCategoryItemByUrl(String url) {
        return categoryItemDao.findCategoryItemByUrl(url);
    }

    @Override
    public List<CategoryItem> findCategoryItemByMovieId(int id) {
        return categoryItemDao.findCategoryItemByMovieId(id);
    }

    @Override
    public void updateCategoryItem(CategoryItem categoryItem) {
        categoryItemDao.updateCategoryItem(categoryItem);
    }

    @Override
    public void deleteCategoryItem(CategoryItem categoryItem) {
        categoryItemDao.deleteCategoryItem(categoryItem);
    }

    @Override
    public CategoryItem findCategoryItemById(int id) {
        return categoryItemDao.findCategoryItemById(id);
    }

    @Override
    public void insertCategoryItem(CategoryItem categoryItem) {
        categoryItemDao.insertCategoryItem(categoryItem);
    }

    @Override
    public List<CategoryItem> findAll() {
        return categoryItemDao.findAll();
    }

    @Override
    public List<CategoryItem> findCategoryItemByUrlList(String url) {
        return categoryItemDao.findCategoryItemByUrlList(url);
    }
}
