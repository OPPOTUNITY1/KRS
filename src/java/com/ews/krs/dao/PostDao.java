package com.ews.krs.dao;

import com.ews.krs.model.Post;

import java.util.List;

public interface PostDao {

    void insertPost(Post post);

    void editPost(Post post);

    void deletePost(Post post);

    List<Post> getAllPost();

    List<Post> getAllPostById(int setting_id);

    Post getPostById(int id);

    List<Post> getPostByTitle(String title);

    List<Post> getFourLatestPost();

    List<Post> searchByTitle(String txtSearch);
}
