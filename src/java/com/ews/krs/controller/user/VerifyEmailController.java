package com.ews.krs.controller.user;

import com.ews.krs.util.MailUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import static com.ews.krs.util.VerificationUtils.generateVerificationCode;

public class VerifyEmailController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String verificationCode = generateVerificationCode();
        MailUtils.sendVerificationEmail(email, verificationCode);
        request.setAttribute("verificationCode", verificationCode);
        request.setAttribute("username", username);
        request.setAttribute("verify_email", "ok");
        request.getRequestDispatcher("/view/user/verification_code.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}