/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.ews.krs.dao;

import com.ews.krs.model.ClassExtends;
import com.ews.krs.model.Classes;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public interface ClassDao {
    void insertClass(Classes systemSetting);

    void editClass(Classes newClass);

    void deleteClass(int setting_id);

    Classes getClass(String className);

    Classes getClass(int classId);

    List<ClassExtends> getAllClass();

    List<ClassExtends> getAllClassByTeacherId(int id);
    
    List<ClassExtends> getSearchResult(String searchId, String searchName);

}

