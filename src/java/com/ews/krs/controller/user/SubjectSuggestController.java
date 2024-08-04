package com.ews.krs.controller.user;

import com.ews.krs.model.Subject;
import com.ews.krs.service.SubjectService;
import com.ews.krs.service.impl.SubjectServiceImpl;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet({"/getSuggestions", "/subject/getSuggestions"})
public class SubjectSuggestController extends HttpServlet
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

        SubjectService subjectService = new SubjectServiceImpl();
        List<Subject> subjects = subjectService.searchSubject(searchValue);



        //Convert list to JSON
        Gson gson = new Gson();
        String json = gson.toJson(subjects);

        //Set the return data type to JSON
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(json);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
