package com.ews.krs.service;

import com.ews.krs.model.User;

import java.util.List;

public interface UserService {

    void insertUser(User user);

    void editUser(User user);

    void deleteUser(int id);

    User getUser(String username);

    User getUser(int id);

    User loginUser(String username, String password);

    User getUserByEmail(String email);

    boolean registerUser(String username, String password, String email, String fullName);

    List<User> getAllUser();

    List<User> searchUser(String keyword);

    boolean checkExistEmail(String email);

    boolean checkExistUsername(String username);

    boolean isUserExistsByPhone(String phone);
}
