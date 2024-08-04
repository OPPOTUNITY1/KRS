package com.ews.krs.model;

import java.sql.Date;

/**
 *
 * @author ADMIN
 */
public class ClassExtends extends Classes {

    private String numOfStudents;
    private String teacherName;

    public ClassExtends() {
    }

    public ClassExtends(int classId, String className, String description, Date createdAt, int createdBy, Date updatedAt, int updatedBy, int teacherId, int settingId, String numOfStudents, String teacherName) {
        super(classId, className, description, createdAt, createdBy, updatedAt, updatedBy, teacherId, settingId);
        this.numOfStudents = numOfStudents;
        this.teacherName = teacherName;
    }

    public String getNumOfStudents() {
        return numOfStudents;
    }

    public void setNumOfStudents(String numOfStudents) {
        this.numOfStudents = numOfStudents;
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }
    
}
