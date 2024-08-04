package com.ews.krs.controller.user;

import com.ews.krs.dao.impl.PostDaoImpl;
import com.ews.krs.dao.impl.SystemSettingDaoImpl;
import com.ews.krs.dao.impl.UserDaoImpl;
import com.ews.krs.model.*;
import com.ews.krs.service.PostService;
import com.ews.krs.service.UserService;
import com.ews.krs.service.impl.PostServiceImpl;
import com.ews.krs.service.impl.UserServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.*;

public class BlogController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PostDaoImpl postDao = new PostDaoImpl();
        SystemSettingDaoImpl systemSettingDao = new SystemSettingDaoImpl();
        UserService userService = new UserServiceImpl();
        PostService postService = new PostServiceImpl();

        List<User> users = userService.getAllUser();
        List<Post> postList = postDao.getAllPost();
        List<SystemSetting> listSystemSettings = systemSettingDao.getAllSystemSetting();
        List<Post> listFourLatestPost = postDao.getFourLatestPost();

        //Category
        Map<Integer, String> categoriesMap = new HashMap<>();

        for(SystemSetting systemSetting : listSystemSettings){
            if( systemSetting.getSetting_name().equals("subject_category") && systemSetting.getSetting_type().equals("subject")) {
                categoriesMap.put(systemSetting.getSetting_id(), systemSetting.getSetting_value());
            }
        }

        //User
        Map<Integer, String> usersMap = new HashMap<>();
        for(User user : users){
            usersMap.put(user.getUser_id(), user.getFullname());
        }

        String xCate = request.getParameter("cate_id");
        if(xCate != null) {
            int cate_id = Integer.parseInt(xCate);
            postList = postDao.getAllPostById(cate_id);
        }

        String title = request.getParameter("title");
        if(title != null) {
            postList = postDao.getPostByTitle(title);
        }

        //Pagination
        int size = postList.size();
        int numPerPage = 6;
        int page;
        int numPage = size % numPerPage == 0? (int) size/numPerPage : (int) size/numPerPage + 1;
        String xPage = request.getParameter("page");

        if(xPage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xPage);
        }

        if(page < 1) {
            page = 1;
        }
        if(page > numPage) {
            page = numPage;
        }

        int start = (page-1)*numPerPage;
        int end = Math.min(page*numPerPage, size);

        if(!postList.isEmpty()) {
            postList = postService.getListByPage(postList, start, end);
        }

        request.setAttribute("numPage", numPage);
        request.setAttribute("page", page);
        request.setAttribute("postList", postList);
        request.setAttribute("categoriesMap", categoriesMap);
        request.setAttribute("usersMap", usersMap);

        request.setAttribute("listFourLatestPost", listFourLatestPost);

        request.getRequestDispatcher("/view/user/blog.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/view/user/blog.jsp").forward(request, response);
    }
}