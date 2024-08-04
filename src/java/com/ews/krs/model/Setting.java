/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ews.krs.model;

/**
 *
 * @author hi
 */
public class Setting {

  public final static String USER = "user";
  public final static String SUBJECT = "subject";

  private int id;
  private String type;
  private String name;
  private String value;

  public Setting(int id, String type, String name, String value) {
    this.id = id;
    this.type = type;
    this.name = name;
    this.value = value;
  }

  @Override
  public String toString() {
    return "Setting{" + "id=" + id + ", type=" + type + ", name=" + name + ", value=" + value + '}';
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getType() {
    return type;
  }

  public void setType(String type) {
    this.type = type;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getValue() {
    return value;
  }

  public void setValue(String value) {
    this.value = value;
  }

}
