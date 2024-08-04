/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ews.krs.dao.impl;

import com.ews.krs.dao.ClassListDao;
import com.ews.krs.dao.MyDAO;
import com.ews.krs.model.ClassList;
import com.ews.krs.model.User;
import java.util.ArrayList;
import java.util.List;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;

/**
 *
 * @author ADMIN
 */
public class ClassListDaoImpl extends MyDAO implements ClassListDao{

    @Override
    public void insertClassList(ClassList newClass) {
        try {
            ps = con.prepareStatement("INSERT INTO class_list (list_id,class_id,user_id ) VALUES (?, ?, ?)");
            ps.setInt(1, newClass.getListId());
            ps.setInt(2, newClass.getClassId());
            ps.setInt(3, newClass.getUserId());
            ps.executeUpdate();
            ps.close();
        } catch (SQLException e) {
            System.out.println("++/ Insert class list failed: " + e.getMessage());
        }
    }

    @Override
    public void editClassList(ClassList newClass) {
        try {
            ps = con.prepareStatement("Update class set class_id = ?, user_id = ? WHERE list_id = ?");
            ps.setInt(1, newClass.getClassId());
            ps.setInt(2, newClass.getUserId());
            ps.setInt(3, newClass.getListId());
            int rowsAffected = ps.executeUpdate();
            System.out.println("Class list updated, rows affected: " + rowsAffected);

            ps.close();
        } catch (SQLException e) {
            System.out.println("++/ Edit class list failed: " + e.getMessage());
        }
    }

    @Override
    public void deleteClassList(int list_id) {
        try {
            String sql = "delete from class_list where list_id=?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, list_id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("--Delete class list failed" + e.getMessage());
        }
    }

    @Override
    public List<User> getAllStudentByClass(int classId) {
        User user = null;
        List<User> list = new ArrayList<>();
        try {
            ps = con.prepareStatement("select * from user right join class_list on user.user_id=class_list.user_id where class_list.class_id=?");
            ps.setInt(1, classId);
            rs = ps.executeQuery();
            while (rs.next()) {
                user = new User();
                user.setUser_id(rs.getInt("user_id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setFullname(rs.getString("fullname"));
                user.setPhone(rs.getString("phone"));
                user.setGender(rs.getString("gender"));
                user.setEmail(rs.getString("email"));
                Timestamp dobTimestamp = rs.getTimestamp("dob");
                if (dobTimestamp != null) {
                    user.setDob(new Date(dobTimestamp.getTime()));
                } else {
                    user.setDob(null);
                }
                user.setAvatar(rs.getString("avatar"));
                user.setCreated_at(rs.getTimestamp("created_at"));
                user.setUpdated_at(rs.getTimestamp("updated_at"));
                user.setStatus(rs.getInt("status"));
                user.setIsVerified_email(rs.getInt("isVerified_email"));
                user.setSetting_id(rs.getInt("setting_id"));
                list.add(user);
            }
        } catch (SQLException e) {
            // Handle exceptions (logging, rethrowing, etc.)
            System.out.println("++/Get all student by class failed: " + e.getMessage());
        }
        return list;
    }

    @Override
    public List<ClassList> getAllClass() {
        List<ClassList> list = new ArrayList<>();
        try {
            ps = con.prepareStatement("SELECT * FROM class_list");
            rs = ps.executeQuery();
            while (rs.next()) {
                ClassList classes = new ClassList();
                classes.setListId(rs.getInt(1));
                classes.setClassId(rs.getInt(2));
                classes.setListId(rs.getInt(3));
                list.add(classes);
            }
        } catch (SQLException e) {
            // Handle exceptions (logging, rethrowing, etc.)
            System.out.println("++/Get all class list failed: " + e.getMessage());
        }
        return list;
    }

}
