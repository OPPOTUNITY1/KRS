package com.ews.krs.controller.admin;

import com.ews.krs.dao.impl.MaterialDaoImpl;
import com.ews.krs.dao.impl.SubjectDaoImpl;
import com.ews.krs.model.Material;
import com.ews.krs.model.Subject;
import com.ews.krs.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

//@WebServlet(name = "MaterialSetting", urlPatterns = {"/material-setting", "/material-setting/new", "/material-setting/insert", "/material-setting/update", "/material-setting/delete"})
@MultipartConfig(
  fileSizeThreshold = 1024 * 1024 * 10, // 10MB
  maxFileSize = 1024 * 1024 * 1000, // 1000 MB
  maxRequestSize = 1024 * 1024 * 1500 // 1500 MB
)
public class MaterialSetting extends HttpServlet {

  private static final String DIR = "files/";
  private static final MaterialDaoImpl mdi = new MaterialDaoImpl();
  private static final SubjectDaoImpl sdi = new SubjectDaoImpl();

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    String action = req.getServletPath();
    HttpSession session = req.getSession(true);
    if((User) session.getAttribute("user") == null) {
      resp.sendRedirect(req.getContextPath() + "/login");
      return;
    }
    switch (action) {
      case "/material-setting/new":
        addMaterialForm(req, resp);
        break;
      case "/material-setting/delete":
        deleteMaterial(req, resp);
        break;
      default:
        List<Subject> subjectList = sdi.getAllSubject();
        Map<Integer, Subject> subjects = new HashMap<>();
        subjectList.forEach(s -> subjects.put(s.getSubject_id(), s));
        req.setAttribute("subjects", subjects);

        req.setAttribute("material_list", mdi.getAll());
        req.getRequestDispatcher("view/dashboard/material-list.jsp").forward(req, resp);
        break;
    }
  }

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    HttpSession session = req.getSession(false);
    if (session != null && session.getAttribute("user") != null) {
      User user = (User) session.getAttribute("user");
      req.setAttribute("userRole", user.getRoleName());
      String action = req.getServletPath();
      switch (action) {
        case "/material-setting/insert":
          insertMaterial(req, resp);
          break;
        case "/material-setting/update":
          updateMaterial(req, resp);
          break;
        default:
          doGet(req, resp);
          break;
      }
    } else {
      resp.sendRedirect("home");
    }
  }

  @Override
  public String getServletInfo() {
    return "Material setting servlet";
  }

  private void insertMaterial(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
    Part file;
    int subjectId;
    try {
      file = req.getPart("file");
      if (file == null) {
        throw new Exception("file not found");
      }
      subjectId = Integer.parseInt(req.getParameter("subject_id"));
    } catch (Exception e) {
      resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "requires subject_id and file");
      return;
    }

    String fileName =  file.getSubmittedFileName();
    String localPath = getServletContext().getRealPath(DIR);
    String webPath = DIR + fileName;

    Files.createDirectories(Paths.get(localPath));

    for (Part part : req.getParts()) {
      part.write(localPath + fileName);
    }

    mdi.insert(new Material(subjectId, webPath));
    resp.sendRedirect("../material-setting");
  }

  private void updateMaterial(HttpServletRequest req, HttpServletResponse resp) {
    throw new UnsupportedOperationException("Not supported yet.");
  }

  private String newName() {
    LocalDateTime now = LocalDateTime.now();
    DateTimeFormatter f = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
    return now.format(f);
  }

  private void addMaterialForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    req.setAttribute("subject_list", sdi.getAllSubject());
    req.getRequestDispatcher("../view/dashboard/add-material.jsp").forward(req, resp);
  }

  private void deleteMaterial(HttpServletRequest req, HttpServletResponse resp) throws IOException {
    try {
      int id = Integer.parseInt(req.getParameter("id"));
      Material material = mdi.get(id);
      if (material == null) {
        throw new Exception();
      }
      mdi.delete(material);

      {
        try {
           String mess = req.getParameter("mess");
          Path path = Paths.get(material.getMaterialFile());
          Files.delete(path);
          System.out.println("File deleted successfully: " + material.getMaterialFile());
          req.setAttribute("Delete succedd", mess);
        } catch (Exception e) {
          System.err.println("Failed to delete file: " + material.getMaterialFile());
          e.printStackTrace();
        }
      }

      
      resp.sendRedirect("../view/dashboard/material-list.jsp");

    } catch (Exception e) {
      resp.sendError(400);
      return;
    }
  }
}
