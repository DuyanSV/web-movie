package com.movie.entity;

import com.movie.dao.impl.LikeDao;
import com.movie.service.ILikeService;

import javax.inject.Inject;
import javax.persistence.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@NamedQueries({
        @NamedQuery(name = "findMovieByCategory", query = "select o.movies from CategoryItemMovie o where o.categoryItem.url = ?1"),
        @NamedQuery(name = "findMovieById", query = "select o from Movies o where o.id = ?1"),
        @NamedQuery(name = "findMovieBySlider", query = "select o.movies from Slider o order by o.stt asc"),
        @NamedQuery(name = "findAllMovie", query = "select o from Movies o"),
        @NamedQuery(name = "findMovieByKeyword", query = "select o from Movies o where o.name like ?1"),
        @NamedQuery(name = "findMovieTopView", query = "select o from Movies o order by o.views desc"),
        @NamedQuery(name = "findMovieRelated", query = "select o.movies from CategoryItemMovie o where o.categoryItem.url = ?1 and o.movies.id <> ?2"),
        @NamedQuery(name = "findMovieByProperties", query = "select o from Movies o where o.name = ?1 and o.thumbnail = ?2 and o.banner = ?3 and o.actor = ?4"),
        @NamedQuery(name = "findMovieTopLike", query = "select o.movies from Likes o group by o.movies order by count(o.movies) desc"),
        @NamedQuery(name = "findMovieNew", query = "select o from Movies o order by o.dateAired desc "),
        @NamedQuery(name = "findMovieByUserLike", query = "select o.movies from Likes o where o.user.id = ?1"),
        @NamedQuery(name = "findMovieVipByUser", query = "SELECT o.movies FROM UserMovie o where o.user.id = ?1 and o.movies.id = ?2"),

})


@NamedStoredProcedureQueries({
        @NamedStoredProcedureQuery(name = "findMovieByUserLike",
                procedureName = "findMovieByUserLike",
                parameters = {
                        @StoredProcedureParameter(name = "userId", type = Integer.class)},
                resultClasses = {Movies.class})
})

@Entity
@Table(name = "movies")
public class Movies {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "name")
    private String name;

    @Column(name = "thumbnail")
    private String thumbnail;

    @Column(name = "banner")
    private String banner;

    @Column(name = "views")
    private int views;

    @Column(name = "descreption")
    private String descreption;

    @Column(name = "duration")
    private String duration;

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    @Column(name = "active")
    private int active;

    @Column(name = "dateAired")
    private Date dateAired;

    @Column(name = "quality")
    private String quality;

    @Column(name = "createBy")
    private String createBy;

    @Column(name = "createDate")
    private Date createDate;

    @Column(name = "actor")
    private String actor;

    @Column(name = "vip")
    private int vip;

    @Column(name = "price")
    private int price;

    @OneToMany(mappedBy = "movies")
    List<CategoryItemMovie> listCategoryItemMovies;

    @OneToMany(mappedBy = "movies")
    List<MovieDetail> listMovieDetails;

    @OneToMany(mappedBy = "movies")
    List<Slider> listSlider;

    @OneToMany(mappedBy = "movies")
    List<Likes> listLikes;

    @OneToMany(mappedBy = "movies")
    List<Comments> listComments;

    @OneToMany(mappedBy = "movies")
    List<Star> listStars;

    @OneToMany(mappedBy = "movies")
    List<UserMovie> listUserMovie;

    public Movies(String name, String thumbnail, String banner, int views, String descreption, String duration, int active, Date dateAired, String quality, String createBy, Date createDate, String actor) {
        this.name = name;
        this.thumbnail = thumbnail;
        this.banner = banner;
        this.views = views;
        this.descreption = descreption;
        this.duration = duration;
        this.active = active;
        this.dateAired = dateAired;
        this.quality = quality;
        this.createBy = createBy;
        this.createDate = createDate;
        this.actor = actor;
    }

    public int getVip() {
        return vip;
    }

    public void setVip(int vip) {
        this.vip = vip;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int countLikes() {
        List<Likes> likesList = new LikeDao().findLikeByMovie(getId());
        return likesList == null ? 0 : likesList.size();
    }

    public Movies() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public String getDefaultDate() {
        String datee = new SimpleDateFormat("yyyy-MM-dd").format(dateAired);
        return datee;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public String getThumbnailUrl() {
        return thumbnail.substring(0, 4);
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public String getBanner() {
        return banner;
    }

    public String getBannerUrl() {
        return banner.substring(0, 4);
    }

    public void setBanner(String banner) {
        this.banner = banner;
    }

    public int getViews() {
        return views;
    }

    public void setViews(int views) {
        this.views = views;
    }

    public String getDescreption() {
        return descreption;
    }

    public void setDescreption(String descreption) {
        this.descreption = descreption;
    }

    public int getActive() {
        return active;
    }

    public void setActive(int active) {
        this.active = active;
    }

    public Date getDateAired() {
        return dateAired;
    }

    public void setDateAired(Date dateAired) {
        this.dateAired = dateAired;
    }

    public String getQuality() {
        return quality;
    }

    public void setQuality(String quality) {
        this.quality = quality;
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getActor() {
        return actor;
    }

    public void setActor(String actor) {
        this.actor = actor;
    }

    public List<CategoryItemMovie> getListCategoryItemMovies() {
        return listCategoryItemMovies;
    }

    public void setListCategoryItemMovies(List<CategoryItemMovie> listCategoryItemMovies) {
        this.listCategoryItemMovies = listCategoryItemMovies;
    }

    public List<MovieDetail> getListMovieDetails() {
        return listMovieDetails;
    }

    public void setListMovieDetails(List<MovieDetail> listMovieDetails) {
        this.listMovieDetails = listMovieDetails;
    }

    public List<Slider> getListSlider() {
        return listSlider;
    }

    public void setListSlider(List<Slider> listSlider) {
        this.listSlider = listSlider;
    }

    public List<Likes> getListLikes() {
        return listLikes;
    }

    public void setListLikes(List<Likes> listLikes) {
        this.listLikes = listLikes;
    }

    public List<Comments> getListComments() {
        return listComments;
    }

    public void setListComments(List<Comments> listComments) {
        this.listComments = listComments;
    }

    @Override
    public String toString() {
        return "Movies{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", thumbnail='" + thumbnail + '\'' +
                ", banner='" + banner + '\'' +
                ", views=" + views +
                ", descreption='" + descreption + '\'' +
                ", duration='" + duration + '\'' +
                ", active=" + active +
                ", dateAired=" + dateAired +
                ", quality='" + quality + '\'' +
                ", createBy='" + createBy + '\'' +
                ", createDate=" + createDate +
                ", actor='" + actor + '\'' +
                '}';
    }
}
