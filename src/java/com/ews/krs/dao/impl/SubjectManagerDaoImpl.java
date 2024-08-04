package com.ews.krs.dao.impl;

import com.ews.krs.dao.MyDAO;
import com.ews.krs.dao.SubjectManagerDao;
import com.ews.krs.model.SubjectManager;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SubjectManagerDaoImpl extends MyDAO implements SubjectManagerDao {

    @Override
    public void insertSubjectManager(SubjectManager subjectManager) {
        String sql = "INSERT INTO subject_manager (user_id, subject_id, status) VALUES (?, ?, ?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, subjectManager.getUser_id());
            ps.setInt(2, subjectManager.getSubject_id());
            ps.setString(3, subjectManager.getStatus());

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
    public void editSubjectManager(SubjectManager newSubjectManager) {
        String sql = "UPDATE subject_manager SET status = ? WHERE user_id = ? AND subject_id = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, newSubjectManager.getStatus());
            ps.setInt(2, newSubjectManager.getUser_id());
            ps.setInt(3, newSubjectManager.getSubject_id());

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
    public void deleteSubjectManager(int userId, int subjectId) {
        String sql = "DELETE FROM subject_manager WHERE user_id = ? AND subject_id = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.setInt(2, subjectId);

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
    public SubjectManager getSubjectManager(int userId, int subjectId) {
        SubjectManager subjectManager = null;
        String sql = "SELECT user_id, subject_id, status FROM subject_manager WHERE user_id = ? AND subject_id = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.setInt(2, subjectId);
            rs = ps.executeQuery();

            if (rs.next()) {
                int user_id = rs.getInt("user_id");
                int subject_id = rs.getInt("subject_id");
                String status = rs.getString("status");

                subjectManager = new SubjectManager(user_id, subject_id, status);
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
        return subjectManager;
    }

    @Override
    public List<SubjectManager> getAllSubjectManager() {
        List<SubjectManager> subjectManagers = new ArrayList<>();

        try {
            ps = con.prepareStatement("SELECT user_id, subject_id, status FROM subject_manager");
            rs = ps.executeQuery();

            while (rs.next()) {
                int userId = rs.getInt("user_id");
                int subjectId = rs.getInt("subject_id");
                String status = rs.getString("status");

                SubjectManager subjectManager = new SubjectManager(userId, subjectId, status);
                subjectManagers.add(subjectManager);
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
        return subjectManagers;
    }

    @Override
    public int countTeacherSubject(int userId) {
        int count = 0;

        try {
            ps = con.prepareStatement("SELECT COUNT(*) AS subject_count FROM subject_manager WHERE user_id = ?");
            ps.setInt(1, userId);
            rs = ps.executeQuery();

            if (rs.next()) {
                count = rs.getInt("subject_count");
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

        return count;
    }
}
