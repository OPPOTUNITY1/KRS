package com.ews.krs.controller.admin;

import com.google.gson.Gson;
import com.ews.krs.model.Subject;
import com.ews.krs.model.SystemSetting;
import com.ews.krs.model.User;
import com.ews.krs.service.SubjectService;
import com.ews.krs.service.SystemSettingService;
import com.ews.krs.service.UserService;
import com.ews.krs.service.impl.SubjectServiceImpl;
import com.ews.krs.service.impl.SystemSettingServiceImpl;
import com.ews.krs.service.impl.UserServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class DashboardController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(true);
        if((User) session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        SystemSettingService systemSettingService = new SystemSettingServiceImpl();
        List<SystemSetting> systemSettingList = systemSettingService.getAllSystem_setting();

        if (session != null && session.getAttribute("user") != null) {
            User currentUser = (User) session.getAttribute("user");
            for (SystemSetting systemSetting : systemSettingList) {
                if (systemSetting.getSetting_id() == currentUser.getSetting_id() &&
                        systemSetting.getSetting_name().equals("user_role") &&
                        systemSetting.getSetting_type().equals("user")) {

                    String userRole = systemSetting.getSetting_value().toUpperCase();

                    request.setAttribute("userRole", userRole);

                    session.setAttribute("role", userRole);
                    break;
                }
            }
        }



        UserService userService = new UserServiceImpl();
        List<User> userList = userService.getAllUser();

        int totalStudent = 0;
        int totalTeacher = 0;
        for (User user : userList) {
            for (SystemSetting systemSetting : systemSettingList) {
                if (systemSetting.getSetting_name().equalsIgnoreCase("user_role") && systemSetting.getSetting_value().equalsIgnoreCase("student") && systemSetting.getSetting_id() == user.getSetting_id()) {
                    totalStudent++;
                }
            }
        }
        request.setAttribute("totalStudent", totalStudent);

        for (User user : userList) {
            for (SystemSetting systemSetting : systemSettingList) {
                if (systemSetting.getSetting_name().equalsIgnoreCase("user_role") && systemSetting.getSetting_value().equalsIgnoreCase("teacher") && systemSetting.getSetting_id() == user.getSetting_id()) {
                    totalTeacher++;
                }
            }
        }
        request.setAttribute("totalTeacher", totalTeacher);

        int totalStudents = 0;
        int totalTeachers = 0;
        for (User user : userList) {
            for (SystemSetting systemSetting : systemSettingList) {
                if (systemSetting.getSetting_id() == user.getSetting_id() &&
                        systemSetting.getSetting_name().equalsIgnoreCase("user_role")) {
                    if (systemSetting.getSetting_value().equalsIgnoreCase("student")) {
                        totalStudents++;
                    } else if (systemSetting.getSetting_value().equalsIgnoreCase("teacher")) {
                        totalTeachers++;
                    }
                }
            }
        }
        request.setAttribute("totalStudents", totalStudents);
        request.setAttribute("totalTeachers", totalTeachers);

        SubjectService subjectService = new SubjectServiceImpl();
        List<Subject> subjectList = subjectService.getAllSubject();
        request.setAttribute("totalSubject", subjectList.size());

        Calendar calendar = Calendar.getInstance();
        int currentYear = calendar.get(Calendar.YEAR);
        int currentMonth = calendar.get(Calendar.MONTH);

        String[] monthNames = new String[currentMonth + 1];
        for (int i = 0; i <= currentMonth; i++) {
            Calendar tempCalendar = Calendar.getInstance();
            tempCalendar.set(Calendar.MONTH, i);
            monthNames[i] = tempCalendar.getDisplayName(Calendar.MONTH, Calendar.SHORT, request.getLocale());
        }

        int[] teacherMonthlyData = new int[currentMonth + 1];
        int[] studentMonthlyData = new int[currentMonth + 1];

        int[] boysData = new int[10];
        int[] girlsData = new int[10];
        int[] pastTenYears = new int[10];
        for (int i = 0; i < 10; i++) {
            pastTenYears[i] = currentYear - i;
        }

        for (User user : userList) {
            if (user.getCreated_at() != null) {
                calendar.setTime(user.getCreated_at());
                int userYear = calendar.get(Calendar.YEAR);
                int userMonth = calendar.get(Calendar.MONTH);

                if (userYear == currentYear) {
                    if (user.getSetting_id() == 3) {
                        teacherMonthlyData[userMonth]++;
                    } else if (user.getSetting_id() == 4) {
                        studentMonthlyData[userMonth]++;
                    }
                }

                if (userYear >= currentYear - 10 && userYear <= currentYear) {
                    int yearIndex = currentYear - userYear;
                    if ("M".equalsIgnoreCase(user.getGender())) {
                        boysData[yearIndex]++;
                    } else if ("F".equalsIgnoreCase(user.getGender())) {
                        girlsData[yearIndex]++;
                    }
                }
            }
        }

        request.setAttribute("teacherDataJson", new Gson().toJson(teacherMonthlyData));
        request.setAttribute("studentDataJson", new Gson().toJson(studentMonthlyData));
        request.setAttribute("listMonthJson", new Gson().toJson(monthNames));
        request.setAttribute("boysDataJson", new Gson().toJson(boysData));
        request.setAttribute("girlsDataJson", new Gson().toJson(girlsData));
        request.setAttribute("yearsDataJson", new Gson().toJson(pastTenYears));

        request.getRequestDispatcher("/view/dashboard/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Implement doPost method if needed
    }
}
