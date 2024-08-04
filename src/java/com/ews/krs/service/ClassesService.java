/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.ews.krs.service;

import com.ews.krs.model.ClassExtends;
import com.ews.krs.model.Classes;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public interface ClassesService {
    void insertClass(Classes newClass);

    void editClass(Classes newClass);

    void deleteClass(int classId);

    Classes getClass(String className);
    
    Classes getClass(int classId);
    
    List<ClassExtends> getAllClass();
    
    List<ClassExtends> getAllClassByTeacherId(int id);

    List<ClassExtends> getSearchResult(String searchId, String searchName);
}
