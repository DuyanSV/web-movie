package com.movie.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

public class LocaleFilter implements Filter {
    private ServletContext servletContext;
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.servletContext = filterConfig.getServletContext();
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest rq = (HttpServletRequest) servletRequest;
        String lang = rq.getParameter("lang");
        if(lang != null){
            rq.getSession().setAttribute("lang", lang);
        }
        filterChain.doFilter(servletRequest, servletResponse);
    }

    @Override
    public void destroy() {

    }
}
