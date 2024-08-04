package com.ews.krs.controller.admin;

import com.ews.krs.dao.UserDao;
import com.ews.krs.dao.impl.UserDaoImpl;
import com.ews.krs.model.Lesson;
import com.ews.krs.model.Subject;
import com.ews.krs.model.User;
import com.ews.krs.service.LessonService;
import com.ews.krs.service.SubjectService;
import com.ews.krs.service.UserService;
import com.ews.krs.service.impl.LessonServiceImpl;
import com.ews.krs.service.impl.SubjectServiceImpl;
import com.ews.krs.service.impl.UserServiceImpl;
import com.ews.krs.util.ForeignKeyConstraintException;
import com.ews.krs.util.PasswordUtils;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.apache.log4j.Logger;

import java.io.IOException;
import java.io.Serial;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.Date;
import java.util.List;


@WebServlet(urlPatterns = {"/manager-user", "/manager-user/new","/manager-user/search", "/manager-user/insert", "/manager-user/delete", "/manager-user/edit", "/manager-user/update"})
public class UserManagerController extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;
    private final Logger logger = Logger.getLogger(UserManagerController.class);
    UserService userService;

    public void init() {
        userService = new UserServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");

        String action = request.getServletPath();
        System.out.println("action = " + action);

        HttpSession session = request.getSession();
        if((User) session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
            switch (action) {
                case "/manager-user/new":
                    showNewForm(request, response);
                    break;
                case "/manager-user/insert":
                    insertUser(request, response);
                    break;
                case "/manager-user/delete":
                    deleteUser(request, response);
                    break;
                case "/manager-user/edit":
                    showEditForm(request, response);
                    break;
                case "/manager-user/update":
                    updateUser(request, response);
                    break;
                case "/manager-user/search":
                    searchUser(request, response);
                    break;
                default:
                    listUser(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new IOException(ex.getMessage());
        }
    }

    private void searchUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDao userDao = new UserDaoImpl();
        String searchId = request.getParameter("searchId");
        String searchName = request.getParameter("searchName");
        String searchRole = request.getParameter("searchRole");

        List<User> users;

        if (searchRole != null && !searchRole.isEmpty()) {
            users = userDao.searchUser(null, null, searchRole);
        } else if (searchId != null && !searchId.trim().isEmpty()) {
            users = userDao.searchUser(searchId, null, null);
        } else if (searchName != null && !searchName.trim().isEmpty()) {
            users = userDao.searchUser(null, searchName, null);
        } else {
            users = userDao.getAllUser();
        }

        request.setAttribute("users", users);
        request.getRequestDispatcher("/view/dashboard/users.jsp").forward(request, response);
    }

    private void listUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        List<User> users = userService.getAllUser();
        int size = users.size();
        int numPerPage = 6;
        int numPage = (size % numPerPage == 0) ? (size / numPerPage) : (size / numPerPage) + 1;

        String xPage = request.getParameter("page");
        int page = (xPage == null) ? 1 : Integer.parseInt(xPage);

        if (page < 1) {
            page = 1;
        } else if (page > numPage) {
            page = numPage;
        }

        int start = (page - 1) * numPerPage;
        int end = Math.min(page * numPerPage, size);

        users= users.subList(start, end);

        request.setAttribute("numPage", numPage);
        request.setAttribute("page", page);
        request.setAttribute("users", users);

        request.getRequestDispatcher("/view/dashboard/users.jsp").forward(request, response);
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        UserDao userDao = new UserDaoImpl();

        try {
            int userId = Integer.parseInt(request.getParameter("uid"));
            String username = request.getParameter("username");
            String fullName = request.getParameter("fullname");
            String gender = request.getParameter("gender");
            String email = request.getParameter("email");

            if (!fullName.matches("^[\\p{L} ]+$")) {
                HttpSession session = request.getSession();
                session.setAttribute("errorMessage", "Invalid full name. Please use Vietnamese characters and spaces only.");
                response.sendRedirect(request.getContextPath() + "/manager-user/edit?uid=" + userId);
                return;
            }

            if (!email.contains("@")) {
                HttpSession session = request.getSession();
                session.setAttribute("errorMessage", "Invalid email format.");
                response.sendRedirect(request.getContextPath() + "/manager-user/edit?uid=" + userId);
                return;
            }

            User updatedUser = userDao.getUser(userId);
            if(!updatedUser.getEmail().equals(email)) {
                if(userService.checkExistEmail(email)) {
                    String alertMsg = "This email is already registered!";
                    request.setAttribute("errorMessage", alertMsg);
                    response.sendRedirect(request.getContextPath() + "/manager-user/edit?uid=" + userId);
                    return;
                }
            }

            updatedUser.setUser_id(userId);
            updatedUser.setUsername(username);
            updatedUser.setFullname(fullName);
            updatedUser.setGender(gender);
            updatedUser.setEmail(email);

            String role = request.getParameter("role");

            int settingId = 0;

            switch (role) {
                case "Student":
                    settingId = 4;
                    break;
                case "Teacher":
                    settingId = 3;
                    break;
                case "Manager":
                    settingId = 2;
                    break;
                default:
                    request.setAttribute("error", "Invalid role selected.");
                    request.getRequestDispatcher("/view/dashboard/add-user.jsp").forward(request, response);
                    return;
            }

            updatedUser.setSetting_id(settingId);

            userDao.editUser(updatedUser);

            HttpSession session = request.getSession();
            session.setAttribute("successMessage", "Student information updated successfully.");

            response.sendRedirect(request.getContextPath() + "/manager-user/edit?uid=" + userId);

        }catch (NumberFormatException e) {
            e.printStackTrace();
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDao userDao = new UserDaoImpl();
        int uid = Integer.parseInt(request.getParameter("uid"));
        User user = userDao.getUserByID(uid);
        request.setAttribute("user", user);
        request.getRequestDispatcher("/view/dashboard/edit-user.jsp").forward(request, response);
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        UserDao userDao = new UserDaoImpl();
        String userIdStr = request.getParameter("user_id");
        if (userIdStr != null && !userIdStr.trim().isEmpty()) {
            try {
                int userId = Integer.parseInt(userIdStr);
                userDao.deleteUser(userId);
                request.getSession().setAttribute("successMessage", "User deleted successfully.");
            } catch (ForeignKeyConstraintException e) {
                request.getSession().setAttribute("errorMessage", "Cannot delete user. This user is associated with other records.");
                System.out.println("EEEEE");
            } catch (NumberFormatException e) {
                request.getSession().setAttribute("errorMessage", "Invalid user ID.");
            } catch (RuntimeException e) {
                request.getSession().setAttribute("errorMessage", "An unexpected error occurred. Please try again later.");
            }
        } else {
            request.getSession().setAttribute("errorMessage", "User ID is required.");
        }
        response.sendRedirect("../manager-user");
    }

    private void insertUser(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException, ServletException {
        User user = new User();

        String fullName = request.getParameter("fullname");
        String gender = request.getParameter("gender");
        String username = request.getParameter("username");


        if (fullName == null || fullName.trim().isEmpty() || !fullName.matches("^[a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơĂ-Ỵỳỵỷỹ\\s]+$")) {
            request.setAttribute("error", "Full Name must contain only letters, punctuation, and spaces.");
            request.getRequestDispatcher("/view/dashboard/add-user.jsp").forward(request, response);
            return;
        }

        if (username == null || username.trim().isEmpty() || !username.matches("^[a-zA-Z0-9]+$")) {
            request.setAttribute("error", "Username must contain only letters and numbers.");
            request.getRequestDispatcher("/view/dashboard/add-user.jsp").forward(request, response);
            return;
        }

        String email = request.getParameter("email");
        if (email == null || email.trim().isEmpty() || !email.matches("^[^\\s@]+@[^\\s@]+\\.[^\\s@]+$")) {
            request.setAttribute("error", "Invalid email.");
            request.getRequestDispatcher("/view/dashboard/add-user.jsp").forward(request, response);
            return;
        }

        if(userService.checkExistEmail(email)) {
            String alertMsg = "This email is already registered!";
            request.setAttribute("error", alertMsg);
            request.getRequestDispatcher("/view/dashboard/add-user.jsp").forward(request, response);
            return;
        }

        String password = "123";
        String hashedPassword = PasswordUtils.hashPassword(password);

        user.setFullname(fullName);
        user.setGender(gender);
        user.setUsername(username);

        user.setEmail(email);
        user.setPassword(hashedPassword);
        user.setStatus(1);
        user.setIsVerified_email(0);

        String role = request.getParameter("role");
        int settingId = 0;

        switch (role) {
            case "Student":
                settingId = 4;
                break;
            case "Teacher":
                settingId = 3;
                break;
            case "Manager":
                settingId = 2;
                break;
            default:
                request.setAttribute("error", "Invalid role selected.");
                request.getRequestDispatcher("/view/dashboard/add-user.jsp").forward(request, response);
                return;
        }

        user.setSetting_id(settingId);

        userService.insertUser(user);

        request.setAttribute("message", "User added successfully!");
        request.getRequestDispatcher("/view/dashboard/add-user.jsp").forward(request, response);
    }

    private User getInputUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
//        Lesson lesson = new Lesson();
//        lesson.setTitle(request.getParameter("lesson_title"));
//        lesson.setVideo_url(request.getParameter("video_url"));
//        lesson.setDescription(request.getParameter("description"));
//        String subject_id = request.getParameter("subject");
//        lesson.setSubject_id(Integer.parseInt(subject_id));
//
//        String isPartTitle = request.getParameter("isPartTitle");
//        boolean isPartTitleChecked = "on".equalsIgnoreCase(isPartTitle);
//
//        if (isPartTitleChecked) {
//            lesson.setParent_id(0);
//        } else {
//            String partTitle = request.getParameter("part_title");
//            int partTitleId = Integer.parseInt(partTitle);
//            lesson.setParent_id(partTitleId);
//        }
//
//        lesson.setContent(request.getParameter("content"));
//        HttpSession session = request.getSession();
//        User user = (User) session.getAttribute("user");
//        lesson.setCreated_by(user.getUser_id());
//        lesson.setUpdated_by(user.getUser_id());
//
//        return lesson;
        return null;
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/dashboard/add-user.jsp");
        dispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
