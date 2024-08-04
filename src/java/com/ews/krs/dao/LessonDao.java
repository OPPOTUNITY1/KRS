package com.ews.krs.dao;

import com.ews.krs.model.Lesson;
import com.ews.krs.model.Subject;

import java.util.List;

public interface LessonDao {
    void insertLesson(Lesson lesson);

    void editLesson(Lesson newLesson);

    void deleteLesson(int id);

    Lesson getLesson(int id);

    List<Lesson> getAllLesson();

    List<Lesson> searchLesson(String title);
    List<Lesson> getAllLessonBySubjectId(int subject_id);
}
