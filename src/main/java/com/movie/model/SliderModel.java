package com.movie.model;

import com.movie.entity.Movies;

public class SliderModel {
    private Movies movies;
    private String type;

    public SliderModel(Movies movies, String type) {
        this.movies = movies;
        this.type = type;
    }

    public Movies getMovies() {
        return movies;
    }

    public void setMovies(Movies movies) {
        this.movies = movies;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
