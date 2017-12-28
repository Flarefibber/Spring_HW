package com.spring.service;

import com.spring.model.User;

public interface UserService {

    void save(User user);

    User findByUsername(String username);
}
