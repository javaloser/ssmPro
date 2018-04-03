package com.lyf.dao;

import com.lyf.domain.User;

import java.util.List;

public interface IUserDao {
    User selectUser(long id);

    List<User> findAll();

    void save(User user);

    void delete(Integer id);

    User findById(Integer id);

    void update(User user);
}
