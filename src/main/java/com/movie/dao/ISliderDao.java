package com.movie.dao;

import com.movie.entity.Slider;

import java.util.List;

public interface ISliderDao extends GenegicDao<Slider>{
    List<Slider> findAll();
    void insert(Slider slider);
    void delete(Slider slider);
    void update(Slider slider);
    Slider findByMovie(int movieId);
    Slider findByStt(int stt);
    Slider findById(int id);
}
