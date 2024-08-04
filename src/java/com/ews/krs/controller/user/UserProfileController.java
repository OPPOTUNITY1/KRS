package com.ews.krs.controller.user;

import com.ews.krs.model.SystemSetting;
import com.ews.krs.model.User;
import com.ews.krs.service.SystemSettingService;
import com.ews.krs.service.UserService;
import com.ews.krs.service.impl.SystemSettingServiceImpl;
import com.ews.krs.service.impl.UserServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.*;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@MultipartConfig(fileSizeThreshold = 1024 * 1024, // 1 MB
        maxFileSize = 1024 * 1024 * 5,   // 5 MB
        maxRequestSize = 1024 * 1024 * 10) // 10 MB
public class UserProfileController extends HttpServlet {
    private static final String uploadPathOther = "D:\\Project_SWP\\JetBrainCode\\KRS\\src\\main\\webapp\\view\\user\\assets\\img\\users"; // Set to your external directory path
    @Override
    public void init() throws ServletException {
        File uploadDirOther = new File(uploadPathOther);
        if (!uploadDirOther.exists()) {
            uploadDirOther.mkdirs();
        }
    }

    UserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {

            User user = (User) session.getAttribute("user");

            SystemSettingService systemSettingService = new SystemSettingServiceImpl();
            List<SystemSetting> systemSettingList = new ArrayList<>();
            systemSettingList = systemSettingService.getAllSystem_setting();

            for (SystemSetting systemSetting : systemSettingList) {
                if(systemSetting.getSetting_id() == user.getSetting_id()  && systemSetting.getSetting_name().equals("user_role") && systemSetting.getSetting_type().equals("user")) {
                    request.setAttribute("userRole", systemSetting.getSetting_value().toUpperCase());
                    break;
                }
            }
        }
        request.getRequestDispatcher("/view/user/users-profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User user = null;
        if (session != null && session.getAttribute("user") != null) {
            user = (User) session.getAttribute("user");

            SystemSettingService systemSettingService = new SystemSettingServiceImpl();
            List<SystemSetting> systemSettingList = new ArrayList<>();
            systemSettingList = systemSettingService.getAllSystem_setting();

            for (SystemSetting systemSetting : systemSettingList) {
                if(systemSetting.getSetting_id() == user.getSetting_id()  && systemSetting.getSetting_name().equals("user_role") && systemSetting.getSetting_type().equals("user")) {
                    request.setAttribute("userRole", systemSetting.getSetting_value().toUpperCase());
                    break;
                }
            }
        }
        String update = request.getParameter("update");

        if ("image".equals(update)) {
            try {
                // Retrieve the file part from the request
                Part filePart = request.getPart("fileImage");
                String originalFileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                String extension = "";

                int i = originalFileName.lastIndexOf('.');
                if (i >= 0) {
                    extension = originalFileName.substring(i);
                }

                // Create a unique filename using a timestamp
                String fileName = "id-" + user.getUser_id() + "-" + System.currentTimeMillis() + extension;

                // Save the file to the server
                InputStream inputStream = filePart.getInputStream();
                Files.copy(inputStream, Paths.get(uploadPathOther + File.separator + fileName));
                System.out.println(uploadPathOther + File.separator + fileName);

                if (user != null) {
                    user = userService.getUser(user.getUsername());
                    user.setAvatar(fileName);
                }

                response.getWriter().println("File uploaded successfully!");
            } catch (IOException | ServletException e) {
                response.getWriter().println("File upload failed due to an error: " + e.getMessage());
            }

            if (user != null) {
                userService.editUser(user);
                session.setAttribute("user", user);
            }
            request.getRequestDispatcher("/view/user/users-profile.jsp").forward(request, response);
        }

        if ("info".equals(update)) {
            String fullName = request.getParameter("fullName");
            String gender = request.getParameter("gender");
            String phone = request.getParameter("phone");
            String dobStr = request.getParameter("dob");
            Date dob = null;

            if (dobStr != null && !dobStr.isEmpty()) {
                try {
                    LocalDate localDate = LocalDate.parse(dobStr);
                    dob = Date.from(localDate.atStartOfDay(ZoneId.systemDefault()).toInstant());
                } catch (DateTimeParseException e) {
                    e.printStackTrace();
                }
            }

            String email = request.getParameter("email");

            if (user != null) {
                user.setGender(gender);
                user.setPhone(phone);
                user.setFullname(fullName);
                if (email != null && !email.equals(user.getEmail())) {
                    user.setEmail(email);
                    user.setIsVerified_email(0);
                }
                user.setDob(dob);
                session.setAttribute("user", user);
                userService.editUser(user);
            }
            request.getRequestDispatcher("/view/user/users-profile.jsp").forward(request, response);
        }
    }
}
