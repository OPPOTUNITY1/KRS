/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.ews.krs.controller.admin;

import com.ews.krs.dao.impl.StudysetDaoImpl;
import com.ews.krs.dao.impl.SubjectDaoImpl;
import com.ews.krs.dao.impl.UserDaoImpl;
import com.ews.krs.model.*;
import com.ews.krs.service.SystemSettingService;
import com.ews.krs.service.impl.SystemSettingServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author hi
 */
public class StudysetSetting extends HttpServlet {

  private static final StudysetDaoImpl sdi = new StudysetDaoImpl();
  private static final SubjectDaoImpl sbjdi = new SubjectDaoImpl();
  private static final UserDaoImpl udi = new UserDaoImpl();

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, IOException {



    HttpSession session = req.getSession(true);
    User user = (User) session.getAttribute("user");
    if(user == null) {
      resp.sendRedirect(req.getContextPath() + "/login");
      return;
    }

    SystemSettingService systemSettingService = new SystemSettingServiceImpl();
    List<SystemSetting> systemSettingList = systemSettingService.getAllSystem_setting();

    if (session != null && session.getAttribute("user") != null) {
      User currentUser = (User) session.getAttribute("user");
      for (SystemSetting systemSetting : systemSettingList) {
        if (systemSetting.getSetting_id() == currentUser.getSetting_id() &&
                systemSetting.getSetting_name().equals("user_role") &&
                systemSetting.getSetting_type().equals("user")) {
          String userRole = systemSetting.getSetting_value().toUpperCase();
          req.setAttribute("userRole", userRole);
          session.setAttribute("role", userRole);
          break;
        }
      }
    }

    String action = req.getServletPath();
    switch (action) {
      case "/studyset/new" ->
        addSsForm(req, resp);
      case "/studyset/delete" ->
        deleteMaterial(req, resp);
      case "/studyset/update" ->
        updateSs(req, resp);
      default -> {
        try {
          int studySetId = Integer.parseInt(req.getParameter("id"));
          StudySet studySet = sdi.getStudyById(studySetId);

          req.setAttribute("studyset", studySet);
          req.setAttribute("terms", sdi.selectAllTerms(studySetId));
          req.setAttribute("subject", sbjdi.getSubject(studySet.getSubjectId()));
          req.setAttribute("author", udi.getUser(studySet.getUserId()));

          req.getRequestDispatcher("view/dashboard/study.jsp").forward(req, resp);
          return;

        } catch (Exception e) {
        }

        loadData(req, resp);
      }
    }
  }

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, IOException {
    HttpSession session = req.getSession(false);
    if (session != null && session.getAttribute("user") != null) {
      User user = (User) session.getAttribute("user");
      req.setAttribute("userRole", user.getRoleName());
      String action = req.getServletPath();
      switch (action) {
        case "/studyset/insert":
          insertSs(req, resp);
          break;
        case "/studyset/update":
          updateSs(req, resp);
          break;
        default:
          doGet(req, resp);
          break;
      }
    } else {
      resp.sendRedirect(getServletContext().getContextPath() + "/login?redirect=" + req.getServletPath());
    }
  }

  private void addSsForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    try {
      int studysetId = Integer.parseInt(req.getParameter("id"));
      req.setAttribute("studyset", sdi.getStudyById(studysetId));
      req.setAttribute("terms", sdi.selectAllTerms(studysetId));

    } catch (Exception ex) {
      System.err.println(ex.getMessage());
    } finally {
      req.setAttribute("subjects", sbjdi.getAllSubject());
      req.setAttribute("users", udi.getAllUser());
      req.getRequestDispatcher("../view/dashboard/add-studyset.jsp").forward(req, resp);

    }
  }

  private void insertSs(HttpServletRequest req, HttpServletResponse resp) throws IOException {
    String name;
    int subject_id, user_id;
    List<Term> terms = new ArrayList<>();

    try {
      name = req.getParameter("name");
      if (name == null || name.isBlank()) {
        throw new Exception();
      }
      HttpSession ses = req.getSession(false);
      subject_id = Integer.parseInt(req.getParameter("subject_id"));
      user_id = ((User) ses.getAttribute("user")).getUser_id();

      int index = 0;
      while (true) {
        String term = req.getParameter("term_" + index);
        String definition = req.getParameter("definition_" + index);

        if (term == null || definition == null) {
          break;
        }

        terms.add(new Term(0, term, definition, 0));
        index++;
      }

      if (terms.size() == 0) {
        throw new Exception("No terms or definitions added");
      }

    } catch (Exception e) {
      resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "requires name, subject_id and user_id");
      return;
    }

    sdi.insertStudy(new StudySet(0, name, subject_id, user_id), terms);
    resp.sendRedirect("../studyset");
  }

  private void deleteMaterial(HttpServletRequest req, HttpServletResponse resp) throws IOException {
    try {
      int id = Integer.parseInt(req.getParameter("id"));
      StudySet set = sdi.getStudyById(id);
      if (set == null) {
        throw new Exception();
      }
      sdi.deleteStudy(set);

      resp.sendRedirect("../studyset");

    } catch (Exception e) {
      resp.sendError(400);
    }
  }

  private void updateSs(HttpServletRequest req, HttpServletResponse resp) throws IOException {
    String name;
    int subject_id, studysetId;
    List<Term> terms = new ArrayList<>();

    try {
      name = req.getParameter("name");
      if (name == null || name.isBlank()) {
        throw new Exception("Name cannot be null or blank");
      }
      subject_id = Integer.parseInt(req.getParameter("subject_id"));
      studysetId = Integer.parseInt(req.getParameter("studysetId"));
      HttpSession session = req.getSession(false);

      if (session == null) {
        resp.sendError(500);
      }

      User user = (User) session.getAttribute("user");
      int user_id = user.getUser_id();

      int index = 0;
      while (true) {
        String term = req.getParameter("term_" + index);
        String definition = req.getParameter("definition_" + index);
        String termIdStr = req.getParameter("termid_" + index);

        if (term == null || definition == null || termIdStr == null) {
          break;
        }

        int termId = Integer.parseInt(termIdStr);
        terms.add(new Term(termId, term, definition, studysetId));
        index++;
      }

      if (terms.size() == 0) {
        throw new Exception("No terms or definitions added");
      }

      sdi.updateStudy(new StudySet(studysetId, name, subject_id, user_id));
      sdi.updateAllTerms(terms, studysetId);

    } catch (Exception e) {
      e.printStackTrace();
//      resp.sendRedirect("../studyset?");

      resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Requires name, subject_id and user_id");
      return;
    }

    resp.sendRedirect("../studyset?id=" + studysetId);
  }

  private void loadData(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    Map<Integer, Subject> subjects = new HashMap<>();
    Map<Integer, User> users = new HashMap<>();
    sbjdi.getAllSubject().forEach(sbj -> subjects.put(sbj.getSubject_id(), sbj));
    udi.getAllUser().forEach(u -> users.put(u.getUser_id(), u));

    req.setAttribute("subjects", subjects);
    req.setAttribute("users", users);
    req.setAttribute("studysets", sdi.getAll());
    req.getRequestDispatcher("view/dashboard/studyset-list.jsp").forward(req, resp);
  }

}
