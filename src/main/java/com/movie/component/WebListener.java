package com.movie.component;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.List;

@javax.servlet.annotation.WebListener
public class WebListener implements HttpSessionListener, ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent event) {
        System.out.println(event.getServletContext().getContextPath());
        ServletContext application = event.getServletContext();
        Integer visitors = 0;
        try {
            String path = application.getRealPath("/visitors.txt");
            File file = new File(path);
            if(!file.exists()){
                file.createNewFile();
            }
            List<String> lines = Files.readAllLines(Paths.get(path));
            visitors = Integer.valueOf(lines.get(0));
        } catch (Exception e2) {
            visitors = 0;
        }
        System.out.println("init: " + visitors);
        application.setAttribute("visitors", visitors);
    }

    @Override
    public void contextDestroyed(ServletContextEvent event) {
        ServletContext application = event.getServletContext();
        Integer visitors = (Integer) application.getAttribute("visitors");
        try {
            String path = application.getRealPath("/visitors.txt");
            byte[] data = String.valueOf(visitors).getBytes();
            Files.write(Paths.get(path), data, StandardOpenOption.CREATE);
            System.out.println("distroy: "+ visitors);
        } catch (Exception e2) {
            e2.printStackTrace();
        }
    }

    @Override
    public void sessionCreated(HttpSessionEvent event) {
        HttpSession session = event.getSession();
        ServletContext application = session.getServletContext();
        Integer visitors = (Integer) application.getAttribute("visitors");
        application.setAttribute("visitors", visitors + 1);
        System.out.println("created: " + visitors);
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent event) {

    }
}
