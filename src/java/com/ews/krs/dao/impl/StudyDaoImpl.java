/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ews.krs.dao.impl;

import com.ews.krs.dao.MyDAO;
import com.ews.krs.dao.StudyDao;
import com.ews.krs.model.StudySet;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class StudyDaoImpl extends MyDAO implements StudyDao {

  private static final String INSERT_SQL = "INSERT INTO study_set (set_name, subject_id, user_id) VALUES (?, ?, ?)";
  private static final String UPDATE_SQL = "UPDATE study_set SET set_name = ?, subject_id = ?, user_id = ? WHERE set_id = ?";
  private static final String DELETE_SQL = "DELETE FROM study_set WHERE set_id = ?";
  private static final String SELECT_BY_ID_SQL = "SELECT * FROM study_set WHERE set_id = ?";

  @Override
  public void insertStudy(StudySet studyset) {
    try {
      ps = con.prepareStatement(INSERT_SQL);
      ps.setString(1, studyset.getSetName());
      ps.setInt(2, studyset.getSubjectId());
      ps.setInt(3, studyset.getUserId());
      ps.executeUpdate();
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }

  @Override
  public void updateStudy(StudySet studyset) {

    try {
      ps = con.prepareStatement(UPDATE_SQL);
      ps.setString(1, studyset.getSetName());
      ps.setInt(2, studyset.getSubjectId());
      ps.setInt(3, studyset.getUserId());
      ps.setInt(4, studyset.getSetId());
      ps.executeUpdate();
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }

  @Override
  public void deleteStudy(StudySet studySet) {
    try {
      PreparedStatement ps = con.prepareStatement(DELETE_SQL);
      ps.setInt(1, studySet.getSetId());
      ps.executeUpdate();
    } catch (SQLException e) {
      e.printStackTrace();
    }

  }

  public StudySet getStudyById(int setId) {
    StudySet studySet = null;
    try {
      ps = con.prepareStatement(SELECT_BY_ID_SQL);
      ps.setInt(1, setId);
      try (ResultSet rs = ps.executeQuery()) {
        if (rs.next()) {
          studySet = new StudySet(
            rs.getInt("set_id"),
            rs.getString("set_name"),
            rs.getInt("subject_id"),
            rs.getInt("user_id")
          );
        }
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return studySet;
  }

  public List<StudySet> getAll() {
    String sql = "SELECT * FROM study_set";
    List<StudySet> studySets = new ArrayList<>();

    try (PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
      while (rs.next()) {
        StudySet studySet = new StudySet(
          rs.getInt("set_id"),
          rs.getString("set_name"),
          rs.getInt("subject_id"),
          rs.getInt("user_id")
        );
        studySets.add(studySet);
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return studySets;
  }

  public static void main(String[] args) {
    StudyDaoImpl daoImpl = new StudyDaoImpl();
    for (var s : daoImpl.getAll()) {
      System.out.println(s);
    }
  }

}
