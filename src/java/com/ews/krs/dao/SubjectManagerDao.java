package com.ews.krs.dao;

import com.ews.krs.model.SubjectManager;

import java.util.List;

public interface SubjectManagerDao {
    void insertSubjectManager(SubjectManager subjectManager);

    void editSubjectManager(SubjectManager newSubjectManager);

    void deleteSubjectManager(int userId, int subjectId);

    SubjectManager getSubjectManager(int userId, int subjectId);

    List<SubjectManager> getAllSubjectManager();
    public int countTeacherSubject(int userId);
}
