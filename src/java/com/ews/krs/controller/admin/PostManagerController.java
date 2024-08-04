package com.ews.krs.controller.admin;

import com.ews.krs.dao.PostCommentDao;
import com.ews.krs.dao.impl.PostCommentDaoImpl;
import com.ews.krs.dao.impl.PostDaoImpl;
import com.ews.krs.dao.impl.SystemSettingDaoImpl;
import com.ews.krs.model.*;
import com.ews.krs.service.PostService;
import com.ews.krs.service.SystemSettingService;
import com.ews.krs.service.UserService;
import com.ews.krs.service.impl.PostServiceImpl;
import com.ews.krs.service.impl.SystemSettingServiceImpl;
import com.ews.krs.service.impl.UserServiceImpl;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.security.MessageDigest;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 10,
        maxFileSize = 1024 * 1024 * 25,
        maxRequestSize = 1024 * 1024 * 50
)
@WebServlet(urlPatterns = {"/manager-post", "/manager-post/new", "/manager-post/insert", "/manager-post/delete", "/manager-post/edit", "/manager-post/update"})
public class PostManagerController extends HttpServlet {
    PostService postService = new PostServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");

        String action = request.getServletPath();
        System.out.println("action = " + action);

        try {
            switch (action) {
                case "/manager-post/new":
                    showNewForm(request, response);
                    break;
                case "/manager-post/insert":
                    insertPost(request, response);
                    break;
                case "/manager-post/delete":
                    deletePost(request, response);
                    break;
                case "/manager-post/edit":
                    showEditForm(request, response);
                    break;
                case "/manager-post/update":
                    updatePost(request, response);
                    break;
                default:
                    listPost(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new IOException(ex.getMessage());
        }
    }

    private void listPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        PostService postService = new PostServiceImpl();

        List<Post> posts = postService.getAllPost();

        UserService userService = new UserServiceImpl();
        List<User> users = userService.getAllUser();

        Map<Integer, User> usersList = new HashMap<>();
        for(User user : users){
            usersList.put(user.getUser_id(), user);
        }

        request.setAttribute("usersList", usersList);

        int size = posts.size();
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

        posts = posts.subList(start, end);

        request.setAttribute("posts", posts);
        request.setAttribute("numPage", numPage);
        request.setAttribute("page", page);

        request.getRequestDispatcher("/view/dashboard/post.jsp").forward(request, response);
    }

    private void updatePost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Post post = new Post();
        String xPost_id = request.getParameter("post_id");
        int post_id = Integer.parseInt(xPost_id);
        post = postService.getPostById(post_id);
        postService.editPost(getInputPostToUpdate(request, response, post));
        response.sendRedirect("../manager-post");
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String xPost_id = request.getParameter("post_id");
        int post_id = Integer.parseInt(xPost_id);
        Post post = postService.getPostById(post_id);

