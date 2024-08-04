package com.ews.krs.service.impl;

import com.ews.krs.dao.LessonDao;
import com.ews.krs.dao.impl.LessonDaoImpl;
import com.ews.krs.model.Lesson;
import com.ews.krs.service.LessonService;

import java.util.List;

public class LessonServiceImpl implements LessonService {
    LessonDao lessonDao = new LessonDaoImpl();

    @Override
    public List<Lesson> getAllLessonBySubjectId(int subject_id) {
        return lessonDao.getAllLessonBySubjectId(subject_id);
    }

    @Override
    public void insertLesson(Lesson lesson) {
        lessonDao.insertLesson(lesson);
    }

    @Override
    public void editLesson(Lesson newLesson) {
        lessonDao.editLesson(newLesson);
    }

    @Override
    public void deleteLesson(int id) {
        lessonDao.deleteLesson(id);
    }

    @Override
    public Lesson getLesson(int id) {
        return lessonDao.getLesson(id);
    }

    @Override
    public List<Lesson> getAllLesson() {
        return lessonDao.getAllLesson();
    }

    @Override
    public List<Lesson> searchLesson(String title) {
        return lessonDao.searchLesson(title);
    }
}
