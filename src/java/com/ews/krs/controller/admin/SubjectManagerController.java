package com.ews.krs.controller.admin;

import com.ews.krs.model.Subject;
import com.ews.krs.model.SubjectManager;
import com.ews.krs.model.SystemSetting;
import com.ews.krs.model.User;
import com.ews.krs.service.SubjectManagerService;
import com.ews.krs.service.SubjectService;
import com.ews.krs.service.SystemSettingService;
import com.ews.krs.service.UserService;
import com.ews.krs.service.impl.SubjectManagerServiceImpl;
import com.ews.krs.service.impl.SubjectServiceImpl;
import com.ews.krs.service.impl.SystemSettingServiceImpl;
import com.ews.krs.service.impl.UserServiceImpl;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
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
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@MultipartConfig(fileSizeThreshold = 1024 * 1024, // 1 MB
        maxFileSize = 1024 * 1024 * 5,   // 5 MB
        maxRequestSize = 1024 * 1024 * 10) // 10 MB
@WebServlet(urlPatterns = {"/manager-subject", "/manager-subject/new", "/manager-subject/insert", "/manager-subject/delete", "/manager-subject/edit", "/manager-subject/update"})
public class SubjectManagerController extends HttpServlet {

    private static final String uploadPathOther = "D:\\Project_SWP\\JetBrainCode\\KRS\\src\\main\\webapp\\view\\user\\assets\\img\\courses"; // Set to your external directory path

    @Serial
    private static final long serialVersionUID = 1L;
    private final Logger logger = Logger.getLogger(SubjectManagerController.class);
    SubjectService subjectService;
    public void init() {
        subjectService = new SubjectServiceImpl();
        File uploadDirOther = new File(uploadPathOther);
        if (!uploadDirOther.exists()) {
            uploadDirOther.mkdirs();
        }
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
                case "/manager-subject/new":
                    showNewForm(request, response);
                    break;
                case "/manager-subject/insert":
                    insertSubject(request, response);
                    break;
                case "/manager-subject/delete":
                    deleteSubject(request, response);
                    break;
                case "/manager-subject/edit":
                    showEditForm(request, response);
                    break;
                case "/manager-subject/update":
                    updateSubject(request, response);
                    break;
                default:
                    listSubject(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new IOException(ex.getMessage());
        }

    }

