package com.movie.entity;

import javax.persistence.*;

@NamedQueries({
        @NamedQuery(name = "findLikeByUserAndMovie", query = "select o from Likes o where o.user.id = ?1 and o.movies.id = ?2"),
        @NamedQuery(name = "findLikeByMovie", query = "select o from Likes o where o.movies.id = ?1")

})
@Entity
@Table(name = "likes", uniqueConstraints = {@UniqueConstraint(columnNames = {"userId","movieId"})})
public class Likes {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @ManyToOne @JoinColumn(name = "userId")
    UserEntity user;

    @ManyToOne @JoinColumn(name = "movieId")
    Movies movies;

    public Likes() {
    }

    public Likes(UserEntity user, Movies movies) {
        this.user = user;
        this.movies = movies;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public UserEntity getUser() {
        return user;
    }

    public void setUser(UserEntity user) {
        this.user = user;
    }

    public Movies getMovies() {
        return movies;
    }

    public void setMovies(Movies movies) {
        this.movies = movies;
    }

}
