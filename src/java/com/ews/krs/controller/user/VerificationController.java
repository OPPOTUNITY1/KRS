package com.ews.krs.controller.user;

import com.ews.krs.model.User;
import com.ews.krs.service.UserService;
import com.ews.krs.service.impl.UserServiceImpl;
import com.ews.krs.util.MailUtils;
import com.ews.krs.util.PasswordUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import static com.ews.krs.util.VerificationUtils.generateRandomPassword;

public class VerificationController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String codeEnter = request.getParameter("code_enter");
        String codeCreated = request.getParameter("code_created");
        String username = request.getParameter("username");
        String forgotPassRequest = request.getParameter("forgotPassRequest");
        String verify_email = request.getParameter("verify_email");
        String verify_email_signUp = request.getParameter("verify_email_signUp");

        request.setAttribute("verificationCodeEnter", codeEnter);
        request.setAttribute("verificationCode", codeCreated);
        request.setAttribute("username", username);

        if (codeEnter != null && codeEnter.equals(codeCreated)) {

            handleSuccessfulCodeMatch(username, forgotPassRequest, verify_email, verify_email_signUp, request, response);

        } else {
            if(forgotPassRequest.equals("ok")){
                request.setAttribute("forgotPassRequest", "ok");
            }
            if (verify_email_signUp.equals("verify_email_signUp")) {
                request.setAttribute("verify_email_signUp", "verify_email_signUp");
            }
            handleFailedCodeMatch(codeCreated, username, request, response);
        }
    }

    private void handleSuccessfulCodeMatch(String username, String forgotPassRequest, String verify_email,String verify_email_signUp, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        UserService userService = new UserServiceImpl();
        User user = userService.getUser(username);

        if (verify_email_signUp.equals("verify_email_signUp") || verify_email.equals("ok")) {
            user.setIsVerified_email(1);
            request.setAttribute("emailSuccess", "Email authentication successful!");
        }

        if(forgotPassRequest.equals("ok")){
            request.setAttribute("forgotPassRequest", "ok");
            resetUserPassword(user, request);
        }

        userService.editUser(user);
        updateUserSessionAndRedirect(user, verify_email, verify_email_signUp, forgotPassRequest, request, response);
    }

    private void handleFailedCodeMatch(String codeCreated, String username, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("alertMsg", "The code you entered is not correct!");
        request.getRequestDispatcher("/view/user/verification_code.jsp").forward(request, response);
    }

    private void resetUserPassword(User user, HttpServletRequest request) {
        String randomPass = generateRandomPassword();
        MailUtils.sendNewPassEmail(user.getEmail(), randomPass, user.getUsername());
        String hashedPassword = PasswordUtils.hashPassword(randomPass);
        user.setPassword(hashedPassword);
        request.setAttribute("resetPassSuccess", "Your password has been changed successfully!");
    }

    private void updateUserSessionAndRedirect(User user, String verify_email, String verify_email_signUp,String forgotPassRequest, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("user", user);

        if (verify_email.equals("ok")) {
            request.getRequestDispatcher("/view/user/users-profile.jsp").forward(request, response);
            return;
        } else if(verify_email_signUp.equals("verify_email_signUp")) {
            session.removeAttribute("user");
            request.getRequestDispatcher("/view/user/login.jsp").forward(request, response);
            return;
        } else if(forgotPassRequest.equals("ok")) {
            session.removeAttribute("user");
            request.getRequestDispatcher("/view/user/login.jsp").forward(request, response);
            return;
        }
    }
}