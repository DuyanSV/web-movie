package com.movie.entity;

import javax.persistence.*;
import java.util.List;

@NamedQueries({
        @NamedQuery(name = "findByEmailAndPassword", query = "SELECT o FROM UserEntity o WHERE o.email = ?1 and o.password = ?2"),
        @NamedQuery(name = "findByEmail", query = "SELECT o FROM UserEntity o WHERE o.email = ?1"),
        @NamedQuery(name = "findAll", query = "SELECT o FROM UserEntity o"),
        @NamedQuery(name = "findById", query = "SELECT o FROM UserEntity o WHERE o.id = ?1"),
        @NamedQuery(name = "findByEmailAndId", query = "SELECT o FROM UserEntity o WHERE o.email = ?1 and o.id <> ?2")
})
@Entity
@Table(name = "users")
public class UserEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "password")
    private String password;

    @Column(name = "fullname")
    private String fullname;

    @Column(name = "avatar")
    private String avatar;

    @Column(name = "email")
    private String email;

    @Column(name = "role")
    private int role;

    @Column(name = "active")
    private int active;

    @Column(name = "surplus")
    private int surplus;

    @OneToMany(mappedBy = "user")
    List<Likes> listLikes;

    @OneToMany(mappedBy = "user")
    List<Comments> listComments;

    @OneToMany(mappedBy = "user")
    List<UserMovie> listUserMovie;

    public UserEntity(String email, String fullname, String avatar, String password, int role, int active) {
        this.password = password;
        this.fullname = fullname;
        this.avatar = avatar;
        this.email = email;
        this.role = role;
        this.active = active;
    }

    public UserEntity(String password, String fullname, String avatar, String email, int role, int active, int surplus) {
        this.password = password;
        this.fullname = fullname;
        this.avatar = avatar;
        this.email = email;
        this.role = role;
        this.active = active;
        this.surplus = surplus;
    }

    public UserEntity() {

    }

    @Override
    public String toString() {
        return "UserEntity{" +
                "id=" + id +
                ", password='" + password + '\'' +
                ", fullname='" + fullname + '\'' +
                ", avatar='" + avatar + '\'' +
                ", email='" + email + '\'' +
                ", role=" + role +
                ", active=" + active +
                '}';
    }

    public int getSurplus() {
        return surplus;
    }

    public void setSurplus(int surplus) {
        this.surplus = surplus;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public int getActive() {
        return active;
    }

    public void setActive(int active) {
        this.active = active;
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

}
