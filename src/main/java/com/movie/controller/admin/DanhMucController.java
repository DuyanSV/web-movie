package com.movie.controller.admin;

import com.movie.action.admin.DanhMucAction;
import com.movie.entity.Category;
import com.movie.entity.CategoryItem;
import com.movie.service.ICategoryItemService;
import com.movie.service.ICategoryService;
import com.movie.utils.ValidateUtil;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/admin/danh-muc-the-loai"})
public class DanhMucController extends HttpServlet {
    @Inject
    private ValidateUtil validateUtil;

    @Inject
    private ICategoryService categoryService;

    @Inject
    private DanhMucAction danhMucAction;

    @Inject
    private ICategoryItemService categoryItemService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String view = "";
        int index = 1;
        String id = req.getParameter("id");
        index = id == null ? 1 : Integer.parseInt(id);
        List<Category> categoryList = categoryService.findAll();
        List<CategoryItem> categoryItemList = categoryItemService.findCategoryItemByIdCategory(index);
        String categoryItemUrl = req.getParameter("category-item");
        String action = req.getParameter("action");
        if(categoryItemUrl != null){
            CategoryItem categoryItem = categoryItemService.findCategoryItemByUrl(categoryItemUrl);
            req.setAttribute("onEditCategoryItem", "on");
            req.setAttribute("categoryItem", categoryItem);
        } else if(action != null && action.equals("editCategory")){
            req.setAttribute("idCategory", id);
            req.setAttribute("category", categoryService.findById(Integer.parseInt(id)));
            req.setAttribute("onEditCategory", "on");
        }
        req.setAttribute("url", "/admin/danh-muc-the-loai?id=" + index);
        req.setAttribute("index", index);
        req.setAttribute("categoryList", categoryList);
        req.setAttribute("categoryItemList", categoryItemList);
        view = "/views/admin/danhmuc.jsp";
        RequestDispatcher rd = req.getRequestDispatcher(view);
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        String view = "";
        int index = 1;
        String id = req.getParameter("id");
        index = id == null ? 1 : Integer.parseInt(id);
        List<Category> categoryList = categoryService.findAll();
        String action = req.getParameter("action");
        if(action!= null && action.equals("addCategoryItem")){
            // insert category item
            if(validateUtil.validateAddCategoryItem(req)){
                Category category = categoryService.findById(Integer.parseInt(id));
                CategoryItem categoryItem = new CategoryItem(category, req.getParameter("categoryItemName"), req.getParameter("urlCategoryItem"));
                categoryItemService.insertCategoryItem(categoryItem);
                req.setAttribute("messengeSuccess","Thêm thành công!");
            } else {
                req.setAttribute("id", id);
            }
        } else if(action != null && action.equals("updateCategoryItem")){
            // update category item
            String url = req.getParameter("urlCategoryItem");
            String name = req.getParameter("categoryItemName");
            danhMucAction.updateCategoryItem(req, url, name);
        } else if(action != null && action.equals("addCategory")) {
            // insert category
            if(danhMucAction.insertCategory(req, categoryList)){
                categoryList = categoryService.findAll();
            }
        } else if(action != null && action.equals("editCategory")){
            // edit category
            danhMucAction.updateCategory(req, id);
        } else if(action != null && action.equals("delete_categoryItem")){
            danhMucAction.deleteCategoryItem(Integer.parseInt(req.getParameter("idCategoryItem")));
            req.setAttribute("messengeSuccess","Xóa thành công!");
        } else if(action != null && action.equals("delete_category")){
            danhMucAction.deleteCategory(index);
            req.setAttribute("messengeSuccess","Xóa thành công!");
        }
        List<CategoryItem> categoryItemList = categoryItemService.findCategoryItemByIdCategory(index);
        req.setAttribute("url", "/admin/danh-muc-the-loai?id=" + index);
        req.setAttribute("categoryList", categoryList);
        req.setAttribute("categoryItemList", categoryItemList);
        req.setAttribute("index", index);
        view = "/views/admin/danhmuc.jsp";
        RequestDispatcher rd = req.getRequestDispatcher(view);
        rd.forward(req, resp);
    }
}
