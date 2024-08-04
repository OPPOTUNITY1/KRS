package com.ews.krs.service;

import com.ews.krs.model.Post;
import com.ews.krs.model.Subject;

import java.util.List;

public interface PostService {

    void insertPost(Post post);

    void editPost(Post post);

    void deletePost(Post post);

    List<Post> getAllPost();

    List<Post> getAllPostById(int setting_id);

    Post getPostById(int id);

    List<Post> getFourLatestPost();

    List<Post> searchByTitle(String txtSearch);
    List<Post> getListByPage(List<Post> list, int start, int end);
}
