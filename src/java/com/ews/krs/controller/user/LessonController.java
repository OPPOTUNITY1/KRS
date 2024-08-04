package com.ews.krs.controller.user;

import com.ews.krs.model.*;
import com.ews.krs.service.*;
import com.ews.krs.service.impl.*;
import com.ews.krs.util.MailUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.*;

public class LessonController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if(user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
        }
        if(user != null) {
            String xSubject_id = request.getParameter("subject_id");
            int subject_id = -1;

            try {
                subject_id = Integer.parseInt(xSubject_id);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }

            //Lesson
            LessonService lessonService = new LessonServiceImpl();
            Map<Lesson, List<Lesson>> lessonMap = new HashMap<>();
            List<Lesson> lessonListTemp = lessonService.getAllLesson();
            List<Lesson> lessonList = lessonService.getAllLessonBySubjectId(subject_id);

            for(Lesson lesson : lessonList){
                if(lesson.getParent_id() == 0) {
                    lessonMap.put(lesson, new ArrayList<>());
                }
            }

            for(Lesson lesson_parent : lessonMap.keySet()) {
                for(Lesson lesson : lessonListTemp) {
                    if(lesson_parent.getLesson_id() == lesson.getParent_id()) {
                        lessonMap.get(lesson_parent).add(lesson);
                    }
                }
            }

            request.setAttribute("lessonMap", lessonMap);




            if(lessonMap.isEmpty()) {
                request.setAttribute("alertLessonMap", "List of empty lessons!");
            }
            request.setAttribute("subject_id", xSubject_id);

            SubjectService subjectService = new SubjectServiceImpl();
            List<Subject> subjectList = subjectService.getAllSubject();
            for(Subject subject : subjectList){
                if(subject.getSubject_id() == subject_id) {
                    request.setAttribute("subject", subject);
                    break;
                }
            }

            String searchValue = request.getParameter("searchLessonValue");
            List<Lesson> lessonsSearch = null;
            if(searchValue != null) {
                lessonsSearch = lessonService.searchLesson(searchValue);
                request.setAttribute("lessonsSearch", lessonsSearch);
                request.setAttribute("isSearchLesson", "search_lesson_true");
            }
            request.getRequestDispatcher("/view/user/lessons.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            doGet(request, response);
    }
}
