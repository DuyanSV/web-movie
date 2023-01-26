package com.movie.model;

import com.movie.entity.Movies;

public class MovieSearchModel {
    private Movies movie;
    private String urlCategory;

    public MovieSearchModel(Movies movie, String urlCategory) {
        this.movie = movie;
        this.urlCategory = urlCategory;
    }

    public Movies getMovie() {
        return movie;
    }

    public void setMovie(Movies movie) {
        this.movie = movie;
    }

    public String getUrlCategory() {
        return urlCategory;
    }

    public void setUrlCategory(String urlCategory) {
        this.urlCategory = urlCategory;
    }
}
