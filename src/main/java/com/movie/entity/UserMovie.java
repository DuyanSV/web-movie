package com.movie.entity;

import javax.persistence.*;
import java.util.Date;

@NamedQueries({
        @NamedQuery(name = "findVipBuyUser", query = "SELECT o FROM UserMovie o where o.user.id = ?1"),
})
@Entity
@Table(name = "usermovie", uniqueConstraints = @UniqueConstraint(columnNames = {"movieId","userId"}))
public class UserMovie {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @ManyToOne
    @JoinColumn(name = "userId")
    UserEntity user;

    @ManyToOne
    @JoinColumn(name = "movieId")
    Movies movies;

    @Column(name = "price")
    private int price;

    @Column(name = "buyDate")
    private Date buyDate;

    public UserMovie() {
    }

    public UserMovie(UserEntity user, Movies movies, int price, Date buyDate) {
        this.user = user;
        this.movies = movies;
        this.price = price;
        this.buyDate = buyDate;
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

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public Date getBuyDate() {
        return buyDate;
    }

    public void setBuyDate(Date buyDate) {
        this.buyDate = buyDate;
    }
}
