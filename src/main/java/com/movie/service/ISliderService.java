package com.movie.service;

import com.movie.entity.Slider;

import java.util.List;

public interface ISliderService {
    List<Slider> findAll();
    Slider findByMovie(int movieId);
    Slider findByStt(int stt);
    Slider findById(int id);
    void update(Slider slider);
    void insert(Slider slider);
    void delete(Slider slider);
}
