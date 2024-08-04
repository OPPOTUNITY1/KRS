package com.ews.krs.dao;

import com.ews.krs.model.PostComment;

import java.util.List;

public interface PostCommentDao {
    int insertPostComment(PostComment postComment);
    void editPostComment(PostComment newPostComment);
    void deletePostComment(int id);
    void deletePostCommentByPostId(int id);
    PostComment getPostComment(int id);
    List<PostComment> getAllPostComment();
}
