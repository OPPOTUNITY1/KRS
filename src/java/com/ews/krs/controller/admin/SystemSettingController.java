/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.ews.krs.controller.admin;

import com.ews.krs.model.SystemSetting;
import com.ews.krs.model.User;
import com.ews.krs.service.SystemSettingService;
import com.ews.krs.service.impl.SystemSettingServiceImpl;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class SystemSettingController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    SystemSettingService settingService = new SystemSettingServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if((User) session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        if (session != null && session.getAttribute("user") != null) {
            User user = (User) session.getAttribute("user");
            request.setAttribute("userRole", user.getRoleName());
            String action = request.getServletPath();
            System.out.println("action= " + action);
            try {
                switch (action) {
                    case "/system-setting/new":
                        showNewForm(request, response);
                        break;
                    case "/system-setting/insert":
                        insertSystemSetting(request, response);
                        break;
                    case "/system-setting/edit":
                        editSystemSetting(request, response);
                        break;
                    case "/system-setting/update":
                        updateSystemSetting(request, response);
                        break;
                    case "/system-setting/delete":
                        deleteSystemSetting(request, response);
                        break;
                    default:
                        listSystemSetting(request, response);
                        break;
                }
            } catch (ServletException | IOException ex) {
                throw new IOException(ex.getMessage());
            }

        } else {
            response.sendRedirect("home");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    private void listSystemSetting(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<SystemSetting> list = settingService.getAllSystem_setting();
        request.setAttribute("settings", list);
        request.getRequestDispatcher("/view/dashboard/setting-list.jsp").forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<String> settingType = settingService.getAllSettingType();
        request.setAttribute("listSettingType", settingType);
        request.getRequestDispatcher("/view/dashboard/add-setting.jsp").forward(request, response);
    }

    private void insertSystemSetting(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String settingType = request.getParameter("settingType");
        String settingName = request.getParameter("settingName");
        String settingValue = request.getParameter("settingValue");
        if (!settingService.checkDuplicateSetting(settingType, settingValue) && settingType != null && !settingName.isEmpty() && !settingValue.isEmpty()) {
            settingService.insertSystemSetting(new SystemSetting(0, settingType, settingName, settingValue));
            response.sendRedirect("../system-setting");
        } else {
            List<String> listSettingType = settingService.getAllSettingType();
            request.setAttribute("stype", settingType);
            request.setAttribute("listSettingType", listSettingType);
            request.setAttribute("settingName", settingName);
            request.setAttribute("settingValue", settingValue);
            request.setAttribute("addStatus", "Add Setting Failed");
            request.getRequestDispatcher("/view/dashboard/add-setting.jsp").forward(request, response);
        }
    }

    private void editSystemSetting(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        SystemSetting setting = settingService.getSystemSetting(id);
        List<String> settingType = settingService.getAllSettingType();
        request.setAttribute("listSettingType", settingType);
        request.setAttribute("settingId", id);
        request.setAttribute("settingType", setting.getSetting_type());
        request.setAttribute("settingName", setting.getSetting_name());
        request.setAttribute("settingValue", setting.getSetting_value());
        request.getRequestDispatcher("/view/dashboard/edit-setting.jsp").forward(request, response);
    }

    private void updateSystemSetting(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int settingId = Integer.parseInt(request.getParameter("settingId"));
        String settingType = request.getParameter("settingType");
        String settingName = request.getParameter("settingName");
        String settingValue = request.getParameter("settingValue");
        if (!settingService.checkDuplicateSetting(settingType, settingValue) && !settingType.isEmpty() && !settingName.isEmpty() && !settingValue.isEmpty()) {
            settingService.editSystemSetting(new SystemSetting(settingId, settingType, settingName, settingValue));
            response.sendRedirect("../system-setting");
        } else {
            request.setAttribute("settingType", settingType);
            request.setAttribute("settingName", settingName);
            request.setAttribute("settingValue", settingValue);
            request.setAttribute("editStatus", "Edit Setting Failed");
            request.getRequestDispatcher("/view/dashboard/edit-setting.jsp").forward(request, response);
        }
    }

    private void deleteSystemSetting(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        settingService.deleteSystemSetting(id);
        response.sendRedirect("../system-setting");
    }

}
