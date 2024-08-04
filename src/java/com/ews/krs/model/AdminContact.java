package com.ews.krs.model;

public class AdminContact {
    private int contact_id;
    private String full_name;
    private String email;
    private String mobile;
    private int setting_id;
    private int create_by;
    private String subject_name;
    private String message;

    public AdminContact() {
    }

    public AdminContact(String full_name, String email, String mobile, int setting_id, int create_by, String subject_name, String message) {
        this.full_name = full_name;
        this.email = email;
        this.mobile = mobile;
        this.setting_id = setting_id;
        this.create_by = create_by;
        this.subject_name = subject_name;
        this.message = message;
    }

    public int getContact_id() {
        return contact_id;
    }

    public void setContact_id(int contact_id) {
        this.contact_id = contact_id;
    }

    public String getFull_name() {
        return full_name;
    }

    public void setFull_name(String full_name) {
        this.full_name = full_name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public int getSetting_id() {
        return setting_id;
    }

    public void setSetting_id(int setting_id) {
        this.setting_id = setting_id;
    }

    public int getCreate_by() {
        return create_by;
    }

    public void setCreate_by(int create_by) {
        this.create_by = create_by;
    }

    public String getSubject_name() {
        return subject_name;
    }

    public void setSubject_name(String subject_name) {
        this.subject_name = subject_name;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
