package com.ews.krs.dao;

import com.ews.krs.model.Subject;

import java.util.List;

public interface SubjectDao {
    int insertSubject(Subject subject);

    void editSubject(Subject newSubject);

    void deleteSubject(int id);

    Subject getSubject(int id);

    List<Subject> getAllSubject();
    List<Subject> getAllSubjectBySettingId(int setting_id);

    List<Subject> searchSubject(String subjectName);


}
