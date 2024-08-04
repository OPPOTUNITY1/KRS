package com.ews.krs.model;

import java.util.Date;

public class Post {
    private int post_id;
    private String title;
    private String content;
    private String thumbnail;
    private Date created_at;
    private int created_by;
    private Date updated_at;
    private int updated_by;
    private int setting_id;

    public Post() {}

    public Post(String content, String title, String thumbnail, int create_by, Date create_at, Date update_at, int setting_id, int update_by) {
        this.content = content;
        this.title = title;
        this.thumbnail = thumbnail;
        this.created_by = create_by;
        this.created_at = create_at;
        this.updated_at = update_at;
        this.setting_id = setting_id;
        this.updated_by = update_by;
    }

    public Post(String title, String content, String thumbnail, int created_by, int update_by, int setting_id) {
        this.title = title;
        this.content = content;
        this.thumbnail = thumbnail;
        this.created_by = created_by;
        this.updated_by = update_by;
        this.setting_id = setting_id;
    }

    public int getPost_id() {
        return post_id;
    }

    public void setPost_id(int post_id) {
        this.post_id = post_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date create_at) {
        this.created_at = create_at;
    }

    public int getCreated_by() {
        return created_by;
    }

    public void setCreated_by(int create_by) {
        this.created_by = create_by;
    }

    public Date getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Date update_at) {
        this.updated_at = update_at;
    }

    public int getUpdated_by() {
        return updated_by;
    }

    public void setUpdated_by(int update_by) {
        this.updated_by = update_by;
    }

    public int getSetting_id() {
        return setting_id;
    }

    public void setSetting_id(int setting_id) {
        this.setting_id = setting_id;
    }
}
