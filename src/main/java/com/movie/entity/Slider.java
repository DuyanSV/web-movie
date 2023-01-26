package com.movie.entity;

import javax.persistence.*;

@NamedQueries({
        @NamedQuery(name = "findAllSlider", query = "select o from Slider o order by o.stt asc"),
        @NamedQuery(name = "findSliderByMovie", query = "select o from Slider o where o.movies.id = ?1"),
        @NamedQuery(name = "findSliderByStt", query = "select o from Slider o where o.stt = ?1"),
        @NamedQuery(name = "findSliderById", query = "select o from Slider o where o.id = ?1"),
})
@Entity
@Table(name = "slider", uniqueConstraints = @UniqueConstraint(columnNames = {"movieId"}))
public class Slider {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @ManyToOne @JoinColumn(name = "movieId")
    Movies movies;

    @Column(name = "stt")
    private int stt;

    public Slider(Movies movies, int stt) {
        this.movies = movies;
        this.stt = stt;
    }

    public Slider() {

    }

    @Override
    public String toString() {
        return "Slider{" +
                "id=" + id +
                ", movies=" + movies +
                ", stt=" + stt +
                '}';
    }

    public int getStt() {
        return stt;
    }

    public void setStt(int stt) {
        this.stt = stt;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Movies getMovies() {
        return movies;
    }

    public void setMovies(Movies movies) {
        this.movies = movies;
    }

}
