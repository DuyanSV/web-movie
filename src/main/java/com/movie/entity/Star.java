package com.movie.entity;

import com.movie.model.AvgStar;

import javax.persistence.*;

@NamedQueries({
        @NamedQuery(name = "findStarByMovieId", query = "SELECT o FROM Star o where o.movies.id = ?1"),
})

@Entity
@Table(name = "star", uniqueConstraints = @UniqueConstraint(columnNames = {"movieId"}))
public class Star {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @ManyToOne
    @JoinColumn(name = "movieId")
    Movies movies;

    @Column(name = "star")
    private int star;

    public Star() {
    }

    public Star(Movies movies, int star) {
        this.movies = movies;
        this.star = star;
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

    public int getStar() {
        return star;
    }

    public void setStar(int star) {
        this.star = star;
    }
}
