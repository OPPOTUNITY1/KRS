package com.ews.krs.controller.user;

import com.ews.krs.model.SystemSetting;
import com.ews.krs.model.User;
import com.ews.krs.service.SystemSettingService;
import com.ews.krs.service.impl.SystemSettingServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class HomeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);

        SystemSettingService systemSettingService = new SystemSettingServiceImpl();
        List<SystemSetting> systemSettingList = new ArrayList<>();
        systemSettingList = systemSettingService.getAllSystem_setting();

        if(session != null && session.getAttribute("user") != null) {
            User user = (User) session.getAttribute("user");
            for (SystemSetting systemSetting : systemSettingList) {
                if(systemSetting.getSetting_id() == user.getSetting_id()  && systemSetting.getSetting_name().equals("user_role") && systemSetting.getSetting_type().equals("user")) {
                    request.setAttribute("userRole", systemSetting.getSetting_value().toUpperCase());
                    break;
                }
            }
        }

//        request.setAttribute("notify", "");
        request.getRequestDispatcher("/view/user/index.jsp").forward(request, response);
    }

    public static String capitalizeFirstLetter(String value) {
        String[] words = value.split(" ");
        StringBuilder capitalizedValue = new StringBuilder();

        for (String word : words) {
            if (!word.isEmpty()) {
                capitalizedValue.append(Character.toUpperCase(word.charAt(0)))
                        .append(word.substring(1))
                        .append(" ");
            }
        }
        return capitalizedValue.toString().trim();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}
