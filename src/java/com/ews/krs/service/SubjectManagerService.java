package com.ews.krs.service;

import com.ews.krs.model.SubjectManager;

import java.util.List;

public interface SubjectManagerService {
    void insertSubjectManager(SubjectManager subjectManager);

    void editSubjectManager(SubjectManager newSubjectManager);

    void deleteSubjectManager(int userId, int subjectId);

    SubjectManager getSubjectManager(int id);

    List<SubjectManager> getAllSubjectManager();

    public int countTeacherSubject(int userId);
}
