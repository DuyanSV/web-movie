package com.movie.dao.impl;

import com.movie.constant.MethodConstant;
import com.movie.dao.IUserDao;
import com.movie.entity.UserEntity;

import java.util.List;

public class UserDao extends AbstractDao<UserEntity> implements IUserDao {
    @Override
    public UserEntity findByEmailAndPassword(String email, String password) {
        List<UserEntity> list = excuteQuery("findByEmailAndPassword", UserEntity.class, email, password);
        return list.isEmpty() ? null : list.get(0);
    }

    @Override
    public void insertUser(UserEntity userEntity) {
        excuteUpdate(userEntity, MethodConstant.INSERT);
    }

    @Override
    public void updateUser(UserEntity userEntity) {
        excuteUpdate(userEntity, MethodConstant.UPDATE);
    }

    @Override
    public void deleteUser(UserEntity userEntity) {
        excuteUpdate(userEntity, MethodConstant.DELETE);
    }


    @Override
    public UserEntity findByEmail(String email) {
        List<UserEntity> list = excuteQuery("findByEmail", UserEntity.class, email);
        return list.isEmpty() ? null : list.get(0);
    }

    @Override
    public List<UserEntity> findAll() {
        List<UserEntity> list = excuteQuery("findAll", UserEntity.class);
        return list.isEmpty() ? null : list;
    }

    @Override
    public UserEntity findById(int id) {
        List<UserEntity> list = excuteQuery("findById", UserEntity.class, id);
        return list.isEmpty() ? null : list.get(0);
    }

    @Override
    public UserEntity findByEmailAndId(String email, int id) {
        List<UserEntity> list = excuteQuery("findByEmailAndId", UserEntity.class, email, id);
        return list.isEmpty() ? null : list.get(0);
    }
}
