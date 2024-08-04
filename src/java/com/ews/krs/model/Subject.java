package com.ews.krs.model;

import java.util.Date;

public class Subject {
    int subject_id;
    String subject_name;
    int class_id;
    String description;
    String thumbail;
    Date created_at;
    int create_by;
    Date updated_at;
    int update_by;
    float rating;
    int setting_id;
    String teacherName;
    String categoryName;

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }


    public Subject() {
    }

    public Subject(int subject_id, String subject_name, int class_id, String description, String thumbail, Date created_at, int create_by, Date updated_at, int update_by, float rating, int category_id) {
        this.subject_id = subject_id;
        this.subject_name = subject_name;
        this.class_id = class_id;
        this.description = description;
        this.thumbail = thumbail;
        this.created_at = created_at;
        this.create_by = create_by;
        this.updated_at = updated_at;
        this.update_by = update_by;
        this.rating = rating;
    }

    public int getSetting_id() {
        return setting_id;
    }

    public void setSetting_id(int setting_id) {
        this.setting_id = setting_id;
    }

    public int getSubject_id() {
        return subject_id;
    }

    public void setSubject_id(int subject_id) {
        this.subject_id = subject_id;
    }

    public String getSubject_name() {
        return subject_name;
    }

    public void setSubject_name(String subject_name) {
        this.subject_name = subject_name;
    }

    public int getClass_id() {
        return class_id;
    }

    public void setClass_id(int class_id) {
        this.class_id = class_id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getThumbail() {
        return thumbail;
    }

    public void setThumbail(String thumbail) {
        this.thumbail = thumbail;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }

    public int getCreate_by() {
        return create_by;
    }

    public void setCreate_by(int create_by) {
        this.create_by = create_by;
    }

    public Date getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Date updated_at) {
        this.updated_at = updated_at;
    }

    public int getUpdate_by() {
        return update_by;
    }

    public void setUpdate_by(int update_by) {
        this.update_by = update_by;
    }

    public float getRating() {
        return rating;
    }

    public void setRating(float rating) {
        this.rating = rating;
    }

}
