/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ews.krs.model;

import java.io.Serializable;

/**
 *
 * @author admin
 */
public class StudySet implements Serializable {

  int setId;
  String setName;
  int subjectId;
  int userId;
//    String subjectName;
//    String UserName;

  public StudySet() {
  }

  public StudySet(int setId, String setName, int subjectId, int userId) {
    this.setId = setId;
    this.setName = setName;
    this.subjectId = subjectId;
    this.userId = userId;
  }

  public int getSetId() {
    return setId;
  }

  public void setSetId(int setId) {
    this.setId = setId;
  }

  public String getSetName() {
    return setName;
  }

  public void setSetName(String setName) {
    this.setName = setName;
  }

  public int getSubjectId() {
    return subjectId;
  }

  public void setSubjectId(int subjectId) {
    this.subjectId = subjectId;
  }

  public int getUserId() {
    return userId;
  }

  public void setUserId(int userId) {
    this.userId = userId;
  }

}
