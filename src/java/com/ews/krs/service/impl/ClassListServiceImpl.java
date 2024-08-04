/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ews.krs.service.impl;

import com.ews.krs.dao.ClassListDao;
import com.ews.krs.dao.impl.ClassListDaoImpl;
import com.ews.krs.model.ClassList;
import com.ews.krs.model.User;
import com.ews.krs.service.ClassListService;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class ClassListServiceImpl implements ClassListService{
    ClassListDao classListDao= new ClassListDaoImpl();
    @Override
    public void insertClassList(ClassList newClass) {
        classListDao.insertClassList(newClass);
    }

    @Override
    public void editClassList(ClassList newClass) {
        classListDao.editClassList(newClass);
    }

    @Override
    public void deleteClassList(int setting_id) {
        classListDao.deleteClassList(setting_id);
    }

    @Override
    public List<User> getAllStudentByClass(int classId) {
        return classListDao.getAllStudentByClass(classId);
    }

    @Override
    public List<ClassList> getAllClass() {
        return classListDao.getAllClass();
    }
    
}
