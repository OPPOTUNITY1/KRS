package com.ews.krs.service.impl;

import com.ews.krs.dao.PostDao;
import com.ews.krs.dao.impl.PostDaoImpl;
import com.ews.krs.model.Post;
import com.ews.krs.model.Subject;
import com.ews.krs.service.PostService;

import java.util.ArrayList;
import java.util.List;

public class PostServiceImpl implements PostService {
    PostDao postDao = new PostDaoImpl();
    @Override
    public void insertPost(Post post) {
        postDao.insertPost(post);
    }

    @Override
    public void editPost(Post post) {
        postDao.editPost(post);
    }

    @Override
    public void deletePost(Post post) {
        postDao.deletePost(post);
    }

    @Override
    public List<Post> getAllPost() {
        return postDao.getAllPost();
    }

    @Override
    public List<Post> getAllPostById(int setting_id) {
        return postDao.getAllPostById(setting_id);
    }

    @Override
    public Post getPostById(int id) {
        return postDao.getPostById(id);
    }

    @Override
    public List<Post> getFourLatestPost() {
        return postDao.getFourLatestPost();
    }

    @Override
    public List<Post> searchByTitle(String txtSearch) {
        return postDao.getPostByTitle(txtSearch);
    }

    @Override
    public List<Post> getListByPage(List<Post> list, int start, int end) {
        ArrayList<Post> arr = new ArrayList<>();
        for(int i = start; i<end;i++) {
            arr.add(list.get(i));
        }
        return arr;
    }
}
