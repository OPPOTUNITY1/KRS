package com.ews.krs.service.impl;

import com.ews.krs.dao.SubjectManagerDao;
import com.ews.krs.dao.impl.SubjectManagerDaoImpl;
import com.ews.krs.model.SubjectManager;
import com.ews.krs.service.SubjectManagerService;
import com.ews.krs.service.SubjectService;

import java.util.List;

public class SubjectManagerServiceImpl implements SubjectManagerService {
    SubjectManagerDao subjectManagerDao = new SubjectManagerDaoImpl();
    @Override
    public void insertSubjectManager(SubjectManager subjectManager) {
        subjectManagerDao.insertSubjectManager(subjectManager);
    }

    @Override
    public void editSubjectManager(SubjectManager newSubjectManager) {

    }

    @Override
    public void deleteSubjectManager(int userId, int subjectId) {
        subjectManagerDao.deleteSubjectManager(userId,subjectId);
    }

    @Override
    public SubjectManager getSubjectManager(int id) {
        return null;
    }

    @Override
    public List<SubjectManager> getAllSubjectManager() {
        return subjectManagerDao.getAllSubjectManager();
    }

    @Override
    public int countTeacherSubject(int userId) {
        return subjectManagerDao.countTeacherSubject(userId);
    }
}
