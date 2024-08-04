package com.ews.krs.model;

import java.util.Date;

public class ExamConfig {
    private int config_id;
    private int lesson_id;
    private int exam_id;
    private Date start_date;
    private Date end_Date;
    private int maximum_score;
    private float pass_score;
    private int duration;
    private int question_count;
    private int status;

    public ExamConfig() {
    }

    public int getConfig_id() {
        return config_id;
    }

    public void setConfig_id(int config_id) {
        this.config_id = config_id;
    }

    public int getLesson_id() {
        return lesson_id;
    }

    public void setLesson_id(int lesson_id) {
        this.lesson_id = lesson_id;
    }

    public int getExam_id() {
        return exam_id;
    }

    public void setExam_id(int exam_id) {
        this.exam_id = exam_id;
    }

    public Date getStart_date() {
        return start_date;
    }

    public void setStart_date(Date start_date) {
        this.start_date = start_date;
    }

    public Date getEnd_Date() {
        return end_Date;
    }

    public void setEnd_Date(Date end_Date) {
        this.end_Date = end_Date;
    }

    public int getMaximum_score() {
        return maximum_score;
    }

    public void setMaximum_score(int maximum_score) {
        this.maximum_score = maximum_score;
    }

    public float getPass_score() {
        return pass_score;
    }

    public void setPass_score(float pass_score) {
        this.pass_score = pass_score;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public int getQuestion_count() {
        return question_count;
    }

    public void setQuestion_count(int question_count) {
        this.question_count = question_count;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

}
