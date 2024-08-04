package com.ews.krs.service;

import com.ews.krs.model.Subject;

import java.util.ArrayList;
import java.util.List;

public interface SubjectService {
    int insertSubject(Subject subject);

    void editSubject(Subject newSubject);

    void deleteSubject(int id);

    Subject getSubject(int id);

    List<Subject> getAllSubject();

    List<Subject> searchSubject(String subjectName);
    List<Subject> getListByPage(List<Subject> list, int start, int end);
    List<Subject> getAllSubjectBySettingId(int setting_id);

}
