package com.lyf.service;

import com.lyf.domain.User;

import java.util.List;

public interface IUserService {

    User selectUser(long userId);
    List<User> findAll();

    void save(User user);

    void delete(Integer id);

    User findById(Integer id);

    void update(User user);
}
