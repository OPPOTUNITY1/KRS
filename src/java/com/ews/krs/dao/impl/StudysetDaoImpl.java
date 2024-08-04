/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ews.krs.dao.impl;

import com.ews.krs.dao.MyDAO;
import com.ews.krs.dao.StudyDao;
import com.ews.krs.model.StudySet;
import com.ews.krs.model.Term;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

/**
 *
 * @author admin
 */
public class StudysetDaoImpl extends MyDAO implements StudyDao {

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

  public static void main(String[] args) {
    StudysetDaoImpl sdi = new StudysetDaoImpl();

    try {

//      StudySet studySet = new StudySet(0, "TEST_STUDYSET", 1, 1);
//      List<Term> terms = new ArrayList<>();
//      terms.add(new Term(0, "T1", DELETE_SQL, 0));
//      terms.add(new Term(0, "T2", DELETE_SQL, 0));
//      terms.add(new Term(0, "T3", DELETE_SQL, 0));
//      terms.add(new Term(0, "T4", DELETE_SQL, 0));
//      terms.add(new Term(0, "T5", DELETE_SQL, 0));
//      terms.add(new Term(0, "T6", DELETE_SQL, 0));
//      terms.add(new Term(0, "T7", DELETE_SQL, 0));
//      sdi.insertStudy(studySet, terms);
      for (StudySet s : sdi.getAll()) {
        System.out.println(s.getSetName());
      }

    } catch (Exception e) {
      e.printStackTrace();
    }
  }

  public void insertStudy(StudySet studyset, List<Term> terms) {
    PreparedStatement psStudyset = null;
    PreparedStatement psTerm = null;
    ResultSet rs = null;

    try {
      String studysetSql = "INSERT INTO study_set (set_name, subject_id, user_id) VALUES (?, ?, ?)";
      psStudyset = con.prepareStatement(studysetSql, PreparedStatement.RETURN_GENERATED_KEYS);
      psStudyset.setString(1, studyset.getSetName());
      psStudyset.setInt(2, studyset.getSubjectId());
      psStudyset.setInt(3, studyset.getUserId());
      psStudyset.executeUpdate();

      rs = psStudyset.getGeneratedKeys();
      int studySetId = 0;
      if (rs.next()) {
        studySetId = rs.getInt(1);
      }

      String termSql = "INSERT INTO term (term, definition, study_set_id) VALUES (?, ?, ?)";
      psTerm = con.prepareStatement(termSql);

      for (Term term : terms) {
        psTerm.setString(1, term.getTerm());
        psTerm.setString(2, term.getDefinition());
        psTerm.setInt(3, studySetId);
        psTerm.addBatch();
      }
      psTerm.executeBatch();

    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      try {
        if (rs != null) {
          rs.close();
        }
        if (psStudyset != null) {
          psStudyset.close();
        }
        if (psTerm != null) {
          psTerm.close();
        }
      } catch (SQLException e) {
        e.printStackTrace();
      }
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

  public List<Term> selectAllTerms() throws SQLException {
    List<Term> terms = new ArrayList<>();
    String sql = "SELECT * FROM term";
    ps = con.prepareStatement(sql);
    rs = ps.executeQuery();
    while (rs.next()) {
      terms.add(constructTerm(rs));
    }
    return terms;
  }

  public List<Term> selectAllTerms(int studySetId) throws SQLException {
    List<Term> terms = new ArrayList<>();
    String sql = "SELECT * FROM term WHERE study_set_id=?";
    ps = con.prepareStatement(sql);
    ps.setInt(1, studySetId);
    rs = ps.executeQuery();
    while (rs.next()) {
      terms.add(constructTerm(rs));
    }
    return terms;
  }

  public int updateAllTerms(List<Term> terms, int studySetId) throws SQLException {
    int rowsAffected = 0;

    List<Term> currentTerms = selectAllTerms(studySetId);

    Map<Integer, Term> currentTermMap = currentTerms.stream()
      .collect(Collectors.toMap(Term::getId, term -> term));
    Set<Integer> newTermIds = terms.stream()
      .map(Term::getId)
      .collect(Collectors.toSet());

    try {
      con.setAutoCommit(false);

      String deleteSql = "DELETE FROM term WHERE term_id = ?";
      PreparedStatement deletePs = con.prepareStatement(deleteSql);
      for (Term currentTerm : currentTerms) {
        if (!newTermIds.contains(currentTerm.getId())) {
          deletePs.setInt(1, currentTerm.getId());
          deletePs.addBatch();
        }
      }

      String insertSql = "INSERT INTO term (term, definition, study_set_id) VALUES (?, ?, ?)";
      PreparedStatement insertPs = con.prepareStatement(insertSql);
      String updateSql = "UPDATE term SET term = ?, definition = ? WHERE term_id = ?";
      PreparedStatement updatePs = con.prepareStatement(updateSql);
      for (Term term : terms) {
        if (term.getId() == 0) {
          insertPs.setString(1, term.getTerm());
          insertPs.setString(2, term.getDefinition());
          insertPs.setInt(3, studySetId);
          insertPs.addBatch();
        } else if (currentTermMap.containsKey(term.getId())) {
          Term currentTerm = currentTermMap.get(term.getId());
          if (!term.getTerm().equals(currentTerm.getTerm())
            || !term.getDefinition().equals(currentTerm.getDefinition())) {
            updatePs.setString(1, term.getTerm());
            updatePs.setString(2, term.getDefinition());
            updatePs.setInt(3, term.getId());
            updatePs.addBatch();
          }
        }
      }

      int[] deleteCounts = deletePs.executeBatch();
      int[] insertCounts = insertPs.executeBatch();
      int[] updateCounts = updatePs.executeBatch();

      con.commit();

      for (int count : deleteCounts) {
        rowsAffected += count;
      }
      for (int count : insertCounts) {
        rowsAffected += count;
      }
      for (int count : updateCounts) {
        rowsAffected += count;
      }

    } catch (SQLException e) {
      con.rollback();
      throw e;
    } finally {
      con.setAutoCommit(true);
    }

    return rowsAffected;
  }

  public int deleteAllTerms(int studySetId) throws SQLException {
    String sql = "DELETE FROM term WHERE study_set_id = ?";
    ps = con.prepareStatement(sql);
    ps.setInt(1, studySetId);
    int rows = ps.executeUpdate();
    return rows;
  }

  public int deleteTerm(int id) throws SQLException {
    String sql = "DELETE FROM term WHERE term_id = ?";
    ps = con.prepareStatement(sql);
    ps.setInt(1, id);
    int rows = ps.executeUpdate();
    return rows;
  }

  private Term constructTerm(ResultSet rs) throws SQLException {
    return new Term(
      rs.getInt("term_id"),
      rs.getString("term"),
      rs.getString("definition"),
      rs.getInt("study_set_id")
    );
  }

}
