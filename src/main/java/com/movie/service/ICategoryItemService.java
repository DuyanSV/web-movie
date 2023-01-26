package com.movie.service;

import com.movie.entity.CategoryItem;

import java.util.List;

public interface ICategoryItemService {
    List<CategoryItem> findCategoryItemByIdCategory(int id);
    CategoryItem findCategoryItemByUrl(String url);
    List<CategoryItem> findCategoryItemByMovieId(int id);
    void updateCategoryItem(CategoryItem categoryItem);
    void deleteCategoryItem(CategoryItem categoryItem);
    CategoryItem findCategoryItemById(int id);
    void insertCategoryItem(CategoryItem categoryItem);
    List<CategoryItem> findAll();
    List<CategoryItem> findCategoryItemByUrlList(String url);
}
