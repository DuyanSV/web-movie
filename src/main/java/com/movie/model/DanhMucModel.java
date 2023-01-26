package com.movie.model;

import com.movie.entity.Category;
import com.movie.entity.CategoryItem;

import java.util.List;

public class DanhMucModel {
    private Category categoryEntity;
    List<CategoryItem> listCategoryItem;

    public DanhMucModel(Category categoryEntity, List<CategoryItem> listCategoryItem) {
        this.categoryEntity = categoryEntity;
        this.listCategoryItem = listCategoryItem;
    }

    public Category getCategoryEntity() {
        return categoryEntity;
    }

    public void setCategoryEntity(Category categoryEntity) {
        this.categoryEntity = categoryEntity;
    }

    public List<CategoryItem> getListCategoryItem() {
        return listCategoryItem;
    }

    public void setListCategoryItem(List<CategoryItem> listCategoryItem) {
        this.listCategoryItem = listCategoryItem;
    }
}
