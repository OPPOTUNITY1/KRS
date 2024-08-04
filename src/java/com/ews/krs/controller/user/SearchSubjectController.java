package com.ews.krs.controller.user;

import com.ews.krs.model.Subject;
import com.ews.krs.service.SubjectService;
import com.ews.krs.service.impl.SubjectServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

public class SearchSubjectController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String query = request.getParameter("query");
        List<Subject> subjectList = getSubjectSuggestions(query);
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.println(subjectList);
    }

    private List<Subject> getSubjectSuggestions(String query) {
        SubjectService subjectService = new SubjectServiceImpl();
        List<Subject> subjectList = subjectService.getAllSubject();
        List<Subject> suggestions = new ArrayList<>();
        for (Subject subject : subjectList) {
            if (subject.getSubject_name().toLowerCase().contains(query.toLowerCase())) {
                suggestions.add(subject);
            }
        }
        return suggestions;
    }
}
