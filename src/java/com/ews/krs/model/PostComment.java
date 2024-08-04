package com.ews.krs.model;

import java.util.Date;

public class PostComment {
    private int comment_id;
    private int post_id;
    private int user_id;
    private String comment;
    private Date created_at;

    public PostComment() {
    }

    public PostComment(int post_id, int user_id, String comment, Date created_at) {
        this.post_id = post_id;
        this.user_id = user_id;
        this.comment = comment;
        this.created_at = created_at;
    }

    public PostComment(int post_id, int user_id, String comment) {
        this.post_id = post_id;
        this.user_id = user_id;
        this.comment = comment;
    }

    public int getComment_id() {
        return comment_id;
    }

    public void setComment_id(int comment_id) {
        this.comment_id = comment_id;
    }

    public int getPost_id() {
        return post_id;
    }

    public void setPost_id(int post_id) {
        this.post_id = post_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }
}
