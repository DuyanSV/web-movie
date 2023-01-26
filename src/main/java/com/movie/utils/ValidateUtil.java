package com.movie.utils;

import com.movie.entity.CategoryItem;
import com.movie.entity.UserEntity;
import com.movie.service.ICategoryItemService;
import com.movie.service.IUserService;
import com.movie.service.impl.CategoryItemService;
import com.movie.service.impl.UserService;
import com.mysql.cj.x.protobuf.MysqlxDatatypes;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

public class ValidateUtil {
    @Inject
    private IUserService userService;

    @Inject
    private ICategoryItemService categoryItemService;

    public boolean checkNull(String chuoi){
        if(chuoi == null || chuoi.trim().length() == 0){
            return false;
        } else {
            return true;
        }
    }

    public void validateSignup(String email, String fullname, String password, String comfirmPassword, StringBuilder error){
        if(!checkNull(email)){
            error.append("Bạn không được để trống email!\n");
        } else if(!email.matches("^[\\w-_\\.+]*[\\w-_\\.]\\@([\\w]+\\.)+[\\w]+[\\w]$")){
            error.append("Email không đúng định dạng!\n");
        } else {
            UserEntity userEntity = userService.findByEmail(email);
            if(userEntity != null){
                error.append("Email này đã được đăng kí!\n");
            }
        }
        if(!checkNull(fullname)){
            error.append("Bạn không được để trống tên!\n");
        }
        if(!checkNull(password)){
            error.append("Bạn không được để trống mật khẩu!\n");
        }
        if(!checkNull(comfirmPassword)){
            error.append("Bạn không được để trống nhập lại mật khẩu!\n");
        }
        if(checkNull(password) && checkNull(comfirmPassword)){
            if(!password.equals(comfirmPassword)){
                error.append("2 Mật khẩu phải giống nhau!\n");
            }
        }
    }

    public void validateEditUser(String password, String email, int id, StringBuilder error){
        if(!checkNull(password)){
            error.append("Mật khẩu không được để trống!\n");
        }
        if(!checkNull(email)){
            error.append("Email không được để trống!\n");
        } else if(!email.matches("^[\\w-_\\.+]*[\\w-_\\.]\\@([\\w]+\\.)+[\\w]+[\\w]$")){
            error.append("Email không đúng định dạng!\n");
        } else {
            UserEntity userEntity = userService.findByEmailAndId(email, id);
            if(userEntity != null){
                error.append("Email này đã được đăng kí!\n");
            }
        }
    }

    public boolean validateAddCategoryItem(HttpServletRequest req){
        String url = req.getParameter("urlCategoryItem");
        String name = req.getParameter("categoryItemName");
        System.out.println(url);
        System.out.println(name);
        if(url.trim().length() == 0 || name.trim().length() == 0){
            req.setAttribute("messengeError", "Tên và url đều không được để trống!");
            req.setAttribute("onAddCategory","on");
            return false;
        } else {
            CategoryItem categoryItemCheck = categoryItemService.findCategoryItemByUrl(url);
            if(categoryItemCheck != null){
                req.setAttribute("urlCategoryItem", url);
                req.setAttribute("categoryItemName", name);
                req.setAttribute("messengeError", "Url này đã tồn tại, vui lòng chọn url khác!");
                req.setAttribute("onAddCategory","on");
                return false;
            } else {
                return true;
            }
        }
    }

}
