package com.movie.controller.web;

import com.movie.entity.UserEntity;
import com.movie.service.IUserService;
import com.movie.utils.CookieUtil;
import com.movie.utils.EmailUtil;
import com.movie.utils.SessionUtil;
import com.movie.utils.ValidateUtil;
import org.apache.commons.codec.digest.DigestUtils;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ResourceBundle;

@WebServlet(urlPatterns = {"/dang-nhap", "/dang-ki","/dang-xuat","/login-with-google"})
public class Account extends HttpServlet {
    @Inject
    private ValidateUtil validateUtil;

    public static String urlHistory = "";

    @Inject
    private IUserService userService;

    ResourceBundle rb = ResourceBundle.getBundle("messenge");

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uri = req.getRequestURI();
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        String view = "";
        if (uri.contains("/dang-nhap")) { //
            String history = req.getParameter("urlHistory");
            String messenge = req.getParameter("messenge");
            if(history != null){
                urlHistory = history;
                if(messenge != null && messenge.equals("movievip")){
                    urlHistory += "&id=" + req.getParameter("id");
                }
            }
            if(messenge != null){
                if(messenge.equals("notLogin")){
                    req.setAttribute("messengeError",rb.getString("notLogin"));
                }
                if(messenge.equals("notPermission")){
                    req.setAttribute("messengeError",rb.getString("notPermisstion"));
                }
                if(messenge.equals("movievip")){
                    req.setAttribute("messengeError",rb.getString("movievip"));
                }
            }
            String status = req.getParameter("status");
            if(status != null){
                req.setAttribute("messengeSuccess",rb.getString("signUpSuccess"));
            }
            view = "/views/account/login.jsp";
        } else if (uri.contains("/dang-ki")) {
            String status = req.getParameter("status");
            if(status != null){
                int index = status.lastIndexOf("@");
                String maHoaCode = status.substring(0,index);
                String maHoaEmail = status.substring(index+1 , status.length());

                String sessionCode = String.valueOf(SessionUtil.getSession().getUser(req, "KEYCODE"));
                String sessionEmail = String.valueOf(SessionUtil.getSession().getUser(req, "KEYMAIL"));

                String maHoaCodeReal = DigestUtils.md5Hex(String.valueOf(sessionCode));
                String maHoaEmailReal = DigestUtils.md5Hex(String.valueOf(sessionEmail));
                if(maHoaCode.equals(maHoaCodeReal) && maHoaEmail.equals(maHoaEmailReal)){
                    UserEntity userEntity = (UserEntity) SessionUtil.getSession().getUser(req, "USERSIGNUP");
                    userService.insertUser(userEntity);
                    SessionUtil.getSession().removeUser(req, "KEYCODE");
                    SessionUtil.getSession().removeUser(req, "KEYMAIL");
                    resp.sendRedirect(req.getContextPath() + "/dang-nhap?status=signup-success");
                    return;
                } else {
                    req.setAttribute("messengeError",rb.getString("comfirmFalse"));
                }
            }
            view = "/views/account/signup.jsp";
        } else if(uri.contains("/dang-xuat")){
            int hour = 0;
            CookieUtil.getCookieUtil().add("ID", "", hour, resp);
            CookieUtil.getCookieUtil().add("EMAIL", "", hour, resp);
            CookieUtil.getCookieUtil().add("ROLE", "", hour, resp);
            SessionUtil.getSession().removeUser(req, "USER");
            resp.sendRedirect(req.getContextPath()+"/trang-chu");
            return;
        }

        RequestDispatcher rd = req.getRequestDispatcher(view);
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uri = req.getRequestURI();
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        String view = "";
        if (uri.contains("/dang-nhap")) {
            String email = req.getParameter("email");
            String password = req.getParameter("password");
            UserEntity userEntity = userService.findByEmailAndPassword(email, password);
            if(userEntity == null){
                req.setAttribute("messengeError",rb.getString("loginFalse"));
                req.setAttribute("email", email);
                req.setAttribute("password", password);
                view = "/views/account/login.jsp";
            } else {
                if(userEntity.getActive() == 0){
                    req.setAttribute("messengeError",rb.getString("inActive"));
                    req.setAttribute("email", email);
                    req.setAttribute("password", password);
                    view = "/views/account/login.jsp";
                } else {
                    int hour = 60*60*24;
                    CookieUtil.getCookieUtil().add("EMAIL", email, hour, resp);
                    if(urlHistory.length() == 0){
                        resp.sendRedirect(req.getContextPath()+"/trang-chu?status=login-success");
                        return;
                    } else {
                        resp.sendRedirect(req.getContextPath()+urlHistory);
                        return;
                    }
                }
            }
        } else if (uri.contains("/dang-ki")) {
            String email = req.getParameter("email");
            String fullname = req.getParameter("fullname");
            String password = req.getParameter("password");
            String comfirmPassword = req.getParameter("comfirmPassword");
            StringBuilder error = new StringBuilder();
            validateUtil.validateSignup(email, fullname, password, comfirmPassword, error);
            if (error.toString().isEmpty()) {
                UserEntity userEntity = new UserEntity(email, fullname,"", password, 0, 1);
                SessionUtil.getSession().putUser(req, "USERSIGNUP", userEntity);

                int so = (int) (Math.random() * ((999999 - 111111) + 1) + 111111);
                int hours = 30*24;
                SessionUtil.getSession().putUser(req, "KEYCODE", so);
                SessionUtil.getSession().putUser(req, "KEYMAIL", email);

                String maHoaCode = DigestUtils.md5Hex(String.valueOf(so));
                String maHoaEmail = DigestUtils.md5Hex(String.valueOf(email));
                String url = req.getRequestURL().toString();
                String noiDung = "Vui lòng nhấn vào liên kết để kích hoạt tài khoản của bạn: <a href='" + url +"?status="+maHoaCode +"@"+ maHoaEmail +"'>Kích hoạt</a>";
                EmailUtil.sendMail(email, "Kích hoạt tài khoản", noiDung);
                req.setAttribute("messengeSuccess",rb.getString("sendComfirm"));
            } else {
                req.setAttribute("messengeError", error.toString());
            }
            req.setAttribute("email", email);
            req.setAttribute("fullname", fullname);
            req.setAttribute("password", password);
            req.setAttribute("comfirmPassword", comfirmPassword);
            view = "/views/account/signup.jsp";
        } else if(uri.contains("login-with-google")){
            req.setCharacterEncoding("utf-8");
            String fullname = req.getParameter("fullname");
            String avatar = req.getParameter("avatar");
            String email = req.getParameter("email");
            System.out.println(fullname);
            UserEntity user = userService.findByEmail(email);
            int hour = 60*60*24;
            CookieUtil.getCookieUtil().add("EMAIL", email, hour, resp);
            if(user == null){
                UserEntity userEntity = new UserEntity("43242", fullname, "",email,0,1,0);
                userService.insertUser(userEntity);
            }
        }

        RequestDispatcher rd = req.getRequestDispatcher(view);
        rd.forward(req, resp);
    }
}
