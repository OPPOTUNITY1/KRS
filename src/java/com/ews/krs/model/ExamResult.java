package com.ews.krs.model;

public class ExamResult {
    private int result_id;
    private int exam_id;
    private float result;
    private int user_id;

    public ExamResult() {
    }

    public ExamResult(int result_id, int exam_id, float result, int user_id) {
        this.result_id = result_id;
        this.exam_id = exam_id;
        this.result = result;
        this.user_id = user_id;
    }

    public int getResult_id() {
        return result_id;
    }

    public void setResult_id(int result_id) {
        this.result_id = result_id;
    }

    public int getExam_id() {
        return exam_id;
    }

    public void setExam_id(int exam_id) {
        this.exam_id = exam_id;
    }

    public float getResult() {
        return result;
    }

    public void setResult(float result) {
        this.result = result;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }
}
