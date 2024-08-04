package com.ews.krs.service.impl;

import com.ews.krs.dao.SubjectDao;
import com.ews.krs.dao.impl.SubjectDaoImpl;
import com.ews.krs.model.Subject;
import com.ews.krs.service.SubjectService;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;

public class SubjectServiceImpl implements SubjectService {
    SubjectDao subjectDao = new SubjectDaoImpl();
    @Override
    public int insertSubject(Subject subject) {
        return subjectDao.insertSubject(subject);
    }

    @Override
    public List<Subject> getAllSubjectBySettingId(int setting_id) {
        return subjectDao.getAllSubjectBySettingId(setting_id);
    }

    @Override
    public void editSubject(Subject newSubject) {
        subjectDao.editSubject(newSubject);
    }

    @Override
    public void deleteSubject(int id) {
        subjectDao.deleteSubject(id);
    }

    @Override
    public Subject getSubject(int id) {
        return subjectDao.getSubject(id);
    }

    @Override
    public List<Subject> getAllSubject() {
        return subjectDao.getAllSubject();
    }

    @Override
    public List<Subject> searchSubject(String subjectName) {
        return subjectDao.searchSubject(subjectName);
    }

    @Override
    public List<Subject> getListByPage(List<Subject> list,int start,int end) {
        ArrayList<Subject> arr = new ArrayList<>();
        for(int i = start; i<end;i++) {
            arr.add(list.get(i));
        }
        return arr;
    }
}
