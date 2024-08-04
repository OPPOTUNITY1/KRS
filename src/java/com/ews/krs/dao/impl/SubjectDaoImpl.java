package com.ews.krs.dao.impl;

import com.ews.krs.dao.MyDAO;
import com.ews.krs.dao.SubjectDao;
import com.ews.krs.model.Subject;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SubjectDaoImpl extends MyDAO implements SubjectDao {

    @Override
    public int insertSubject(Subject subject) {
        int subject_id = 0;
        String sql = "INSERT INTO subject (subject_name, description, thumbail, created_at, created_by, updated_at, updated_by, rating, setting_id) " +
                "VALUES (?, ?, ?, NOW(), ?, NOW(), ?, ?, ?)";

        try (PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, subject.getSubject_name());
            ps.setString(2, subject.getDescription());
            ps.setString(3, subject.getThumbail());
            ps.setInt(4, subject.getCreate_by());
            ps.setInt(5, subject.getUpdate_by());
            ps.setFloat(6, subject.getRating());
            ps.setInt(7, subject.getSetting_id());

            int rowAffected = ps.executeUpdate();
            if (rowAffected > 0) {
                try (ResultSet rs = ps.getGeneratedKeys()) {
                    if (rs.next()) {
                        subject_id = rs.getInt(1);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return subject_id;
    }



    @Override
    public void editSubject(Subject newSubject) {
        try {
            ps = con.prepareStatement("UPDATE subject SET subject_name = ?, description = ?, thumbail = ?, created_at = ?, created_by = ?, updated_at = ?, updated_by = ?, rating = ?, setting_id = ? WHERE subject_id = ?");
            ps.setString(1, newSubject.getSubject_name());
            ps.setString(2, newSubject.getDescription());
            ps.setString(3, newSubject.getThumbail());
            ps.setTimestamp(4, new java.sql.Timestamp(newSubject.getCreated_at().getTime()));
            ps.setInt(5, newSubject.getCreate_by());
            ps.setTimestamp(6, new java.sql.Timestamp(newSubject.getUpdated_at().getTime()));
            ps.setInt(7, newSubject.getUpdate_by());
            ps.setFloat(8, newSubject.getRating());
            ps.setInt(9, newSubject.getSetting_id());
            ps.setInt(10, newSubject.getSubject_id());

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public void deleteSubject(int id) {
        try {
            String sql = "DELETE FROM subject WHERE subject_id = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public Subject getSubject(int id) {
        Subject subject = null;
        try {
            String sql = "SELECT * FROM subject WHERE subject_id = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                subject = new Subject();
                subject.setSubject_id(rs.getInt("subject_id"));
                subject.setSubject_name(rs.getString("subject_name"));
                subject.setDescription(rs.getString("description"));
                subject.setThumbail(rs.getString("thumbail"));
                subject.setCreated_at(rs.getTimestamp("created_at"));
                subject.setCreate_by(rs.getInt("created_by"));
                subject.setUpdated_at(rs.getTimestamp("updated_at"));
                subject.setUpdate_by(rs.getInt("updated_by"));
                subject.setRating(rs.getFloat("rating"));
                subject.setSetting_id(rs.getInt("setting_id"));

                Timestamp createdAtTimestamp = rs.getTimestamp("created_at");
                if (createdAtTimestamp != null) {
                    subject.setCreated_at(new java.util.Date(createdAtTimestamp.getTime()));
                }

                Timestamp updatedAtTimestamp = rs.getTimestamp("updated_at");
                if (updatedAtTimestamp != null) {
                    subject.setUpdated_at(new java.util.Date(updatedAtTimestamp.getTime()));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return subject;
    }

    @Override
    public List<Subject> getAllSubject() {
        List<Subject> subjects = new ArrayList<Subject>();
        try {
            ps = con.prepareStatement("SELECT * FROM subject");
            rs = ps.executeQuery();
            while (rs.next()) {
                Subject subject = new Subject();
                subject.setSubject_id(rs.getInt("subject_id"));
                subject.setSubject_name(rs.getString("subject_name"));
                subject.setDescription(rs.getString("description"));
                subject.setThumbail(rs.getString("thumbail"));
//                subject.setCreated_at(rs.getTimestamp("created_at"));
                subject.setCreate_by(rs.getInt("created_by"));
//                subject.setUpdated_at(rs.getTimestamp("updated_at"));
                subject.setUpdate_by(rs.getInt("updated_by"));
                subject.setRating(rs.getFloat("rating"));
                subject.setSetting_id(rs.getInt("setting_id"));

                Timestamp createdAtTimestamp = rs.getTimestamp("created_at");
                if (createdAtTimestamp != null) {
                    subject.setCreated_at(new java.util.Date(createdAtTimestamp.getTime()));
                }

                Timestamp updatedAtTimestamp = rs.getTimestamp("updated_at");
                if (updatedAtTimestamp != null) {
                    subject.setUpdated_at(new java.util.Date(updatedAtTimestamp.getTime()));
                }

                subjects.add(subject);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return subjects;
    }

    @Override
    public List<Subject> searchSubject(String subjectName) {
        List<Subject> subjects = new ArrayList<Subject>();
        try {
            String sql = "SELECT * FROM subject WHERE subject_name LIKE ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + subjectName + "%");
            rs = ps.executeQuery();

            while (rs.next()) {
                Subject subject = new Subject();
                subject.setSubject_id(rs.getInt("subject_id"));
                subject.setSubject_name(rs.getString("subject_name"));
                subject.setDescription(rs.getString("description"));
                subject.setThumbail(rs.getString("thumbail"));
                subject.setCreated_at(rs.getTimestamp("created_at"));
                subject.setCreate_by(rs.getInt("created_by"));
                subject.setUpdated_at(rs.getTimestamp("updated_at"));
                subject.setUpdate_by(rs.getInt("updated_by"));
                subject.setRating(rs.getFloat("rating"));
                subject.setSetting_id(rs.getInt("setting_id"));

                Timestamp createdAtTimestamp = rs.getTimestamp("created_at");
                if (createdAtTimestamp != null) {
                    subject.setCreated_at(new java.util.Date(createdAtTimestamp.getTime()));
                }

                Timestamp updatedAtTimestamp = rs.getTimestamp("updated_at");
                if (updatedAtTimestamp != null) {
                    subject.setUpdated_at(new java.util.Date(updatedAtTimestamp.getTime()));
                }

                subjects.add(subject);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return subjects;
    }

    @Override
    public List<Subject> getAllSubjectBySettingId(int setting_id) {
        List<Subject> subjects = new ArrayList<Subject>();
        try {
            ps = con.prepareStatement("SELECT * FROM subject WHERE setting_id = ?");
            ps.setInt(1, setting_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Subject subject = new Subject();
                subject.setSubject_id(rs.getInt("subject_id"));
                subject.setSubject_name(rs.getString("subject_name"));
                subject.setDescription(rs.getString("description"));
                subject.setThumbail(rs.getString("thumbail"));
//            subject.setCreated_at(rs.getTimestamp("created_at"));
                subject.setCreate_by(rs.getInt("created_by"));
//            subject.setUpdated_at(rs.getTimestamp("updated_at"));
                subject.setUpdate_by(rs.getInt("updated_by"));
                subject.setRating(rs.getFloat("rating"));
                subject.setSetting_id(rs.getInt("setting_id"));

                Timestamp createdAtTimestamp = rs.getTimestamp("created_at");
                if (createdAtTimestamp != null) {
                    subject.setCreated_at(new java.util.Date(createdAtTimestamp.getTime()));
                }

                Timestamp updatedAtTimestamp = rs.getTimestamp("updated_at");
                if (updatedAtTimestamp != null) {
                    subject.setUpdated_at(new java.util.Date(updatedAtTimestamp.getTime()));
                }

                subjects.add(subject);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return subjects;
    }
}
