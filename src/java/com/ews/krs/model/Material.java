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
public class Material implements Serializable {

  private int id;
  private int subject_id;
  private String materialFile;

  public Material() {
  }

  public Material(int id, int subject_id, String materialFile) {
    this.id = id;
    this.subject_id = subject_id;
    this.materialFile = materialFile;
  }

  public Material(int subject_id, String materialFile) {
    this(0, subject_id, materialFile);
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public int getSubject_id() {
    return subject_id;
  }

  public void setSubject_id(int subject_id) {
    this.subject_id = subject_id;
  }

  public String getMaterialFile() {
    return materialFile;
  }

  public void setMaterialFile(String materialFile) {
    this.materialFile = materialFile;
  }

}
