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
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.*;

public class FilterSubjectsController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(true);

        SubjectService subjectService = new SubjectServiceImpl();
        SystemSettingService systemSettingService = new SystemSettingServiceImpl();
        SubjectManagerService subjectManagerService = new SubjectManagerServiceImpl();
        UserService userService = new UserServiceImpl();

        List<SystemSetting> systemSettingList = systemSettingService.getAllSystem_setting();
        List<SubjectManager> subjectManagerList = subjectManagerService.getAllSubjectManager();
        List<Subject> subjectList = subjectService.getAllSubject();
        List<Subject> subjectListTemp = subjectService.getAllSubject();
        subjectList.clear();

        //Category
        Map<SystemSetting, List<Subject>> categoriesSubjectMap = new HashMap<>();

        for(SystemSetting systemSetting : systemSettingList){
            if( systemSetting.getSetting_name().equals("subject_category") && systemSetting.getSetting_type().equals("subject")) {
                categoriesSubjectMap.put(systemSetting, new ArrayList<>());
            }
        }

        for (SystemSetting systemSetting : systemSettingList) {
            if( systemSetting.getSetting_name().equals("subject_category") && systemSetting.getSetting_type().equals("subject")) {
                for(Subject subject : subjectListTemp) {
                    if(subject.getSetting_id() == systemSetting.getSetting_id()) {
                        //Set category name for subject
                        subject.setCategoryName(systemSetting.getSetting_value());
                        categoriesSubjectMap.get(systemSetting).add(subject);
                    }
                }
            }
        }
        request.setAttribute("categoriesSubjectMap", categoriesSubjectMap);

        //Teacher
        Map<User, List<Subject>> teacherSubjectMap = new HashMap<>();

        for(Subject subject : subjectListTemp){
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
                    for(Subject subject : subjectListTemp){
                        if(subject.getSubject_id() == subject_id){
                            subject.setTeacherName(teacher.getFullname());
                        }
                    }
                }
            }
        }

        request.setAttribute("teacherSubjectMap", teacherSubjectMap);

        //Rating
//        Map<Integer, List<Subject>> ratingCountsMap = new HashMap<>();
//        for (int i = 1; i <= 5; i++) {
//            ratingCountsMap.put(i, new ArrayList<>());
//        }
//        for (Subject subject : subjectListTemp) {
//            float rating = subject.getRating();
//            if (rating >= 1 && rating <= 5) {
//                int ratingInt = (int) rating;
//                ratingCountsMap.get(ratingInt).add(subject);
//            }
//        }
//
//        request.setAttribute("ratingCountsMap", ratingCountsMap);

        //Filter
        String[] selectedCategories = request.getParameterValues("categories");
        String[] selectedTeachers = request.getParameterValues("teachers");
//        String[] selectedRatings = request.getParameterValues("ratings");

        //Selected Categories
        if(selectedCategories != null) {
            for (String category : selectedCategories) {
                 for(SystemSetting systemSetting : categoriesSubjectMap.keySet()) {
                        if(systemSetting.getSetting_name().equalsIgnoreCase("subject_category") && systemSetting.getSetting_value().equalsIgnoreCase(category)) {
                            subjectList.addAll(categoriesSubjectMap.get(systemSetting));
                        }
                 }
            }
        }

        //Selected Teachers
        int[] selectedTeacherIds = null;
        if(selectedTeachers != null) {
            selectedTeacherIds = new int[selectedTeachers.length];
            try {
                for (int i = 0; i < selectedTeachers.length; i++) {
                    selectedTeacherIds[i] = Integer.parseInt(selectedTeachers[i]);
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }

            for (int  teacherId : selectedTeacherIds) {
                for(User teacher : teacherSubjectMap.keySet()) {
                    if(teacher.getUser_id() == teacherId) {
                        subjectList.addAll(teacherSubjectMap.get(teacher));
                        for(Subject subject : teacherSubjectMap.get(teacher)){
                            subject.setTeacherName(teacher.getFullname());
                        }
                    }
                }
            }
        }

//        //Select Rating
//        if(selectedRatings != null) {
//            int[] selectedRatingsIds = new int[selectedRatings.length];
//            try {
//                for (int i = 0; i < selectedRatings.length; i++) {
//                    selectedRatingsIds[i] = Integer.parseInt(selectedRatings[i]);
//                }
//            } catch (NumberFormatException e) {
//                e.printStackTrace();
//            }
//
//            for (int  rating : selectedRatingsIds) {
//                for(int ratingTemp : ratingCountsMap.keySet()) {
//                    if(ratingTemp == rating) {
//                        subjectList.addAll(ratingCountsMap.get(ratingTemp));
//                    }
//                }
//            }
//        }

        //Filter unique subject in list subject
        Set<Integer> seenSubjectIds = new HashSet<>();
        List<Subject> uniqueSubjectList = new ArrayList<>();
        for (Subject subject : subjectList) {
            if (seenSubjectIds.add(subject.getSubject_id())) {
                uniqueSubjectList.add(subject);
            }
        }
        subjectList = uniqueSubjectList;

        List<Subject> filteredSubjectList = new ArrayList<>();

        if (selectedCategories != null && selectedTeacherIds != null) {
            for (String category : selectedCategories) {
                for (int teacherId : selectedTeacherIds) {
                    String teacherName = userService.getUser(teacherId).getFullname();
                    for (Subject subject : subjectList) {
                        if (subject.getCategoryName().equalsIgnoreCase(category) && subject.getTeacherName().equals(teacherName)) {
                            filteredSubjectList.add(subject);
                        }
                    }
                }
            }
            subjectList = filteredSubjectList;
        }

        if(subjectList.isEmpty()){
            request.setAttribute("alertSubjectList", "No subject exists!");
        }

        //Pagination
        int size = subjectList.size();
        int numPerPage = 6;
        int page;
        int numPage = size % numPerPage == 0? (int) size/numPerPage : (int) size/numPerPage + 1;
        String xPage = request.getParameter("page");

        if(xPage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xPage);
        }

        if(page <= 1) {
            page = 1;
        }
        if(page >= numPage) {
            page = numPage;
        }

        int start = (page-1)*numPerPage;
        int end = Math.min(page*numPerPage, size);

        String orderBy = request.getParameter("orderBy");
        if (orderBy == null) {
            subjectList.sort(Comparator.comparing(Subject::getSubject_name));
        } else if (orderBy.equals("ZtoA")) {
            subjectList.sort((s1, s2) -> s2.getSubject_name().compareTo(s1.getSubject_name()));
        } else if (orderBy.equals("rating")) {
            subjectList.sort(Comparator.comparing(Subject::getRating).reversed());
        }

        if (!subjectList.isEmpty()) {
            List<Subject> subjectListPage = subjectService.getListByPage(subjectList, start, end);
            request.setAttribute("subjectListPage", subjectListPage);
        }

        request.setAttribute("subjectList", subjectList);
        request.setAttribute("numPage", numPage);
        request.setAttribute("page", page);
        request.getRequestDispatcher("/view/user/subject-filter.jsp").forward(request, response);
    }
}
