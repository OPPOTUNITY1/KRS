package com.ews.krs.model;

public class Exam {
    private int exam_id;
    private String exam_name;
    private int subject_id;

    public Exam() {
    }

    public Exam(int exam_id, String exam_name, int subject_id) {
        this.exam_id = exam_id;
        this.exam_name = exam_name;
        this.subject_id = subject_id;
    }

    public int getExam_id() {
        return exam_id;
    }

    public void setExam_id(int exam_id) {
        this.exam_id = exam_id;
    }

    public String getExam_name() {
        return exam_name;
    }

    public void setExam_name(String exam_name) {
        this.exam_name = exam_name;
    }

    public int getSubject_id() {
        return subject_id;
    }

    public void setSubject_id(int subject_id) {
        this.subject_id = subject_id;
    }
}
