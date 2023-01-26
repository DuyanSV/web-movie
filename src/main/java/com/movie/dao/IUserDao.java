package com.movie.dao;

import com.movie.entity.UserEntity;

import java.util.List;

public interface IUserDao extends GenegicDao<UserEntity>{
    UserEntity findByEmailAndPassword(String email, String password);
    void insertUser(UserEntity userEntity);
    void updateUser(UserEntity userEntity);
    void deleteUser(UserEntity userEntity);
    UserEntity findByEmail(String email);
    List<UserEntity> findAll();
    UserEntity findById(int id);
    UserEntity findByEmailAndId(String email, int id);
}
