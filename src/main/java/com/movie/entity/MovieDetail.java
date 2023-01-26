package com.movie.entity;

import javax.persistence.*;

@NamedQueries({
        @NamedQuery(name = "findMovieDetailByMovieId", query = "select o from MovieDetail o where o.movies.id = ?1")
})
@Entity
@Table(name = "moviedetail", uniqueConstraints = @UniqueConstraint(columnNames = {"movieId"}))
public class MovieDetail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @ManyToOne @JoinColumn(name = "movieId")
    Movies movies;

    @Column(name = "episode")
    private int episode;

    @Column(name = "url")
    private String url;

    public MovieDetail(Movies movies, int episode, String url) {
        this.movies = movies;
        this.episode = episode;
        this.url = url;
    }

    public MovieDetail() {

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

    public int getEpisode() {
        return episode;
    }

    public void setEpisode(int episode) {
        this.episode = episode;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

}
