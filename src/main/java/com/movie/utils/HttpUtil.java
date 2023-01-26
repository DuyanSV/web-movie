package com.movie.utils;

import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.BufferedReader;

public class HttpUtil {
    String value;
    public HttpUtil(String value){
        this.value = value;
    }

    public static HttpUtil of (BufferedReader reader){
        StringBuilder json = new StringBuilder();
        String line;
        try {
            while ((line = reader.readLine()) != null){
                json.append(line);
            }
            System.out.println(json.toString());
        } catch (Exception e){
            System.out.println(e.getMessage());
        }
        return new HttpUtil(json.toString());
    }

    public <T> T toModel(Class<T> tClass){
        try {
            return new ObjectMapper().readValue(value, tClass);
        }catch (Exception e){
            return null;
        }
    }
}
