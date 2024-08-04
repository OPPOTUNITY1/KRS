package com.ews.krs.controller.user;

import com.ews.krs.model.Subject;
import com.ews.krs.model.SubjectManager;
import com.ews.krs.model.SystemSetting;
import com.ews.krs.model.User;
import com.ews.krs.service.SubjectManagerService;
import com.ews.krs.service.SubjectService;
import com.ews.krs.service.SystemSettingService;
import com.ews.krs.service.UserService;
import com.ews.krs.service.impl.SubjectManagerServiceImpl;
import com.ews.krs.service.impl.SubjectServiceImpl;
import com.ews.krs.service.impl.SystemSettingServiceImpl;
import com.ews.krs.service.impl.UserServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.*;
@WebServlet({"/subject", "/subject/search/"})
public class SubjectController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);

        SubjectService subjectService = new SubjectServiceImpl();
        SystemSettingService systemSettingService = new SystemSettingServiceImpl();
        SubjectManagerService subjectManagerService = new SubjectManagerServiceImpl();
        UserService userService = new UserServiceImpl();

        List<Subject> subjectList = subjectService.getAllSubject();
        List<Subject> subjectListTemp = subjectService.getAllSubject();

        List<SystemSetting> systemSettingList = systemSettingService.getAllSystem_setting();
        List<SubjectManager> subjectManagerList = subjectManagerService.getAllSubjectManager();

        //Category
        Map<SystemSetting, List<Subject>> categoriesSubjectMap = new HashMap<>();

        for(SystemSetting systemSetting : systemSettingList){
            if( systemSetting.getSetting_name().equals("subject_category") && systemSetting.getSetting_type().equals("subject")) {
                categoriesSubjectMap.put(systemSetting, new ArrayList<>());
            }
        }

        for (SystemSetting systemSetting : systemSettingList) {
            if( systemSetting.getSetting_name().equals("subject_category") && systemSetting.getSetting_type().equals("subject")) {
                for(Subject subject : subjectList) {
                    if(subject.getSetting_id() == systemSetting.getSetting_id()) {
                        //Set category name for subject
                        subject.setCategoryName(systemSetting.getSetting_value());
                        categoriesSubjectMap.get(systemSetting).add(subject);
                    }
                }
            }
        }
        request.setAttribute("categoriesSubjectMap", categoriesSubjectMap);

        User user = null;

        //Teacher
        Map<User, List<Subject>> teacherSubjectMap = new HashMap<>();

        for(Subject subject : subjectList){
            for(SubjectManager subjectManager : subjectManagerList){
                if(subjectManager.getSubject_id() == subject.getSubject_id()){
                    int user_id = subjectManager.getUser_id();
                    User userTeacher = userService.getUser(user_id);
                    teacherSubjectMap.put(userTeacher, new ArrayList<>());
                }
            }
        }

        for(User teacher : teacherSubjectMap.keySet()){
            for(SubjectManager subjectManager : subjectManagerList){
                if(teacher.getUser_id() == subjectManager.getUser_id()){
                    int subject_id = subjectManager.getSubject_id();
                    teacherSubjectMap.get(teacher).add(subjectService.getSubject(subject_id));
                }
            }
            for(Subject subject : teacherSubjectMap.get(teacher)){
                int subjectSettingId = subject.getSetting_id();
                for (SystemSetting systemSetting : systemSettingList) {
                    if (systemSetting.getSetting_id() == subjectSettingId) {
                        subject.setCategoryName(systemSetting.getSetting_value());
                    }
                }
            }
        }

        //Set teacher name for subject
        for(User teacher : teacherSubjectMap.keySet()) {
            for (SubjectManager subjectManager : subjectManagerList) {
                if (teacher.getUser_id() == subjectManager.getUser_id()) {
                    int subject_id = subjectManager.getSubject_id();
                    for(Subject subject : subjectList){
                        if(subject.getSubject_id() == subject_id){
                            subject.setTeacherName(teacher.getFullname());
                        }
                    }
                }
            }
        }

        request.setAttribute("teacherSubjectMap", teacherSubjectMap);


        String searchValue = request.getParameter("searchValue");
        if(searchValue!= null && !searchValue.isEmpty()) {
            subjectListTemp = subjectService.searchSubject(searchValue);
            if(subjectListTemp.isEmpty()) {
                request.setAttribute("alertEmpty", "No subject is found!");
                request.getRequestDispatcher("/view/user/subject.jsp").forward(request, response);
                return;
            }
            for (SystemSetting systemSetting : systemSettingList) {
                if( systemSetting.getSetting_name().equals("subject_category") && systemSetting.getSetting_type().equals("subject")) {
                    for(Subject subject : subjectListTemp) {
                        if(subject.getSetting_id() == systemSetting.getSetting_id()) {
                            //Set category name for subject
                            subject.setCategoryName(systemSetting.getSetting_value());
                        }
                    }
                }
            }
            //Set teacher name for subject
            for(User teacher : teacherSubjectMap.keySet()) {
                for (SubjectManager subjectManager : subjectManagerList) {
                    if (teacher.getUser_id() == subjectManager.getUser_id()) {
                        int subject_id = subjectManager.getSubject_id();
                        for(Subject subject : subjectListTemp){
                            if(subject.getSubject_id() == subject_id){
                                subject.setTeacherName(teacher.getFullname());
                            }
                        }
                    }
                }
            }
        } else {
            subjectListTemp = subjectList;
        }

        //Pagination
        int size = subjectListTemp.size();
        int numPerPage = 6;
        int page;
        int numPage = size % numPerPage == 0? (int) size/numPerPage : (int) size/numPerPage + 1;
        String xPage = request.getParameter("page");

        if(xPage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xPage);
        }

        if(page < 1) {
            page = 1;
        }
        if(page > numPage) {
            page = numPage;
        }

        int start = (page-1)*numPerPage;
        int end = Math.min(page*numPerPage, size);

        String orderBy = request.getParameter("orderBy");

        if (orderBy == null) {
            subjectListTemp.sort(Comparator.comparing(Subject::getSubject_name));
        } else if (orderBy.equals("ZtoA")) {
            subjectListTemp.sort((s1, s2) -> s2.getSubject_name().compareTo(s1.getSubject_name()));
        } else if (orderBy.equals("rating")) {
            subjectListTemp.sort(Comparator.comparing(Subject::getRating).reversed());
        }

        List<Subject> subjectListPage = subjectService.getListByPage(subjectListTemp, start, end);

        request.setAttribute("subjectListPage", subjectListPage);
        request.setAttribute("subjectList", subjectListTemp);
        request.setAttribute("numPage", numPage);
        request.setAttribute("page", page);

        ArrayList<String> categories = new ArrayList<>();
        for (SystemSetting systemSetting : systemSettingList) {
            if( systemSetting.getSetting_name().equals("subject_category") && systemSetting.getSetting_type().equals("subject")) {
                String settingValue = systemSetting.getSetting_value();
                String capitalizedValue = capitalizeFirstLetter(settingValue);
                categories.add(capitalizedValue);
            }
        }
        if (session != null) {
            session.setAttribute("categories", categories);
        }

        request.getRequestDispatcher("/view/user/subject.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
    public static String capitalizeFirstLetter(String value) {
        return HomeController.capitalizeFirstLetter(value);
    }
}