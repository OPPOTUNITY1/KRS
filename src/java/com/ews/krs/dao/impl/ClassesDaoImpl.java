/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ews.krs.dao.impl;

import com.ews.krs.dao.ClassDao;
import com.ews.krs.dao.MyDAO;
import com.ews.krs.model.ClassExtends;
import com.ews.krs.model.Classes;
import java.util.ArrayList;
import java.util.List;
import java.sql.SQLException;

/**
 *
 * @author ADMIN
 */
public class ClassesDaoImpl extends MyDAO implements ClassDao {

    @Override
    public void insertClass(Classes newClass) {
        try {
            ps = con.prepareStatement("INSERT INTO class ( class_id, class_name, description, created_at, created_by, updated_at, updated_by, teacher_id, setting_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
            ps.setInt(1, newClass.getClassId());
            ps.setString(2, newClass.getClassName());
            ps.setString(3, newClass.getDescription());
            ps.setDate(4, newClass.getCreatedAt());
            ps.setInt(5, newClass.getCreatedBy());
            ps.setDate(6, newClass.getUpdatedAt());
            ps.setInt(7, newClass.getUpdatedBy());
            ps.setInt(8, newClass.getTeacherId());
            ps.setInt(9, newClass.getSettingId());
            ps.executeUpdate();
            ps.close();
        } catch (SQLException e) {
            System.out.println("++/ Insert class failed: " + e.getMessage());
        }
    }

    @Override
    public void editClass(Classes newClass) {
        try {
            ps = con.prepareStatement("Update class set class_name = ?, description = ?, created_at = ?, created_by = ?, updated_at = ?, updated_by = ?, teacher_id = ?, setting_id = ? WHERE class_id = ?");
            ps.setString(1, newClass.getClassName());
            ps.setString(2, newClass.getDescription());
            ps.setDate(3, newClass.getCreatedAt());
            ps.setInt(4, newClass.getCreatedBy());
            ps.setDate(5, newClass.getUpdatedAt());
            ps.setInt(6, newClass.getUpdatedBy());
            ps.setInt(7, newClass.getTeacherId());
            ps.setInt(8, newClass.getSettingId());
            ps.setInt(9, newClass.getClassId());
            int rowsAffected = ps.executeUpdate();
            System.out.println("Class updated, rows affected: " + rowsAffected);

            ps.close();
        } catch (SQLException e) {
            System.out.println("++/ Edit class failed: " + e.getMessage());
        }
    }

    @Override
    public void deleteClass(int class_id) {
        try {
            String sql = "delete from class where class_id=?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, class_id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("--Delete class failed" + e.getMessage());
        }
    }

    @Override
    public Classes getClass(String className) {
        try {
            ps = con.prepareStatement("Select * from class where class_name like ?");
            ps.setString(1, "%" + className + "%");
            rs = ps.executeQuery();
            if (rs.next()) {
                Classes classes = new Classes();
                classes.setClassId(rs.getInt(1));
                classes.setClassName(rs.getString(2));
                classes.setDescription(rs.getString(3));
                classes.setCreatedAt(rs.getDate(4));
                classes.setCreatedBy(rs.getInt(5));
                classes.setUpdatedAt(rs.getDate(6));
                classes.setUpdatedBy(rs.getInt(7));
                classes.setTeacherId(rs.getInt(8));
                classes.setSettingId(rs.getInt(9));
                ps.close();
                rs.close();
                return classes;
            }
        } catch (SQLException e) {
            System.out.println("++/ Get class by name failed: " + e.getMessage());
        }
        return null;
    }

    @Override
    public Classes getClass(int classId) {
        try {
            ps = con.prepareStatement("Select * from class where class_id = ?");
            ps.setInt(1, classId);
            rs = ps.executeQuery();
            if (rs.next()) {
                Classes classes = new Classes();
                classes.setClassId(rs.getInt(1));
                classes.setClassName(rs.getString(2));
                classes.setDescription(rs.getString(3));
                classes.setCreatedAt(rs.getDate(4));
                classes.setCreatedBy(rs.getInt(5));
                classes.setUpdatedAt(rs.getDate(6));
                classes.setUpdatedBy(rs.getInt(7));
                classes.setTeacherId(rs.getInt(8));
                classes.setSettingId(rs.getInt(9));
                ps.close();
                rs.close();
                return classes;
            }
        } catch (SQLException e) {
            System.out.println("++/ Get class by id failed: " + e.getMessage());
        }
        return null;
    }

    @Override
    public List<ClassExtends> getAllClass() {
        List<ClassExtends> list = new ArrayList<>();
        try {
            ps = con.prepareStatement("""
                                      SELECT class.class_id,class.class_name,class.description,class.created_at,class.created_by,class.updated_at,class.updated_by,class.teacher_id,class.setting_id,Count(class_list.class_id),user.fullname
                                      FROM class left join class_list on class.class_id=class_list.class_id 
                                      inner join user on class.teacher_id=user.user_id
                                      group by class.class_id;""");
            rs = ps.executeQuery();
            while (rs.next()) {
                ClassExtends classes = new ClassExtends();
                classes.setClassId(rs.getInt(1));
                classes.setClassName(rs.getString(2));
                classes.setDescription(rs.getString(3));
                classes.setCreatedAt(rs.getDate(4));
                classes.setCreatedBy(rs.getInt(5));
                classes.setUpdatedAt(rs.getDate(6));
                classes.setUpdatedBy(rs.getInt(7));
                classes.setTeacherId(rs.getInt(8));
                classes.setSettingId(rs.getInt(9));
                classes.setNumOfStudents(rs.getString(10));
                classes.setTeacherName(rs.getString(11));
                list.add(classes);
            }
        } catch (SQLException e) {
            // Handle exceptions (logging, rethrowing, etc.)
            System.out.println("++/Get all class failed: " + e.getMessage());
        }
        return list;
    }

    @Override
    public List<ClassExtends> getAllClassByTeacherId(int id) {
        List<ClassExtends> list = new ArrayList<>();
        try {
                        ps = con.prepareStatement("""
                                      SELECT class.class_id,class.class_name,class.description,class.created_at,class.created_by,class.updated_at,class.updated_by,class.teacher_id,class.setting_id,Count(class_list.class_id),user.fullname
                                      FROM class left join class_list on class.class_id=class_list.class_id 
                                      inner join user on class.teacher_id=user.user_id
                                      where teacher_id=?
                                      group by class.class_id;""");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                ClassExtends classes = new ClassExtends();
                classes.setClassId(rs.getInt(1));
                classes.setClassName(rs.getString(2));
                classes.setDescription(rs.getString(3));
                classes.setCreatedAt(rs.getDate(4));
                classes.setCreatedBy(rs.getInt(5));
                classes.setUpdatedAt(rs.getDate(6));
                classes.setUpdatedBy(rs.getInt(7));
                classes.setTeacherId(rs.getInt(8));
                classes.setSettingId(rs.getInt(9));
                classes.setNumOfStudents(rs.getString(10));
                classes.setTeacherName(rs.getString(11));
                list.add(classes);
            }
        } catch (SQLException e) {
            // Handle exceptions (logging, rethrowing, etc.)
            System.out.println("++/Get all class by teacher_id failed: " + e.getMessage());
        }
        return list;
    }

