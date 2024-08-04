package com.ews.krs.controller.user;

import com.ews.krs.model.User;
import com.ews.krs.service.UserService;
import com.ews.krs.service.impl.UserServiceImpl;
import com.ews.krs.util.MailUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import static com.ews.krs.util.VerificationUtils.generateVerificationCode;

public class ForgotPasswordController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/view/user/forgot-password.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        UserService userService = new UserServiceImpl();

        boolean checkExistEmail = userService.checkExistEmail(email);
        User user = new User();

        if (checkExistEmail) {
            user = userService.getUserByEmail(email);
            String verificationCode = generateVerificationCode();

            MailUtils.sendVerificationEmail(email, verificationCode);

            request.setAttribute("verificationCode", verificationCode);
            request.setAttribute("forgotPassRequest", "ok");
            request.setAttribute("username", user.getUsername());

            request.getRequestDispatcher("/view/user/verification_code.jsp").forward(request, response);
        } else {
            String alertMsg = "The email you just entered has not been registered before!";
            request.setAttribute("alertMsg", alertMsg);
            request.setAttribute("email_entered", email);
            request.getRequestDispatcher("/view/user/forgot-password.jsp").forward(request,response);
        }

    }
}