/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ews.krs.model;

import java.io.Serializable;

/**
 *
 * @author hi
 */
public class Term implements Serializable {

  private int id;
  private String term;
  private String definition;
  private int studySetId;

  public Term() {
  }

  public Term(int id, String term, String definition, int studySetId) {
    this.id = id;
    this.term = term;
    this.definition = definition;
    this.studySetId = studySetId;
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getTerm() {
    return term;
  }

  public void setTerm(String term) {
    this.term = term;
  }

  public String getDefinition() {
    return definition;
  }

  public void setDefinition(String definition) {
    this.definition = definition;
  }

  public int getStudySetId() {
    return studySetId;
  }

  public void setStudySetId(int studySetId) {
    this.studySetId = studySetId;
  }

  @Override
  public String toString() {
    return "Term{" + "id=" + id + ", term=" + term + ", definition=" + definition + ", studySetId=" + studySetId + '}';
  }

}
