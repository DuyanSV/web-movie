package com.movie.filter;

import com.movie.constant.SystemConstant;
import com.movie.dao.impl.UserDao;
import com.movie.entity.UserEntity;
import com.movie.utils.CookieUtil;
import com.movie.utils.SessionUtil;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AuthorizationFilter implements Filter {
    private ServletContext servletContext;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.servletContext = filterConfig.getServletContext();
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest rq = (HttpServletRequest) request;
        HttpServletResponse rp = (HttpServletResponse) response;
        rq.setCharacterEncoding("utf-8");
        rp.setCharacterEncoding("utf-8");
        String urlRq = rq.getRequestURI();
        String email = CookieUtil.getCookieUtil().get("EMAIL", rq);
        SessionUtil.getSession().removeUser(rq,"USER");
        if (email != null) {
            UserDao userService = new UserDao();
            UserEntity userEntity = userService.findByEmail(email);
            SessionUtil.getSession().putUser(rq, "USER", userEntity);
        }
        if (urlRq.contains("/admin")) {
            UserEntity userEntity = (UserEntity) SessionUtil.getSession().getUser(rq, "USER");
            if (userEntity == null) {
                rp.sendRedirect(rq.getContextPath() + "/dang-nhap?messenge=notLogin");
            } else {
                String role = String.valueOf(userEntity.getRole());
                if (role.equals(SystemConstant.ADMIN)) {
                    filterChain.doFilter(request, response);
                } else if (role.equals(SystemConstant.USER)) {
                    rp.sendRedirect(rq.getContextPath() + "/dang-nhap?messenge=notPermission");
                }
            }
        } else {
            filterChain.doFilter(request, response);
        }
    }

    @Override
    public void destroy() {

    }
}
