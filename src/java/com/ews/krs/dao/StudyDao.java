/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ews.krs.dao;

import com.ews.krs.model.StudySet;

/**
 *
 * @author admin
 */
public interface StudyDao {
    public void insertStudy(StudySet studyset);
    public void updateStudy(StudySet studyset);
    public void deleteStudy(StudySet studySet);
}
