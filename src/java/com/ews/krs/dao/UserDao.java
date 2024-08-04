package com.ews.krs.dao;

import com.ews.krs.model.User;
import com.ews.krs.util.ForeignKeyConstraintException;

import java.util.List;

public interface UserDao {

    void insertUser(User user);

    void editUser(User user);

    void deleteUser(int id) throws ForeignKeyConstraintException;

    List<User> searchUser(String username);

    User getUser(String username);

    User getUser(int id);

    User getUserByID(int uID);

    List<User> getAllUser();

    User getUserByEmail(String email);

    List<User> searchUser(String searchId, String searchName, String searchRole);

    boolean checkExistEmail(String email);

    boolean checkExistUsername(String username);

    List<User> getUsersBySettingId(int settingId);

    public void editUsers(User newUser);

    public List<User> searchUserByRole(String roleName);

    boolean isUserExistsByPhone(String phone);
}
