package com.ews.krs.service.impl;

import com.ews.krs.dao.UserDao;
import com.ews.krs.dao.impl.UserDaoImpl;
import com.ews.krs.model.User;
import com.ews.krs.service.UserService;

import java.util.List;

import static com.ews.krs.util.PasswordUtils.verifyPassword;

public class UserServiceImpl implements UserService {
    UserDao userDao = new UserDaoImpl();

    @Override
    public User getUserByEmail(String email) {
        return userDao.getUserByEmail(email);
    }

    @Override
    public boolean isUserExistsByPhone(String phone) {
        return userDao.isUserExistsByPhone(phone);
    }

    @Override
    public void insertUser(User user) {
        userDao.insertUser(user);
    }

    @Override
    public void editUser(User user) {
        userDao.editUser(user);
    }

    @Override
    public void deleteUser(int id) {
    }

    @Override
    public User getUser(String username) {
        return userDao.getUser(username);
    }

    @Override
    public User getUser(int id) {
        return userDao.getUser(id);
    }

    @Override
    public User loginUser(String username, String password) {
        User user = userDao.getUser(username);
        if(user != null) {
            String hashedPassword =  user.getPassword();
            boolean isPasswordCorrect = verifyPassword(password, hashedPassword);
            if(isPasswordCorrect) {
                return user;
            }
        }
        return null;
    }

    @Override
    public boolean registerUser(String username, String password, String email, String fullName) {
        userDao.insertUser(new User(username, password, fullName, email));
        return true;
    }

    @Override
    public List<User> getAllUser() {
        return userDao.getAllUser();
    }

    @Override
    public List<User> searchUser(String keyword) {
        return null;
    }

    @Override
    public boolean checkExistEmail(String email) {
        return userDao.checkExistEmail(email);
    }

    @Override
    public boolean checkExistUsername(String username) {
        return userDao.checkExistUsername(username);
    }
}
