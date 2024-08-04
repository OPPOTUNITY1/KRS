package com.ews.krs.model;

public class ExamQuestion {
    private int exam_id;
    private int question_id;

    public ExamQuestion() {
    }

    public ExamQuestion(int exam_id, int question_id) {
        this.exam_id = exam_id;
        this.question_id = question_id;
    }

    public int getExam_id() {
        return exam_id;
    }

    public void setExam_id(int exam_id) {
        this.exam_id = exam_id;
    }

    public int getQuestion_id() {
        return question_id;
    }

    public void setQuestion_id(int question_id) {
        this.question_id = question_id;
    }
}
