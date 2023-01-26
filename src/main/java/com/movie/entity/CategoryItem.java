package com.movie.entity;

import javax.persistence.*;
import java.util.List;

@NamedQueries({
        @NamedQuery(name = "findCategoryItemByIdCategory", query = "select o from CategoryItem o where o.category.id = ?1"),
        @NamedQuery(name = "findCategoryItemByUrl", query = "select o from CategoryItem o where o.url = ?1"),
        @NamedQuery(name = "findCategoryItemByMovieId", query = "select o.categoryItem from CategoryItemMovie o where o.movies.id = ?1"),
        @NamedQuery(name = "findCategoryItemById", query = "select o from CategoryItem o where o.id = ?1"),
        @NamedQuery(name = "findAllCategoryItem", query = "SELECT o FROM CategoryItem o"),
        @NamedQuery(name = "findCategoryItemByUrlList", query = "SELECT o FROM CategoryItem o where o.url in (?1)"),

})
@Entity
@Table(name = "categoryitem", uniqueConstraints = {@UniqueConstraint(columnNames = {"categoryId"})
})
public class CategoryItem {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @ManyToOne @JoinColumn(name = "categoryId")
    Category category;

    @Column(name = "categoryName")
    private String categoryName;

    @Column(name = "url")
    private String url;

    @OneToMany(mappedBy = "categoryItem")
    List<CategoryItemMovie> listCategoryItemMovies;

    public CategoryItem(int id, String categoryName, String url) {
        this.id = id;
        this.categoryName = categoryName;
        this.url = url;
    }

    public CategoryItem(Category category, String categoryName, String url) {
        this.category = category;
        this.categoryName = categoryName;
        this.url = url;
    }

    public CategoryItem() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public List<CategoryItemMovie> getListCategoryItemMovies() {
        return listCategoryItemMovies;
    }

    public void setListCategoryItemMovies(List<CategoryItemMovie> listCategoryItemMovies) {
        this.listCategoryItemMovies = listCategoryItemMovies;
    }

}
