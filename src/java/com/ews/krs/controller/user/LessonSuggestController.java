package com.ews.krs.controller.user;

import com.ews.krs.model.Lesson;
import com.ews.krs.service.LessonService;
import com.ews.krs.service.impl.LessonServiceImpl;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@WebServlet("/subject/getLessonSuggestions")
public class LessonSuggestController extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String searchValue = req.getParameter("searchValue");

        if (searchValue == null || searchValue.isEmpty()) {
            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");
            resp.getWriter().write("[]");
            return;
        }

        LessonService lessonService = new LessonServiceImpl();
        List<Lesson> lessons = lessonService.searchLesson(searchValue);
        Set<String> lessonsSuggestionsSet = new HashSet<>();

        for(Lesson lesson : lessons) {
            lessonsSuggestionsSet.add(lesson.getTitle());
        }

        // Convert set to JSON
        Gson gson = new Gson();
        String json = gson.toJson(lessonsSuggestionsSet);

        // Set the return data type to JSON
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(json);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
