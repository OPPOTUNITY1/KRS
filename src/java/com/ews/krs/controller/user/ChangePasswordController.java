package com.ews.krs.controller.user;

import com.ews.krs.model.User;
import com.ews.krs.service.UserService;
import com.ews.krs.service.impl.UserServiceImpl;
import com.ews.krs.util.PasswordUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import static com.ews.krs.util.PasswordUtils.verifyPassword;

public class ChangePasswordController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            String currentPassword = request.getParameter("currentPassword");
            String newPassword = request.getParameter("new_password");

            HttpSession session = request.getSession(false);
            User user = (User) session.getAttribute("user");


            String currentPasswordDB =  user.getPassword();

            boolean isPasswordCorrect = verifyPassword(currentPassword, currentPasswordDB);

            String hashedNewPassword = PasswordUtils.hashPassword(newPassword);

        if(isPasswordCorrect) {
            user.setPassword(hashedNewPassword);
            UserService userService = new UserServiceImpl();
            userService.editUser(user);
            session.setAttribute("user", user);
            request.setAttribute("changeSuccess", "Password changed successfully! Please login again!");
            session.removeAttribute("user");
            request.getRequestDispatcher("/view/user/login.jsp").forward(request, response);
        } else {
            request.setAttribute("wrong_password", "The current password you entered is incorrect! Please re-enter!");
            request.getRequestDispatcher("/view/user/users-profile.jsp").forward(request, response);
        }
    }
}