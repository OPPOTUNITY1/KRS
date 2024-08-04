/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ews.krs.service.impl;

import com.ews.krs.dao.ClassDao;
import com.ews.krs.dao.impl.ClassesDaoImpl;
import com.ews.krs.model.ClassExtends;
import com.ews.krs.model.Classes;
import com.ews.krs.service.ClassesService;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class ClassesServiceImpl implements ClassesService{
    ClassDao classDao = new ClassesDaoImpl();

    @Override
    public void insertClass(Classes newClass) {
        classDao.insertClass(newClass);
    }

    @Override
    public void editClass(Classes newClass) {
        classDao.editClass(newClass);
    }

    @Override
    public void deleteClass(int classId) {
        classDao.deleteClass(classId);
    }

    @Override
    public Classes getClass(String className) {
        return classDao.getClass(className);
    }

    @Override
    public Classes getClass(int classId) {
        return classDao.getClass(classId);
    }

    @Override
    public List<ClassExtends> getAllClass() {
        return classDao.getAllClass();
    }

    @Override
    public List<ClassExtends> getAllClassByTeacherId(int id) {
        return classDao.getAllClassByTeacherId(id);
    }

    @Override
    public List<ClassExtends> getSearchResult(String searchId, String searchName) {
        return classDao.getSearchResult(searchId, searchName);
    }
    
}
