package com.ews.krs.controller.admin;

import com.ews.krs.model.ClassExtends;
import com.ews.krs.model.Classes;
import com.ews.krs.model.User;
import com.ews.krs.service.ClassListService;
import com.ews.krs.service.ClassesService;
import com.ews.krs.service.impl.ClassListServiceImpl;
import com.ews.krs.service.impl.ClassesServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

public class ClassesController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    static ClassesService classesService = new ClassesServiceImpl();
    static ClassListService classListService = new ClassListServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            User user = (User) session.getAttribute("user");
            request.setAttribute("userRole", user.getRoleName());
            String action = request.getServletPath();
            System.out.println("action= " + action);
            switch (action) {
                case "/class-manager/list":
                    listStudentByClassId(request, response);
                    break;
                case "/class-manager/delete":
                    deleteClassById(request, response);
                    break;
                case "/class-manager/new":
                    showNewForm(request, response);
                    break;
                default:
                    listClassById(request, response);
                    break;
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

    private void listClassById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");
        String searchId = request.getParameter("searchId");
        String searchName = request.getParameter("searchName");
        List<ClassExtends> list;
        if (user.getRoleName().equals("admin") || user.getRoleName().equals("manager")) {
            if (searchId != null || searchName != null) {
                list = classesService.getSearchResult(searchId, searchName);
            } else {
                list = classesService.getAllClass();
            }
        } else {
            list = classesService.getAllClassByTeacherId(user.getUser_id());
        }
        request.setAttribute("listClass", list);
        request.getRequestDispatcher("/view/dashboard/classes.jsp").forward(request, response);
    }

    private void listStudentByClassId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        List<User> studentList = classListService.getAllStudentByClass(id);
        request.setAttribute("studentList", studentList);
        request.setAttribute("className", name);
        request.getRequestDispatcher("/view/dashboard/list-student.jsp").forward(request, response);
    }

    private void deleteClassById(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        classesService.deleteClass(id);
        System.out.println("Deleted class id: " + id);
        response.sendRedirect("../class-manager");
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/view/dashboard/add-class.jsp").forward(request, response);
    }
}
