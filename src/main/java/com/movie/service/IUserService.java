package com.movie.service;

import com.movie.entity.UserEntity;

import java.util.List;

public interface IUserService {
    UserEntity findByEmailAndPassword(String email, String password);
    void insertUser(UserEntity userEntity);
    void updateUser(UserEntity userEntity);
    void deleteUser(int id);
    UserEntity findByEmail(String email);
    List<UserEntity> findAll();
    UserEntity findById(int id);
    UserEntity findByEmailAndId(String email, int id);
}
