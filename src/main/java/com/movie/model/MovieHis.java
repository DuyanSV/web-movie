package com.movie.model;

public class MovieHis {
    private int id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public MovieHis(int id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "MovieHis{" +
                "id=" + id +
                '}';
    }

    public MovieHis() {
    }
}
