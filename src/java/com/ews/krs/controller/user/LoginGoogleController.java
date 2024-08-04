package com.ews.krs.controller.user;

import com.ews.krs.model.UserGoogleDto;
import com.ews.krs.model.User;
import com.ews.krs.service.UserService;
import com.ews.krs.service.impl.UserServiceImpl;
import com.ews.krs.util.GoogleUtils;
import com.ews.krs.util.MailUtils;
import com.ews.krs.util.PasswordUtils;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Random;

public class LoginGoogleController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String code = request.getParameter("code");
        if(code == null || code.isEmpty()) {
            RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
            dis.forward(request, response);
        } else {
            String accessToken = GoogleUtils.getToken(code);
            UserGoogleDto userGoogle = GoogleUtils.getUserInfo(accessToken);
            User user = new User();
            UserService userService = new UserServiceImpl();

            user.setEmail(userGoogle.getEmail());
            user.setFullname(userGoogle.getName());

            String username = userGoogle.getEmail();
            if(!userService.checkExistUsername(username)) {
                //Password default
                int leftLimit = 48; // numeral '0'
                int rightLimit = 122; // letter 'z'
                int targetStringLength = 8;
                Random random = new Random();
                String password = random.ints(leftLimit, rightLimit + 1)
                        .filter(i -> (i <= 57 || i >= 65) && (i <= 90 || i >= 97))
                        .limit(targetStringLength)
                        .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
                        .toString();

                String hashedNewPassword = PasswordUtils.hashPassword(password);
                user.setPassword(hashedNewPassword);
                user.setUsername(username);
                MailUtils.sendAccountForEmail(user.getEmail(), user.getUsername(), password);

                HttpSession session = request.getSession(true);
                userService.insertUser(user);
                userService.getUser(username);

                session.setAttribute("user", user);
                session.setMaxInactiveInterval(30*60);
                RequestDispatcher dis = request.getRequestDispatcher("/view/user/index.jsp");
                dis.forward(request, response);
            } else {
                user = userService.getUser(username);
                HttpSession session = request.getSession();
                session.setMaxInactiveInterval(30*60);
                session.setAttribute("user", user);
                RequestDispatcher dis = request.getRequestDispatcher("/view/user/index.jsp");
                dis.forward(request, response);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}