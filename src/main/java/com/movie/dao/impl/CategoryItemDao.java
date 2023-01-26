package com.movie.dao.impl;

import com.movie.constant.MethodConstant;
import com.movie.dao.ICategoryItemDao;
import com.movie.entity.CategoryItem;

import java.util.List;

public class CategoryItemDao extends AbstractDao<CategoryItem> implements ICategoryItemDao {

    @Override
    public List<CategoryItem> findCategoryItemByIdCategory(int id) {
        List<CategoryItem> list = excuteQuery("findCategoryItemByIdCategory", CategoryItem.class, id);
        return list.isEmpty() ? null : list;
    }

    @Override
    public CategoryItem findCategoryItemByUrl(String url) {
        List<CategoryItem> list = excuteQuery("findCategoryItemByUrl", CategoryItem.class, url);
        return list.isEmpty() ? null : list.get(0);
    }

    @Override
    public List<CategoryItem> findCategoryItemByMovieId(int id) {
        List<CategoryItem> list = excuteQuery("findCategoryItemByMovieId", CategoryItem.class, id);
        return list.isEmpty() ? null : list;
    }

    @Override
    public void updateCategoryItem(CategoryItem categoryItem) {
        excuteUpdate(categoryItem, MethodConstant.UPDATE);
    }

    @Override
    public void insertCategoryItem(CategoryItem categoryItem) {
        excuteUpdate(categoryItem, MethodConstant.INSERT);
    }

    @Override
    public void deleteCategoryItem(CategoryItem categoryItem) {
        excuteUpdate(categoryItem, MethodConstant.DELETE);
    }

    @Override
    public CategoryItem findCategoryItemById(int id) {
        List<CategoryItem> list = excuteQuery("findCategoryItemById", CategoryItem.class, id);
        return list.isEmpty() ? null : list.get(0);
    }

    @Override
    public List<CategoryItem> findAll() {
        List<CategoryItem> list = excuteQuery("findAllCategoryItem", CategoryItem.class);
        return list.isEmpty() ? null : list;
    }

    @Override
    public List<CategoryItem> findCategoryItemByUrlList(String url) {
        String jpql = "SELECT o FROM CategoryItem o where o.url in (" + url +")";
        List<CategoryItem> list = excuteQuery2(jpql, CategoryItem.class);
        return list.isEmpty() ? null : list;
    }

}
