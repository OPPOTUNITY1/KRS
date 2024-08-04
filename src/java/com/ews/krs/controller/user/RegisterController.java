package com.ews.krs.controller.user;

import com.ews.krs.service.UserService;
import com.ews.krs.service.impl.UserServiceImpl;
import com.ews.krs.util.MailUtils;
import com.ews.krs.util.PasswordUtils;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

import java.io.IOException;

import static com.ews.krs.util.VerificationUtils.generateVerificationCode;

public class RegisterController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dis = request.getRequestDispatcher("/view/user/registration.jsp");
        dis.forward(request, response);
    }

    private boolean isValidEmail(String email) {
        String emailPattern = "^[\\w-.]+@(gmail\\.com|fpt\\.edu\\.vn)$";
        return email.matches(emailPattern);
    }

    private boolean isValidPassword(String password) {
        String passwordPattern = "^(?=.*[A-Z])(?=.*\\W).{8,}$";
        return password.matches(passwordPattern);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String fullName = request.getParameter("fullName");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String username = request.getParameter("username");

        request.setAttribute("fullName", fullName);
        request.setAttribute("password", password);
        request.setAttribute("email", email);
        request.setAttribute("username", username);

        // Validate email
        if (!isValidEmail(email)) {
            String alertMsg = "Email must be @gmail.com or @fpt.edu.vn!";
            request.setAttribute("alertMsg", alertMsg);
            request.getRequestDispatcher("/view/user/registration.jsp").forward(request, response);
            return;
        }

        // Validate password
        if (!isValidPassword(password)) {
            String alertMsg = "Password must be at least 8 characters long, include at least one uppercase letter and one special character!";
            request.setAttribute("alertMsg", alertMsg);
            request.getRequestDispatcher("/view/user/registration.jsp").forward(request, response);
            return;
        }

        UserService userService = new UserServiceImpl();

        if(userService.checkExistEmail(email)) {
            String alertMsg = "This email account is already registered!";
            request.setAttribute("alertMsg", alertMsg);
            request.getRequestDispatcher("/view/user/registration.jsp").forward(request, response);
            return;
        }

        if(userService.checkExistUsername(username)) {
            String alertMsg = "This username is already registered!";
            request.setAttribute("alertMsg", alertMsg);
            request.getRequestDispatcher("/view/user/registration.jsp").forward(request, response);
            return;
        }

        String hashedPassword = PasswordUtils.hashPassword(password);
        boolean isSuccess = userService.registerUser(username, hashedPassword, email, fullName);

        if (isSuccess) {
            String verificationCode = generateVerificationCode();
            MailUtils.sendVerificationEmail(email, verificationCode);

            request.setAttribute("verificationCode", verificationCode);
            request.setAttribute("username", username);
            request.setAttribute("verify_email_signUp", "verify_email_signUp");

            request.getRequestDispatcher("/view/user/verification_code.jsp").forward(request, response);
        } else {
            String alertMsg = "Create account failed!";
            request.setAttribute("alertMsg", alertMsg);
            request.getRequestDispatcher("/view/user/registration.jsp").forward(request,response);
        }
    }
}
