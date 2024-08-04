package com.ews.krs.model;

public class SubjectManager {
    private int user_id;
    private int subject_id;
    private String status;

    public SubjectManager() {
    }

    public SubjectManager(int user_id, int subject_id, String status) {
        this.user_id = user_id;
        this.subject_id = subject_id;
        this.status = status;
    }

    public SubjectManager(int subject_id, int user_id) {
        this.subject_id = subject_id;
        this.user_id = user_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getSubject_id() {
        return subject_id;
    }

    public void setSubject_id(int subject_id) {
        this.subject_id = subject_id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
