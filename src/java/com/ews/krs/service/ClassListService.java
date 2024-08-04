/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.ews.krs.service;

import com.ews.krs.model.ClassList;
import com.ews.krs.model.User;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public interface ClassListService {
    void insertClassList(ClassList newClass);

    void editClassList(ClassList newClass);

    void deleteClassList(int setting_id);
    
    List<User> getAllStudentByClass(int classId);
    
    List<ClassList> getAllClass();
}
