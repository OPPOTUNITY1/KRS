package com.ews.krs.controller.user;

import com.ews.krs.model.SystemSetting;
import com.ews.krs.model.User;
import com.ews.krs.service.SystemSettingService;
import com.ews.krs.service.UserService;
import com.ews.krs.service.impl.SystemSettingServiceImpl;
import com.ews.krs.service.impl.UserServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Check for existing cookies and set attributes if found
        Cookie[] cookies = request.getCookies();
        if(cookies != null) {
            for(Cookie cookie : cookies) {
                // Check for username cookie
                if (cookie.getName().equals("cookie_username")) {
                    request.setAttribute("username", cookie.getValue());
                }
                // Check for remember-me cookie
                else if (cookie.getName().equals("cookie_remember")) {
                    request.setAttribute("remember", cookie.getValue());
                }
            }
        }
        // Forward to the login page
        request.getRequestDispatcher("/view/user/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        if(session.getAttribute("user") != null) {
            response.sendRedirect("/view/user/index.jsp");
        } else {

            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String remember = request.getParameter("remember");

            UserService userService = new UserServiceImpl();
            User user = userService.loginUser(username, password);

            if(user == null) {
                request.setAttribute("username", username);
                request.setAttribute("password", password);
                System.out.println(remember);

                request.setAttribute("loginFailMessage", "Incorrect username or password.");
                request.getRequestDispatcher("/view/user/login.jsp").forward(request, response);
            } else {
                //Create cookie
                Cookie cookie_username = new Cookie("cookie_username", username);
                Cookie cookie_remember = new Cookie("cookie_remember", remember);

                if(remember != null){
                    cookie_username.setMaxAge(60*60*24*7);
                    cookie_remember.setMaxAge(60*60*24*7);
                } else {
                    cookie_username.setMaxAge(0);
                    cookie_remember.setMaxAge(0);
                }

                response.addCookie(cookie_username);
                response.addCookie(cookie_remember);

                SystemSettingService systemSettingService = new SystemSettingServiceImpl();
                List<SystemSetting> systemSettingList = systemSettingService.getAllSystem_setting();

                for (SystemSetting systemSetting : systemSettingList) {
                    if(systemSetting.getSetting_id() == user.getSetting_id() && systemSetting.getSetting_name().equals("user_role") && systemSetting.getSetting_type().equals("user")) {
                        user.setRoleName(systemSetting.getSetting_value());
                        session.setAttribute("user", user);
                        break;
                    }
                }

                response.sendRedirect(request.getContextPath() + "/home");
            }
        }
    }
}
