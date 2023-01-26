package com.movie.service.impl;

import com.movie.dao.impl.SliderDao;
import com.movie.entity.Slider;
import com.movie.service.ISliderService;

import javax.inject.Inject;
import java.util.List;

public class SliderService implements ISliderService {
    @Inject
    private SliderDao sliderDao;

    @Override
    public List<Slider> findAll() {
        return sliderDao.findAll();
    }

    @Override
    public Slider findByMovie(int movieId) {
        return sliderDao.findByMovie(movieId);
    }

    @Override
    public Slider findByStt(int stt) {
        return sliderDao.findByStt(stt);
    }

    @Override
    public Slider findById(int id) {
        return sliderDao.findById(id);
    }

    @Override
    public void update(Slider slider) {
        sliderDao.update(slider);
    }

    @Override
    public void insert(Slider slider) {
        sliderDao.insert(slider);
    }

    @Override
    public void delete(Slider slider) {
        sliderDao.delete(slider);
    }
}
