package com.ews.krs.controller.user;

import com.ews.krs.dao.PostCommentDao;
import com.ews.krs.dao.impl.PostCommentDaoImpl;
import com.ews.krs.dao.impl.PostDaoImpl;
import com.ews.krs.dao.impl.SystemSettingDaoImpl;
import com.ews.krs.model.Post;
import com.ews.krs.model.PostComment;
import com.ews.krs.model.SystemSetting;
import com.ews.krs.model.User;
import com.ews.krs.service.UserService;
import com.ews.krs.service.impl.UserServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BlogDetailController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String xPost_id = request.getParameter("post_id");
        int post_id = Integer.parseInt(xPost_id);

        PostCommentDao postCommentDao = new PostCommentDaoImpl();

        String comment = request.getParameter("comment");
        if(comment != null) {
            PostComment postComment = new PostComment();
            postComment.setComment(comment);
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            if(user == null ) {
                request.getRequestDispatcher("/view/user/login.jsp").forward(request, response);
                return;
            } else {
                postComment.setUser_id(user.getUser_id());
                postComment.setPost_id(post_id);
                int comment_id = postCommentDao.insertPostComment(postComment);
            }
        }

        List<PostComment> postComments = postCommentDao.getAllPostComment();
        request.setAttribute("postComments", postComments);

        PostDaoImpl dao = new PostDaoImpl();

        Post post = dao.getPostById(post_id);

        request.setAttribute("post", post);

        UserService userService = new UserServiceImpl();

        List<User> users = userService.getAllUser();
        SystemSettingDaoImpl systemSettingDao = new SystemSettingDaoImpl();
        PostDaoImpl postDao = new PostDaoImpl();
        List<Post> listFourLatestPost = postDao.getFourLatestPost();
        request.setAttribute("listFourLatestPost", listFourLatestPost);

        //Category
        Map<Integer, String> categoriesMap = new HashMap<>();
        List<SystemSetting> listSystemSettings = systemSettingDao.getAllSystemSetting();

        for(SystemSetting systemSetting : listSystemSettings){
            if( systemSetting.getSetting_name().equals("subject_category") && systemSetting.getSetting_type().equals("subject")) {
                categoriesMap.put(systemSetting.getSetting_id(), systemSetting.getSetting_value());
            }
        }
        request.setAttribute("categoriesMap", categoriesMap);

        //User
        Map<Integer, String> usersMap = new HashMap<>();
        for(User user : users){
            usersMap.put(user.getUser_id(), user.getFullname());
        }

        Map<Integer, User> usersList = new HashMap<>();
        for(User user : users){
            usersList.put(user.getUser_id(), user);
        }

        request.setAttribute("usersMap", usersMap);
        request.setAttribute("usersList", usersList);

        request.getRequestDispatcher("/view/user/blog-details.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}