    @Override
    public List<ClassExtends> getSearchResult(String searchId, String searchName) {
        List<ClassExtends> list = new ArrayList<>();
        try {
            ps = con.prepareStatement("""
                                      SELECT class.class_id,class.class_name,class.description,class.created_at,class.created_by,class.updated_at,class.updated_by,class.teacher_id,class.setting_id,Count(class_list.class_id),user.fullname
                                                                            FROM class left join class_list on class.class_id=class_list.class_id 
                                                                            inner join user on class.teacher_id=user.user_id
                                                                            where class.class_id like ? and class.class_name like ?
                                                                            group by class.class_id """);
            ps.setString(1, "%" + searchId + "%");
            ps.setString(2, "%" + searchName + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                ClassExtends classes = new ClassExtends();
                classes.setClassId(rs.getInt(1));
                classes.setClassName(rs.getString(2));
                classes.setDescription(rs.getString(3));
                classes.setCreatedAt(rs.getDate(4));
                classes.setCreatedBy(rs.getInt(5));
                classes.setUpdatedAt(rs.getDate(6));
                classes.setUpdatedBy(rs.getInt(7));
                classes.setTeacherId(rs.getInt(8));
                classes.setSettingId(rs.getInt(9));
                classes.setNumOfStudents(rs.getString(10));
                classes.setTeacherName(rs.getString(11));
                list.add(classes);
            }
        } catch (SQLException e) {
            // Handle exceptions (logging, rethrowing, etc.)
            System.out.println("++/Get all class by teacher_id failed: " + e.getMessage());
        }
        return list;
    }

}
