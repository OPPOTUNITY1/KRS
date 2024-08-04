package com.ews.krs.dao.impl;

import com.ews.krs.dao.LessonDao;
import com.ews.krs.dao.MyDAO;
import com.ews.krs.model.Lesson;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class LessonDaoImpl extends MyDAO implements LessonDao {

    @Override
    public void insertLesson(Lesson lesson) {
        try {
            String sql = "INSERT INTO lesson (lesson_id, content, title, video_url, created_at, updated_at, " +
                    "created_by, updated_by, description, parent_id, subject_id) " +
                    "VALUES (?, ?, ?, ?, NOW(), NOW(), ?, ?, ?, ?, ?)";
            ps = con.prepareStatement(sql);
            ps.setInt(1, lesson.getLesson_id());
            ps.setString(2, lesson.getContent());
            ps.setString(3, lesson.getTitle());
            ps.setString(4, lesson.getVideo_url());
            ps.setInt(5, lesson.getCreated_by());
            ps.setInt(6, lesson.getUpdated_by());
            ps.setString(7, lesson.getDescription());

            if (lesson.getParent_id() != 0) {
                ps.setInt(8, lesson.getParent_id());
            } else {
                ps.setNull(8, java.sql.Types.INTEGER); // Set parent_id as NULL in the database
            }

            ps.setInt(9, lesson.getSubject_id());

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    @Override
    public void editLesson(Lesson newLesson) {
        try {
            String sql = "UPDATE lesson SET content=?, title=?, video_url=?, updated_at=?, updated_by=?, " +
                    "description=?, subject_id=?, parent_id=? WHERE lesson_id=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, newLesson.getContent());
            ps.setString(2, newLesson.getTitle());
            ps.setString(3, newLesson.getVideo_url());
            ps.setDate(4, new java.sql.Date(newLesson.getUpdated_at().getTime()));
            ps.setInt(5, newLesson.getUpdated_by());
            ps.setString(6, newLesson.getDescription());
            ps.setInt(7, newLesson.getSubject_id());

            if (newLesson.getParent_id() != 0) {
                ps.setInt(8, newLesson.getParent_id());
            } else {
                ps.setNull(8, java.sql.Types.INTEGER); // Set parent_id as NULL in the database
            }

            ps.setInt(9, newLesson.getLesson_id());

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    @Override
    public void deleteLesson(int id) {
        try {
            String sql = "DELETE FROM lesson WHERE lesson_id=?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Lesson getLesson(int id) {
        Lesson lesson = null;
        try {
            String sql = "SELECT * FROM lesson WHERE lesson_id=?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                lesson = new Lesson();
                lesson.setLesson_id(rs.getInt("lesson_id"));
                lesson.setContent(rs.getString("content"));
                lesson.setTitle(rs.getString("title"));
                lesson.setVideo_url(rs.getString("video_url"));
                lesson.setCreated_at(rs.getDate("created_at"));
                lesson.setUpdated_at(rs.getDate("updated_at"));
                lesson.setCreated_by(rs.getInt("created_by"));
                lesson.setUpdated_by(rs.getInt("updated_by"));
                lesson.setDescription(rs.getString("description"));
                lesson.setParent_id(rs.getInt("parent_id"));
                lesson.setSubject_id(rs.getInt("subject_id"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lesson;
    }

    @Override
    public List<Lesson> getAllLesson() {
        List<Lesson> lessonList = new ArrayList<>();
        try {
            String sql = "SELECT * FROM lesson";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Lesson lesson = new Lesson();
                lesson.setLesson_id(rs.getInt("lesson_id"));
                lesson.setContent(rs.getString("content"));
                lesson.setTitle(rs.getString("title"));
                lesson.setVideo_url(rs.getString("video_url"));
                lesson.setCreated_at(rs.getDate("created_at"));
                lesson.setUpdated_at(rs.getDate("updated_at"));
                lesson.setCreated_by(rs.getInt("created_by"));
                lesson.setUpdated_by(rs.getInt("updated_by"));
                lesson.setDescription(rs.getString("description"));
                lesson.setParent_id(rs.getInt("parent_id"));
                lesson.setSubject_id(rs.getInt("subject_id"));

                lessonList.add(lesson);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lessonList;
    }

    @Override
    public List<Lesson> searchLesson(String title) {
        List<Lesson> lessonList = new ArrayList<>();
        try {
            String sql = "SELECT * FROM lesson WHERE title LIKE ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + title + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                Lesson lesson = new Lesson();
                lesson.setLesson_id(rs.getInt("lesson_id"));
                lesson.setContent(rs.getString("content"));
                lesson.setTitle(rs.getString("title"));
                lesson.setVideo_url(rs.getString("video_url"));
                lesson.setCreated_at(rs.getDate("created_at"));
                lesson.setUpdated_at(rs.getDate("updated_at"));
                lesson.setCreated_by(rs.getInt("created_by"));
                lesson.setUpdated_by(rs.getInt("updated_by"));
                lesson.setDescription(rs.getString("description"));
                lesson.setParent_id(rs.getInt("parent_id"));
                lesson.setSubject_id(rs.getInt("subject_id"));

                lessonList.add(lesson);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lessonList;
    }

    @Override
    public List<Lesson> getAllLessonBySubjectId(int subject_id) {
        List<Lesson> lessonList = new ArrayList<>();
        try {
            String sql = "SELECT * FROM lesson WHERE subject_id=?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, subject_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Lesson lesson = new Lesson();
                lesson.setLesson_id(rs.getInt("lesson_id"));
                lesson.setContent(rs.getString("content"));
                lesson.setTitle(rs.getString("title"));
                lesson.setVideo_url(rs.getString("video_url"));
                lesson.setCreated_at(rs.getDate("created_at"));
                lesson.setUpdated_at(rs.getDate("updated_at"));
                lesson.setCreated_by(rs.getInt("created_by"));
                lesson.setUpdated_by(rs.getInt("updated_by"));
                lesson.setDescription(rs.getString("description"));
                lesson.setParent_id(rs.getInt("parent_id"));
                lesson.setSubject_id(rs.getInt("subject_id"));

                lessonList.add(lesson);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close resources in finally block to ensure they're always closed
            closeResources();
        }
        return lessonList;
    }

    // Helper method to close resources
    private void closeResources() {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
