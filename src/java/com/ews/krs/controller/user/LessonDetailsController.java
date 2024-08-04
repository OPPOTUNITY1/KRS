package com.ews.krs.controller.user;

import com.ews.krs.model.*;
import com.ews.krs.service.*;
import com.ews.krs.service.impl.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class LessonDetailsController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String xSubject_id = request.getParameter("subject_id");
        int subject_id = 0;
        try {
            subject_id = Integer.parseInt(xSubject_id);
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
        request.setAttribute("subject_id", subject_id);
        String xLesson_id = request.getParameter("lesson_id");
        int lesson_id = 0;
        try {
            lesson_id = Integer.parseInt(xLesson_id);
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }

        LessonService lessonService = new LessonServiceImpl();
        Lesson lesson = lessonService.getLesson(lesson_id);
        request.setAttribute("lesson", lesson);

        SubjectService subjectService = new SubjectServiceImpl();
        List<Subject> subjectList = subjectService.getAllSubject();
        for(Subject subject : subjectList){
            if(subject.getSubject_id() == subject_id) {
                request.setAttribute("subject", subject);
                break;
            }
        }

        //Lesson
        Map<Lesson, List<Lesson>> lessonMap = new HashMap<>();
        List<Lesson> lessonListTemp = lessonService.getAllLesson();
        List<Lesson> lessonList = lessonService.getAllLessonBySubjectId(subject_id);

        for(Lesson lessonTemp : lessonList){
            if(lessonTemp.getParent_id() == 0) {
                lessonMap.put(lessonTemp, new ArrayList<>());
            }
        }

        for(Lesson lesson_parent : lessonMap.keySet()) {
            for(Lesson lessonValue : lessonListTemp) {
                if(lesson_parent.getLesson_id() == lessonValue.getParent_id()) {
                    lessonMap.get(lesson_parent).add(lessonValue);
                }
            }
        }

        request.setAttribute("lessonMap", lessonMap);



        request.getRequestDispatcher("/view/user/lesson-details.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}
