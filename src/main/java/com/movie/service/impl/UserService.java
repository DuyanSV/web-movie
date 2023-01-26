package com.movie.service.impl;

import com.movie.dao.IUserDao;
import com.movie.entity.UserEntity;
import com.movie.service.IUserService;

import javax.inject.Inject;
import java.util.List;

public class UserService implements IUserService {
    @Inject
    private IUserDao userDao;

    @Override
    public UserEntity findByEmailAndPassword(String email, String password) {
        return userDao.findByEmailAndPassword(email, password);
    }

    @Override
    public void insertUser(UserEntity userEntity) {
        userDao.insertUser(userEntity);
    }

    @Override
    public void updateUser(UserEntity userEntity) {
        userDao.updateUser(userEntity);
    }

    @Override
    public void deleteUser(int id) {
        UserEntity userEntity = userDao.findById(id);
        userDao.deleteUser(userEntity);
    }

    @Override
    public UserEntity findByEmail(String email) {
        return userDao.findByEmail(email);
    }

    @Override
    public List<UserEntity> findAll() {
        return userDao.findAll();
    }

    @Override
    public UserEntity findById(int id) {
        return userDao.findById(id);
    }

    @Override
    public UserEntity findByEmailAndId(String email, int id) {
        return userDao.findByEmailAndId(email, id);
    }
}
