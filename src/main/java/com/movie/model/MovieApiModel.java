package com.movie.model;

import javax.persistence.Column;
import java.util.Date;
import java.util.List;

public class MovieApiModel {
    private int id;
    private String name;
    private String thumbnail;
    private String banner;
    private int views;
    private String descreption;
    private String duration;
    private int active;
    private Date dateAired;
    private String quality;
    private String createBy;
    private Date createDate;
    private String actor;
    List<MovieDetailApiModel> movieDetail;
    List<CategoryItemApiModel> categoryItem;

    @Override
    public String toString() {
        return "MovieApiModel{" +
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

    public List<MovieDetailApiModel> getMovieDetail() {
        return movieDetail;
    }

    public void setMovieDetail(List<MovieDetailApiModel> movieDetail) {
        this.movieDetail = movieDetail;
    }

    public List<CategoryItemApiModel> getCategoryItem() {
        return categoryItem;
    }

    public void setCategoryItem(List<CategoryItemApiModel> categoryItem) {
        this.categoryItem = categoryItem;
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

    public void setName(String name) {
        this.name = name;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public String getBanner() {
        return banner;
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

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
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
}
