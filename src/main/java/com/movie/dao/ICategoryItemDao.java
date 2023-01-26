package com.movie.dao;

import com.movie.entity.CategoryItem;

import java.util.List;

public interface ICategoryItemDao extends GenegicDao<CategoryItem>{
    List<CategoryItem> findCategoryItemByIdCategory(int id);
    CategoryItem findCategoryItemByUrl(String url);
    List<CategoryItem> findCategoryItemByMovieId(int id);
    void updateCategoryItem(CategoryItem categoryItem);
    void insertCategoryItem(CategoryItem categoryItem);
    void deleteCategoryItem(CategoryItem categoryItem);
    CategoryItem findCategoryItemById(int id);
    List<CategoryItem> findAll();
    List<CategoryItem> findCategoryItemByUrlList(String url);
}
