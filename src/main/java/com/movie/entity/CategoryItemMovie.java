package com.movie.entity;

import javax.persistence.*;

@NamedQueries({
        @NamedQuery(name = "findCategoryItemByIdMovie", query = "select o from CategoryItemMovie o where o.movies.id = ?1"),
        @NamedQuery(name = "findByIdCategoryItem", query = "select o from CategoryItemMovie o where o.categoryItem.id = ?1"),
})
@Entity
@Table(name = "categoryitemmovie", uniqueConstraints = {@UniqueConstraint(columnNames = {"categoryId","movieId"})})
public class CategoryItemMovie {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @ManyToOne @JoinColumn(name = "categoryId")
    CategoryItem categoryItem;

    @ManyToOne @JoinColumn(name = "movieId")
    Movies movies;

    public CategoryItemMovie(CategoryItem categoryItem, Movies movies) {
        this.categoryItem = categoryItem;
        this.movies = movies;
    }

    public CategoryItemMovie() {

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public CategoryItem getCategoryItem() {
        return categoryItem;
    }

    public void setCategoryItem(CategoryItem categoryItem) {
        this.categoryItem = categoryItem;
    }

    public Movies getMovies() {
        return movies;
    }

    public void setMovies(Movies movies) {
        this.movies = movies;
    }

}
