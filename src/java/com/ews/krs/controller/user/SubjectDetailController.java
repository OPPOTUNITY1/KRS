package com.ews.krs.controller.user;


import com.ews.krs.dao.impl.MaterialDaoImpl;
import com.ews.krs.dao.impl.StudyDaoImpl;
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

public class SubjectDetailController extends HttpServlet {
    private MaterialDaoImpl mdi = new MaterialDaoImpl();
    private StudyDaoImpl sdi = new StudyDaoImpl();

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

        SystemSettingService systemSettingService = new SystemSettingServiceImpl();
        List<SystemSetting> systemSettingList = systemSettingService.getAllSystem_setting();
        SubjectManagerService subjectManagerService = new SubjectManagerServiceImpl();
        List<SubjectManager> subjectManagerList = subjectManagerService.getAllSubjectManager();
        UserService userService = new UserServiceImpl();


        SubjectService subjectService = new SubjectServiceImpl();
        List<Subject> subjectList = subjectService.getAllSubject();
        for(Subject subject : subjectList){
            if(subject.getSubject_id() == subject_id) {
                for(SystemSetting systemSetting : systemSettingList){
                    if(systemSetting.getSetting_id() == subject.getSetting_id()) {
                        subject.setCategoryName(systemSetting.getSetting_value());
                    }
                }
                for(SubjectManager subjectManager : subjectManagerList){
                    if(subjectManager.getSubject_id() == subject.getSubject_id()) {
                        User xUser = userService.getUser(subjectManager.getUser_id());
                        request.setAttribute("xUser", xUser);
                        subject.setTeacherName(xUser.getFullname());
                    }
                }

                Material m = null;
                for (Material material : mdi.getAll()) {
                    if (material.getSubject_id() == subject_id) {
                        m = material;
                        break;
                    }
                }

                StudySet set = null;
                for (StudySet s : sdi.getAll()) {
                    if (s.getSubjectId() == subject_id) {
                        set = s;
                        break;
                    }
                }

                if (set != null) {
                    request.setAttribute("studyset", set);
                }
                if (m != null) {
                    request.setAttribute("material", m.getMaterialFile());
                }

                request.setAttribute("subject", subject);
                break;
            }
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


        int totalLessons = 0;
        for (List<Lesson> lessonListCount : lessonMap.values()) {
            totalLessons += lessonListCount.size();
        }

        request.setAttribute("totalLessons", totalLessons);

        request.getRequestDispatcher("/view/user/subject-details.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}