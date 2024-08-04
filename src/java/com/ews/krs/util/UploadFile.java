/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.ews.krs.util;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author hi
 */
@WebServlet(name = "UploadFile", urlPatterns = {"/UploadFile"})
@MultipartConfig(
  fileSizeThreshold = 1024 * 1024 * 10, // 1MB
  maxFileSize = 1024 * 1024 * 1000, // 10 MB
  maxRequestSize = 1024 * 1024 * 1500 // 100 MB
)
public class UploadFile extends HttpServlet {

  private final static String DIR = "files/";

  // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, IOException {
    req.getRequestDispatcher("view/test/upload.jsp").forward(req, resp);
  }

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, IOException {
    Part filePart = req.getPart("file");
    if (filePart == null) {
      resp.sendError(400);
      return;
    }
    String fileName = newName();// + filePart.getSubmittedFileName();

    String fileDir = getServletContext().getRealPath(DIR);
    String webPath = DIR + fileName;

    System.out.println(webPath);

    File dir = new File(fileDir);
    if (!dir.exists()) {
      dir.mkdirs();
    }

    for (Part part : req.getParts()) {
      part.write(fileDir + fileName);
    }

    req.setAttribute("fileDir", webPath);
    req.getRequestDispatcher("view/test/upload.jsp").forward(req, resp);

    resp.getWriter().print("The file uploaded successfully.");
  }

  private String newName() {
    LocalDateTime now = LocalDateTime.now();
    DateTimeFormatter f = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
    String str = now.format(f);
    return str;
  }

  @Override
  public String getServletInfo() {
    return "Short description";
  }// </editor-fold>

}
