package com.ews.krs.controller.admin;

import com.ews.krs.model.*;
import com.ews.krs.service.*;
import com.ews.krs.service.impl.*;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.apache.log4j.Logger;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.Serial;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(urlPatterns = {"/manager-lesson", "/manager-lesson/new", "/manager-lesson/insert", "/manager-lesson/delete", "/manager-lesson/edit", "/manager-lesson/update"})
public class LessonManagerController extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;
    private final Logger logger = Logger.getLogger(SubjectManagerController.class);
    SubjectService subjectService;
    LessonService lessonService;
    public void init() {
        subjectService = new SubjectServiceImpl();
        lessonService = new LessonServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");

        HttpSession session = request.getSession();
        if((User) session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String action = request.getServletPath();
        System.out.println("action = " + action);

        try {
            switch (action) {
                case "/manager-lesson/new":
                    showNewForm(request, response);
                    break;
                case "/manager-lesson/insert":
                    insertLesson(request, response);
                    break;
                case "/manager-lesson/delete":
                    deleteLesson(request, response);
                    break;
                case "/manager-lesson/edit":
                    showEditForm(request, response);
                    break;
                case "/manager-lesson/update":
                    updateLesson(request, response);
                    break;
                default:
                    listLesson(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new IOException(ex.getMessage());
        }
    }

    private void listLesson(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        List<Lesson> lessons = lessonService.getAllLesson();

        String searchValue = request.getParameter("searchValue");
        if(searchValue!= null && !searchValue.isEmpty()) {
            lessons = lessonService.searchLesson(searchValue);
            if (lessons.isEmpty()) {
                request.setAttribute("alertEmpty", "No lesson is found!");
                request.getRequestDispatcher("/view/dashboard/subjects.jsp").forward(request, response);
                return;
            }
        }

        String searchIDValue = request.getParameter("searchIDValue");
        if(searchIDValue!= null && !searchIDValue.isEmpty()) {
            lessons = lessonService.getAllLessonBySubjectId(Integer.parseInt(searchIDValue));
            if (lessons.isEmpty()) {
                request.setAttribute("alertEmpty", "No lesson is found!");
                request.getRequestDispatcher("/view/dashboard/subjects.jsp").forward(request, response);
                return;
            }
        }

        int size = lessons.size();
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

        List<Lesson> lessonListPage = lessons.subList(start, end);

        request.setAttribute("lessons", lessonListPage);
        request.setAttribute("numPage", numPage);
        request.setAttribute("page", page);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/dashboard/lessons.jsp");
        dispatcher.forward(request, response);
    }

    private void updateLesson(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String lesson_id = request.getParameter("lesson_id");
        int lessonId = Integer.parseInt(lesson_id);
        Lesson lesson = lessonService.getLesson(lessonId);
        lesson.setTitle(request.getParameter("lesson_title"));
        lesson.setVideo_url(request.getParameter("video_url"));
        lesson.setDescription(request.getParameter("description"));
        String subject_id = request.getParameter("subject");
        lesson.setSubject_id(Integer.parseInt(subject_id));
        lesson.setContent(request.getParameter("content"));

        String isPartTitle = request.getParameter("isPartTitle");
        boolean isPartTitleChecked = "on".equalsIgnoreCase(isPartTitle);

        if (isPartTitleChecked) {
            lesson.setParent_id(0);
        } else {
            String partTitle = request.getParameter("part_title");
            int partTitleId = Integer.parseInt(partTitle);
            lesson.setParent_id(partTitleId);
        }

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        lesson.setUpdated_by(user.getUser_id());

        lessonService.editLesson(lesson);
        response.sendRedirect("../manager-lesson");
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String lesson_id = request.getParameter("lesson_id");
        int lessonId = Integer.parseInt(lesson_id);
        Lesson lesson = lessonService.getLesson(lessonId);
        request.setAttribute("lesson", lesson);

        List<Subject> subjects = subjectService.getAllSubject();

        request.setAttribute("subjects", subjects);
        request.setAttribute("lessonId", lessonId);
        List<Lesson> lessons = lessonService.getAllLesson();
        request.setAttribute("lessons", lessons);


        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/dashboard/edit-lesson.jsp");
        dispatcher.forward(request, response);
    }

    private void deleteLesson(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String lesson_id = request.getParameter("lesson_id");
        int lessonId = Integer.parseInt(lesson_id);
        Lesson lesson = lessonService.getLesson(lessonId);
        lessonService.deleteLesson(lessonId);
        response.sendRedirect("../manager-lesson");
    }

    private void insertLesson(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        logger.debug("prepare to insert..");

        Lesson lesson = getInputLesson(request, response);
        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("user");

        lessonService.insertLesson(lesson);
        response.sendRedirect("../manager-lesson");
    }

    private Lesson getInputLesson(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Lesson lesson = new Lesson();
        lesson.setTitle(request.getParameter("lesson_title"));
        lesson.setVideo_url(request.getParameter("video_url"));
        lesson.setDescription(request.getParameter("description"));
        String subject_id = request.getParameter("subject");
        lesson.setSubject_id(Integer.parseInt(subject_id));

        String isPartTitle = request.getParameter("isPartTitle");
        boolean isPartTitleChecked = "on".equalsIgnoreCase(isPartTitle);

        if (isPartTitleChecked) {
            lesson.setParent_id(0);
        } else {
            String partTitle = request.getParameter("part_title");
            int partTitleId = Integer.parseInt(partTitle);
            lesson.setParent_id(partTitleId);
        }

        lesson.setContent(request.getParameter("content"));
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        lesson.setCreated_by(user.getUser_id());
        lesson.setUpdated_by(user.getUser_id());

        return lesson;
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/dashboard/add-lesson.jsp");
        List<Subject> subjects = subjectService.getAllSubject();
        request.setAttribute("subjects", subjects);
        List<Lesson> lessons = lessonService.getAllLesson();
        request.setAttribute("lessons", lessons);

        dispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
