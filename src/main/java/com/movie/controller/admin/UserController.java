package com.movie.controller.admin;

import com.movie.entity.UserEntity;
import com.movie.service.IUserService;
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

@WebServlet(urlPatterns = {"/admin/nguoi-dung", "/admin/nguoi-dung/edit","/admin/nguoi-dung/remove"})
public class UserController extends HttpServlet {
    @Inject
    private IUserService userService;

    @Inject
    private ValidateUtil validateUtil;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String view = "";
        String uri = req.getRequestURI();
        if(uri.contains("/admin/nguoi-dung/remove")){
            int id = Integer.parseInt(req.getParameter("id"));
            userService.deleteUser(id);
            resp.sendRedirect(req.getContextPath()+"/admin/nguoi-dung?status=delete-success");
            return;
        } else if (uri.contains("/admin/nguoi-dung/edit")) {
            String id = req.getParameter("id");
            UserEntity userEntity = userService.findById(Integer.parseInt(id));
            req.setAttribute("user", userEntity);
            view = "/views/admin/editUser.jsp";
        } else if (uri.contains("/admin/nguoi-dung")) {
            String status = req.getParameter("status");
            if(status != null && status.equals("update-success")){
                req.setAttribute("messengeSuccess","Update thành công!");
            }
            if(status != null && status.equals("delete-success")){
                req.setAttribute("messengeSuccess","Xóa thành công!");
            }
            view = "/views/admin/user.jsp";
            List<UserEntity> listUser = userService.findAll();
            req.setAttribute("listUser", listUser);
        }
        RequestDispatcher rd = req.getRequestDispatcher(view);
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String view = "";
        String uri = req.getRequestURI();
        if (uri.contains("/admin/nguoi-dung/edit")) {
            String action = req.getParameter("action");
            if (action.equals("edit")) {
                StringBuilder error = new StringBuilder();
                String id = req.getParameter("id");
                String fullname = req.getParameter("fullname");
                String email = req.getParameter("email");
                int active = Integer.parseInt(req.getParameter("active"));
                int role = Integer.parseInt(req.getParameter("role"));
                validateUtil.validateEditUser(fullname, email, Integer.parseInt(id), error);
                UserEntity userEntity = userService.findById(Integer.parseInt(id));
                userEntity.setEmail(email);
                userEntity.setFullname(fullname);
                userEntity.setRole(role);
                userEntity.setActive(active);
                if (error.toString().isEmpty()) {
                    userService.updateUser(userEntity);
                    resp.sendRedirect(req.getContextPath() + "/admin/nguoi-dung?status=update-success");
                    return;
                } else {
                    req.setAttribute("messengeError", error.toString());
                    req.setAttribute("user", userEntity);
                    view = "/views/admin/editUser.jsp";
                }
            }
        }
        RequestDispatcher rd = req.getRequestDispatcher(view);
        rd.forward(req, resp);
    }
}
