package com.movie.action.admin;

import com.movie.entity.Category;
import com.movie.entity.CategoryItem;
import com.movie.entity.CategoryItemMovie;
import com.movie.service.ICategoryItemMovieService;
import com.movie.service.ICategoryItemService;
import com.movie.service.ICategoryService;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

public class DanhMucAction {
    @Inject
    private ICategoryItemService categoryItemService;

    @Inject
    private ICategoryService categoryService;

    @Inject
    private ICategoryItemMovieService categoryItemMovieService;

    public void updateCategoryItem(HttpServletRequest req, String url, String name){
        int idCategoryItem = Integer.parseInt(req.getParameter("idCategoryItem"));
        CategoryItem categoryItem = new CategoryItem(idCategoryItem,name, url);
        if(url.trim().length() == 0 || name.trim().length() == 0){
            req.setAttribute("messengeError", "Tên và url đều không được để trống!");
            req.setAttribute("onEditCategory","on");
            req.setAttribute("categoryItem", categoryItem);
        } else {
            CategoryItem categoryItemCheck = categoryItemService.findCategoryItemByUrl(url);
            if(categoryItemCheck != null && categoryItemCheck.getId() != idCategoryItem){
                req.setAttribute("messengeError", "Url này đã tồn tại, vui lòng chọn url khác!");
                req.setAttribute("onEditCategory","on");
                req.setAttribute("categoryItem", categoryItem);
            } else {
                CategoryItem newCategoryItem = categoryItemService.findCategoryItemById(idCategoryItem);
                newCategoryItem.setCategoryName(name);
                newCategoryItem.setUrl(url);
                categoryItemService.updateCategoryItem(newCategoryItem);
                req.setAttribute("messengeSuccess", "Cập nhật thành công!");
            }
        }
    }

    public boolean insertCategory(HttpServletRequest req, List<Category> categoryList){
        String name = req.getParameter("danhMucName");
        if (name.trim().length() == 0) {
            req.setAttribute("messengeError", "Tên danh mục không được để trống!");
            req.setAttribute("onInput", "on");
            return false;
        } else {
            Boolean check = true;
            for (Category category : categoryList) {
                if (category.getCategoryName().equalsIgnoreCase(name)) {
                    System.out.println("giong");
                    check = false;
                    break;
                }
            }
            if (check) {
                Category category = new Category();
                category.setCategoryName(name);
                categoryService.insert(category);
                req.setAttribute("messengeSuccess", "Thêm thành công!");
                return true;
            } else {
                req.setAttribute("danhMucName", name);
                req.setAttribute("messengeError", "Danh mục này đã tồn tại rồi!");
                req.setAttribute("onInput", "on");
                return false;
            }
        }
    }

    public void updateCategory(HttpServletRequest req, String id){
        String newName = req.getParameter("danhMucName");
        Category category = categoryService.findById(Integer.parseInt(id));
        category.setCategoryName(newName);
        categoryService.update(category);
        req.setAttribute("messengeSuccess","Cập nhật thành công!");
    }

    public void deleteCategoryItem(int id){

        List<CategoryItemMovie> list = categoryItemMovieService.findByIdCategoryItem(id);
        if(list != null){
            for(CategoryItemMovie categoryItemMovie : list){
                categoryItemMovieService.delete(categoryItemMovie);
            }
        }
        CategoryItem categoryItem = categoryItemService.findCategoryItemById(id);
        categoryItemService.deleteCategoryItem(categoryItem);
    }

    public void deleteCategory(int id){
        Category category = categoryService.findById(id);
        List<CategoryItem> categoryItemList = categoryItemService.findCategoryItemByIdCategory(category.getId());
        if(categoryItemList != null){
            for(CategoryItem categoryItem : categoryItemList){
                deleteCategoryItem(categoryItem.getId());
            }
        }
        categoryService.delete(category);
    }

}
