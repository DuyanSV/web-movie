package com.movie.entity;

import javax.persistence.*;
import java.util.Date;

@NamedQueries({
        @NamedQuery(name = "findCommentByMovie", query = "SELECT o FROM Comments o where o.movies.id = ?1"),
})
@Entity
@Table(name = "comments", uniqueConstraints = {@UniqueConstraint(columnNames = {"userId","movieId"})})
public class Comments {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @ManyToOne @JoinColumn(name = "userId")
    UserEntity user;

    @ManyToOne @JoinColumn(name = "movieId")
    Movies movies;

    @Column(name = "content")
    private String content;
    @Column(name = "dateComment")
    private Date dateComment;

    public Comments() {
    }

    public Comments(UserEntity user, Movies movies, String content, Date dateComment) {
        this.user = user;
        this.movies = movies;
        this.content = content;
        this.dateComment = dateComment;
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getDateComment() {
        return dateComment;
    }

    public void setDateComment(Date dateComment) {
        this.dateComment = dateComment;
    }

}
