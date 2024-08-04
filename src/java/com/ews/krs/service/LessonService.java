package com.ews.krs.service;

import com.ews.krs.model.Lesson;

import java.util.List;

public interface LessonService {
    void insertLesson(Lesson lesson);

    void editLesson(Lesson newLesson);

    void deleteLesson(int id);

    Lesson getLesson(int id);

    List<Lesson> getAllLesson();

    List<Lesson> searchLesson(String title);
    List<Lesson> getAllLessonBySubjectId(int subject_id);

}
