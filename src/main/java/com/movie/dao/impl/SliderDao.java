package com.movie.dao.impl;

import com.movie.constant.MethodConstant;
import com.movie.dao.ISliderDao;
import com.movie.entity.MovieDetail;
import com.movie.entity.Slider;

import java.util.List;

public class SliderDao extends AbstractDao<Slider> implements ISliderDao {
    @Override
    public List<Slider> findAll() {
        List<Slider> list = excuteQuery("findAllSlider",Slider.class);
        return list.isEmpty() ? null : list;
    }

    @Override
    public void insert(Slider slider) {
        excuteUpdate(slider, MethodConstant.INSERT);
    }

    @Override
    public void delete(Slider slider) {
        excuteUpdate(slider, MethodConstant.DELETE);
    }

    @Override
    public void update(Slider slider) {
        excuteUpdate(slider, MethodConstant.UPDATE);
    }

    @Override
    public Slider findByMovie(int movieId) {
        List<Slider> list = excuteQuery("findSliderByMovie",Slider.class, movieId);
        return list.isEmpty() ? null : list.get(0);
    }

    @Override
    public Slider findByStt(int stt) {
        List<Slider> list = excuteQuery("findSliderByStt",Slider.class, stt);
        return list.isEmpty() ? null : list.get(0);
    }

    @Override
    public Slider findById(int id) {
        List<Slider> list = excuteQuery("findSliderById",Slider.class, id);
        return list.isEmpty() ? null : list.get(0);
    }
}