    private void listSubject(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {

        List<Subject> subjects = subjectService.getAllSubject();

        UserService userService = new UserServiceImpl();
        List<User> users = userService.getAllUser();
        SubjectManagerService subjectManagerList = new SubjectManagerServiceImpl();
        List<SubjectManager> subjectManagers = subjectManagerList.getAllSubjectManager();
        SystemSettingService systemSettingService = new SystemSettingServiceImpl();
        List<SystemSetting> systemSettingList = systemSettingService.getAllSystem_setting();

        for(SystemSetting systemSetting : systemSettingList) {
            for(Subject subject : subjects) {
                if(subject.getSetting_id() == systemSetting.getSetting_id() && systemSetting.getSetting_name().equalsIgnoreCase("subject_category")) {
                    subject.setCategoryName(systemSetting.getSetting_value());
                }
            }
        }

        //Set teacher name for subject
        for(User teacher : users) {
            for (SubjectManager subjectManager : subjectManagers) {
                if (teacher.getUser_id() == subjectManager.getUser_id()) {
                    int subject_id = subjectManager.getSubject_id();
                    for(Subject subject : subjects){
                        if(subject.getSubject_id() == subject_id){
                            subject.setTeacherName(teacher.getFullname());
                        }
                    }
                }
            }
        }

        String searchValue = request.getParameter("searchValue");
        if(searchValue!= null && !searchValue.isEmpty()) {
            subjects = subjectService.searchSubject(searchValue);
            if (subjects.isEmpty()) {
                request.setAttribute("alertEmpty", "No subject is found!");
                request.getRequestDispatcher("/view/dashboard/subjects.jsp").forward(request, response);
                return;
            }
        }

        //Pagination
        int size = subjects.size();
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

        List<Subject> subjectListPage = subjects.subList(start, end);

        request.setAttribute("subjects", subjectListPage);
        request.setAttribute("numPage", numPage);
        request.setAttribute("page", page);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/dashboard/subjects.jsp");
        dispatcher.forward(request, response);
    }

    private void updateSubject(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String xSubjectId = request.getParameter("subject_id");

        int subjectId = Integer.parseInt(xSubjectId);

        Subject subject = subjectService.getSubject(subjectId);

        subject.setSubject_name(request.getParameter("subject_name"));
        subject.setRating(Float.parseFloat(request.getParameter("rating")));
        subject.setDescription(request.getParameter("description"));
        String categoryKey = request.getParameter("category");
        subject.setSetting_id(Integer.parseInt(categoryKey));



        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        subject.setUpdate_by(user.getUser_id());

        try {
            Part filePart = request.getPart("fileImage");
            String originalFileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String extension = "";

            int i = originalFileName.lastIndexOf('.');
            if (i >= 0) {
                extension = originalFileName.substring(i);
            }

            // Create a unique filename using a timestamp
            String fileName = "id_" + subject.getSubject_name() + "_" + System.currentTimeMillis() + extension;

            // Save the file to the server
            InputStream inputStream = filePart.getInputStream();
            Files.copy(inputStream, Paths.get(uploadPathOther + File.separator + fileName));
            System.out.println(uploadPathOther + File.separator + fileName);

            subject.setThumbail(fileName);
        } catch (IOException | ServletException e) {
            response.getWriter().println("File upload failed due to an error: " + e.getMessage());
        }

        subjectService.editSubject(subject);
        response.sendRedirect("../manager-subject");
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String subjectId = request.getParameter("subject_id");
        request.setAttribute("subjectId", subjectId);
        int xSubjectId = Integer.parseInt(subjectId);
        Subject subject = subjectService.getSubject(xSubjectId);

        UserService userService = new UserServiceImpl();
        List<User> users = userService.getAllUser();
        SubjectManagerService subjectManagerList = new SubjectManagerServiceImpl();
        List<SubjectManager> subjectManagers = subjectManagerList.getAllSubjectManager();
        SystemSettingService systemSettingService = new SystemSettingServiceImpl();
        List<SystemSetting> systemSettingList = systemSettingService.getAllSystem_setting();

        for(SystemSetting systemSetting : systemSettingList) {
            if(subject.getSetting_id() == systemSetting.getSetting_id() && systemSetting.getSetting_name().equalsIgnoreCase("subject_category")) {
                subject.setCategoryName(systemSetting.getSetting_value());
            }
        }

        //Set teacher name for subject
        for(User teacher : users) {
            for (SubjectManager subjectManager : subjectManagers) {
                if (teacher.getUser_id() == subjectManager.getUser_id()) {
                    int subject_id = subjectManager.getSubject_id();
                    if(subject.getSubject_id() == subject_id){
                        subject.setTeacherName(teacher.getFullname());
                    }
                }
            }
        }

        Map<Integer, String> categoryMap = new HashMap<Integer, String>();

        for(SystemSetting systemSetting : systemSettingList) {
            if(systemSetting.getSetting_name().equalsIgnoreCase("subject_category")) {
                categoryMap.put(systemSetting.getSetting_id(), systemSetting.getSetting_value());
            }
        }
        request.setAttribute("categoryMap", categoryMap);

        request.setAttribute("subject", subject);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/dashboard/edit-subject.jsp");
        dispatcher.forward(request, response);
    }

    private void deleteSubject(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String subject_id = request.getParameter("subject_id");
        int subjectId = Integer.parseInt(subject_id);
        Subject subject = subjectService.getSubject(subjectId);
        SubjectManagerService subjectManagerService = new SubjectManagerServiceImpl();
        subjectManagerService.deleteSubjectManager(subject.getCreate_by(),subjectId);
        subjectService.deleteSubject(subjectId);
        response.sendRedirect("../manager-subject");
    }

    private void insertSubject(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        logger.debug("prepare to insert..");
        Subject subject = getInputSubject(request, response);

        int subject_id_temp = subjectService.insertSubject(subject);

        SubjectManagerService subjectManagerService = new SubjectManagerServiceImpl();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        SubjectManager subjectManager = new SubjectManager(user.getUser_id(), subject_id_temp, "public");
        subjectManagerService.insertSubjectManager(subjectManager);

        response.sendRedirect("../manager-subject");
    }

    private Subject getInputSubject(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Subject subject = new Subject();

        String subjectName = request.getParameter("subject_name");
        String ratingStr = request.getParameter("rating");
        String description = request.getParameter("description");
        String categoryKey = request.getParameter("category");

        subject.setSubject_name(subjectName);
        subject.setRating(Float.parseFloat(ratingStr));
        subject.setDescription(description);
        subject.setSetting_id(Integer.parseInt(categoryKey));

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        subject.setCreate_by(user.getUser_id());
        subject.setUpdate_by(user.getUser_id());

        try {
            Part filePart = request.getPart("fileImage");
            String originalFileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String extension = "";

            int i = originalFileName.lastIndexOf('.');
            if (i >= 0) {
                extension = originalFileName.substring(i);
            }

            // Create a unique filename using a timestamp
            String fileName = "id_" + subject.getSubject_name() + "_" + System.currentTimeMillis() + extension;

            // Save the file to the server
            InputStream inputStream = filePart.getInputStream();
            Files.copy(inputStream, Paths.get(uploadPathOther + File.separator + fileName));
            System.out.println(uploadPathOther + File.separator + fileName);

            subject.setThumbail(fileName);
        } catch (IOException | ServletException e) {
            response.getWriter().println("File upload failed due to an error: " + e.getMessage());
        }

        return subject;
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/dashboard/add-subject.jsp");
        SystemSettingService systemSettingService = new SystemSettingServiceImpl();
        List<SystemSetting> systemSettingList = systemSettingService.getAllSystem_setting();
        Map<Integer, String> categoryMap = new HashMap<Integer, String>();

        for(SystemSetting systemSetting : systemSettingList) {
            if(systemSetting.getSetting_name().equalsIgnoreCase("subject_category")) {
                categoryMap.put(systemSetting.getSetting_id(), systemSetting.getSetting_value());
            }
        }
        request.setAttribute("categoryMap", categoryMap);
        dispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}