        request.setAttribute("post", post);
        Map<Integer, String> categoryMap = getIntegerStringMap();
        request.setAttribute("categoryMap", categoryMap);


        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/dashboard/edit-post.jsp");
        dispatcher.forward(request, response);
    }

    private static Map<Integer, String> getIntegerStringMap() {
        SystemSettingService systemSettingService = new SystemSettingServiceImpl();
        List<SystemSetting> systemSettingList = systemSettingService.getAllSystem_setting();
        Map<Integer, String> categoryMap = new HashMap<Integer, String>();

        for(SystemSetting systemSetting : systemSettingList) {
            if(systemSetting.getSetting_name().equalsIgnoreCase("subject_category")) {
                categoryMap.put(systemSetting.getSetting_id(), systemSetting.getSetting_value());
            }
        }
        return categoryMap;
    }

    private void deletePost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String xPost_id = request.getParameter("post_id");
        int post_id = Integer.parseInt(xPost_id);

        PostCommentDao postCommentDao = new PostCommentDaoImpl();
        postCommentDao.deletePostCommentByPostId(post_id);

        Post post = postService.getPostById(post_id);
        postService.deletePost(post);
        response.sendRedirect("../manager-post");
    }

    private void insertPost(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException, ServletException {
        if (!validateAddRequestParameter(request)) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Request not valid");
            return;
        }
        Post post = getInputPost(request, response);
        postService.insertPost(post);
        response.sendRedirect("../manager-post");
    }

    private Post getInputPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        HttpSession session = request.getSession(false);
        User user = null;
        if (session != null && session.getAttribute("user") != null) {
            user = (User) session.getAttribute("user");

            String title = request.getParameter("title");
            String content = request.getParameter("content");
            String categoryKey = request.getParameter("category");

            Part thumbnail = request.getPart("thumbnail");

            if(thumbnail != null) {
                try {
                    String webImageDir = "images/";
                    String webImgURL = createImage(thumbnail, webImageDir);
                    return new Post(title, content, webImgURL, user.getUser_id(), user.getUser_id(), Integer.parseInt(categoryKey));
                } catch (Exception e) {
                    e.printStackTrace();
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, e.getMessage());
                }
            }
            return new Post(title, content, "", user.getUser_id(), user.getUser_id(), Integer.parseInt(categoryKey));
        }
        return null;
    }

    private Post getInputPostToUpdate(HttpServletRequest request, HttpServletResponse response, Post post) throws IOException, ServletException {

        HttpSession session = request.getSession(false);
        User user = null;
        if (session != null && session.getAttribute("user") != null) {
            user = (User) session.getAttribute("user");

            String title = request.getParameter("title");
            String content = request.getParameter("content");
            String categoryKey = request.getParameter("category");

            post.setTitle(title);
            post.setContent(content);
            post.setSetting_id(Integer.parseInt(categoryKey));

            Part thumbnail = request.getPart("thumbnail");

            if(thumbnail != null) {
                try {
                    String webImageDir = "images/";
                    String webImgURL = createImage(thumbnail, webImageDir);
                    post.setThumbnail(webImgURL);
                    return post;
                } catch (Exception e) {
                    e.printStackTrace();
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, e.getMessage());
                }
            }
            return post;
        }
        return post;
    }

    private String createImage(Part image, String webImageDir) throws IOException {
        if (image == null || webImageDir == null) {
            return null;
        }
        String name = image.getSubmittedFileName();
        String extension = name.substring(name.lastIndexOf('.'));

        String timestamp = LocalDateTime.now()
                .format(DateTimeFormatter.ofPattern("yyyyMMdd_hhmmss"));
        String new_name = hash(timestamp + name) + extension;

        String img_dir = getServletContext().getRealPath(webImageDir);
        String web_path = webImageDir + new_name;
        String physical_path = img_dir + new_name;

        File dir = new File(img_dir);
        if (!dir.exists()) {
            dir.mkdirs();
        }

        image.write(physical_path);
        return web_path;
    }
    private String hash(String string) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            ByteArrayInputStream fis = new ByteArrayInputStream(string.getBytes());

            byte[] dataBytes = new byte[1024];

            int nread = 0;
            while ((nread = fis.read(dataBytes)) != -1) {
                md.update(dataBytes, 0, nread);
            };
            byte[] mdBytes = md.digest();

            //convert the byte to hex format method 1
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < mdBytes.length; i++) {
                sb.append(Integer.toString((mdBytes[i] & 0xff) + 0x100, 16).substring(1));
            }
            return sb.toString();
        } catch (Exception e) {
            return string;
        }
    }
    private boolean validateAddRequestParameter(HttpServletRequest req) throws IOException, ServletException {
        String title = req.getParameter("title");
        String content = req.getParameter("content");
        Part thumbnail = req.getPart("thumbnail");
        return title != null && !title.isBlank()
                && content != null && !content.isBlank();
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/dashboard/add-post.jsp");
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
