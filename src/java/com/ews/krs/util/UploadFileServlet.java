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

import java.io.IOException;

/**
 *
 * @author hi
 */
@WebServlet(name = "UploadFileServlet", urlPatterns = {"/view/test/fileuploadservlet"})
@MultipartConfig(
  fileSizeThreshold = 1024 * 1024 * 1, // 1MB
  maxFileSize = 1024 * 1024 * 1000, // 10 MB
  maxRequestSize = 1024 * 1024 * 1500 // 100 MB
)
public class UploadFileServlet extends HttpServlet {

  private static final long serialVersionUID = 1L;

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, IOException {

  }

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, IOException {
    String partition = "E:\\Web\\";
    Part filePart = req.getPart("file");
    String fileName = filePart.getSubmittedFileName();
    for (Part part : req.getParts()) {
      part.write(partition + fileName);
    }
    resp.getWriter().print("The file uploaded successfully.");
  }

  @Override
  public String getServletInfo() {
    return "Short description";
  }

}
