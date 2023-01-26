package com.movie.controller.web;

import com.movie.config.Config;
import com.movie.dao.impl.UserMovieDao;
import com.movie.entity.Movies;
import com.movie.entity.UserEntity;
import com.movie.entity.UserMovie;
import com.movie.service.impl.MovieService;
import com.movie.service.impl.UserMovieService;
import com.movie.service.impl.UserService;
import com.movie.utils.SessionUtil;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.Date;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.*;

@WebServlet(urlPatterns = {"/profile","/buy-movie","/nap-tien","/nap-thanh-cong"})
public class ProfileController extends HttpServlet {
    @Inject
    private UserService userService;
    @Inject
    private MovieService movieService;
    @Inject
    private UserMovieService userMovieService;

    String urlHistory = null;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uri = req.getRequestURI();
        String view = "";
        if(uri.contains("/profile")){
            UserEntity user = (UserEntity) SessionUtil.getSession().getUser(req, "USER");
            String message = req.getParameter("nap-thanh-cong");
            if(message != null){
                req.setAttribute("messengeSuccess","Nạp thành công!");
            }
            List<UserMovie> userMovies = userMovieService.findByUser(user.getId());
            req.setAttribute("userMovies", userMovies);
            view = "/views/web/profile.jsp";
        }
        if(uri.contains("/nap-tien")){
            String urlhis = req.getParameter("urlHistory");
            if(urlhis != null){
                urlHistory = urlhis + "&id=" + req.getParameter("id");
            }
            System.out.println(urlHistory);
            view = "/views/web/payment.jsp";
        }
        if(uri.contains("/nap-thanh-cong")){
            if(req.getParameter("vnp_ResponseCode").equals("00")){
                String price = req.getParameter("vnp_Amount");
                System.out.println(req.getRequestURI());
                System.out.println(req.getRequestURL());
                UserEntity user = (UserEntity) SessionUtil.getSession().getUser(req, "USER");
                user.setSurplus(user.getSurplus() + Integer.parseInt(price));
                userService.updateUser(user);
                if(urlHistory != null){
                    resp.sendRedirect(req.getContextPath() + urlHistory);
                } else {
                    resp.sendRedirect(req.getContextPath() + "/profile?messenge=nap-thanh-cong");
                }
                return;
            } else {
                resp.sendRedirect(req.getContextPath() + "/profile");
                return;
            }
        }
        RequestDispatcher rd = req.getRequestDispatcher(view);
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uri = req.getRequestURI();
        if(uri.contains("/buy-movie")){
            String movieId = req.getParameter("movieId");
            int price = Integer.parseInt(req.getParameter("price"));
            PrintWriter out = resp.getWriter();
            UserEntity user = (UserEntity) SessionUtil.getSession().getUser(req, "USER");
            if(user.getSurplus() < price){
                out.print("khong_du_tien");
            } else {
                int newPrice = user.getSurplus() - price;
                user.setSurplus(newPrice);
                userService.updateUser(user);
                Movies movies = movieService.findByid(Integer.parseInt(movieId));
                Date now = new Date();
                UserMovie userMovie = new UserMovie(user, movies, price, now);
                userMovieService.insert(userMovie);
                out.print("mua_thanh_cong");
            }
        }
        if(uri.contains("/nap-tien")){
            String urlHis = req.getParameter("urlHistory");
            if(urlHis != null){
                Config.vnp_Returnurl += "?urlHistory=" + urlHis;
            }
            String vnp_Version = "2.0.0";
            String vnp_Command = "pay";
            String vnp_OrderInfo = req.getParameter("vnp_OrderInfo");
            String orderType = req.getParameter("ordertype");
            String vnp_TxnRef = Config.getRandomNumber(8);
            String vnp_IpAddr = Config.getIpAddress(req);
            String vnp_TmnCode = Config.vnp_TmnCode;

            String vnp_TransactionNo = vnp_TxnRef;
            String vnp_hashSecret = Config.vnp_HashSecret;

            int amount = Integer.parseInt(req.getParameter("amount")) * 100;
            Map<String, String> vnp_Params = new HashMap<>();
            vnp_Params.put("vnp_Version", vnp_Version);
            vnp_Params.put("vnp_Command", vnp_Command);
            vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
            vnp_Params.put("vnp_Amount", String.valueOf(amount));
            vnp_Params.put("vnp_CurrCode", "VND");
            String bank_code = req.getParameter("bankcode");
            if (bank_code != null && bank_code.isEmpty()) {
                vnp_Params.put("vnp_BankCode", bank_code);
            }
            vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
            vnp_Params.put("vnp_OrderInfo", vnp_OrderInfo);
            vnp_Params.put("vnp_OrderType", orderType);

            String locate = req.getParameter("language");
            if (locate != null && !locate.isEmpty()) {
                vnp_Params.put("vnp_Locale", locate);
            } else {
                vnp_Params.put("vnp_Locale", "vn");
            }
            vnp_Params.put("vnp_ReturnUrl", Config.vnp_Returnurl);
            vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

            Date dt = new Date();
            SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
            String dateString = formatter.format(dt);
            String vnp_CreateDate = dateString;
            String vnp_TransDate = vnp_CreateDate;
            vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

            //Build data to hash and querystring
            List fieldNames = new ArrayList(vnp_Params.keySet());
            Collections.sort(fieldNames);
            StringBuilder hashData = new StringBuilder();
            StringBuilder query = new StringBuilder();
            Iterator itr = fieldNames.iterator();
            while (itr.hasNext()) {
                String fieldName = (String) itr.next();
                String fieldValue = (String) vnp_Params.get(fieldName);
                if ((fieldValue != null) && (fieldValue.length() > 0)) {
                    //Build hash data
                    hashData.append(fieldName);
                    hashData.append('=');
                    hashData.append(fieldValue);
                    //Build query
                    query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                    query.append('=');
                    query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));

                    if (itr.hasNext()) {
                        query.append('&');
                        hashData.append('&');
                    }
                }
            }
            String queryUrl = query.toString();
            String vnp_SecureHash = Config.Sha256(Config.vnp_HashSecret + hashData.toString());
            //System.out.println("HashData=" + hashData.toString());
            queryUrl += "&vnp_SecureHashType=SHA256&vnp_SecureHash=" + vnp_SecureHash;
            String paymentUrl = Config.vnp_PayUrl + "?" + queryUrl;
            JsonObject job = new JsonObject();
            job.addProperty("code", "00");
            job.addProperty("message", "success");
            job.addProperty("data", paymentUrl);
            Gson gson = new Gson();
            resp.getWriter().write(gson.toJson(job));
        }
    }
}
