package com.ews.krs.dao.impl;

import com.ews.krs.dao.MyDAO;
import com.ews.krs.dao.QuestionDao;
import com.ews.krs.model.Question;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class QuestionDaoImpl extends MyDAO implements QuestionDao {
    @Override
    public List<Question> getAllQuestion() {
        List<Question> questions = new ArrayList<>();
        xSql = "SELECT * FROM question";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Question q = new Question();
                q.setQuestion_id(rs.getInt("question_id"));
                q.setQuestion(rs.getString("question"));
                q.setOption_a(rs.getString("option_a"));
                q.setOption_b(rs.getString("option_b"));
                q.setOption_c(rs.getString("option_c"));
                q.setOption_d(rs.getString("option_d"));
                q.setCorrect_option(rs.getString("correct_option"));
                q.setLesson_id(rs.getInt("lesson_id"));
                questions.add(q);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return questions;
    }

    @Override
    public void insertQuestion(Question question) {
        xSql = "INSERT INTO question(question, option_a, option_b, option_c, option_d, correct_option, lesson_id) VALUES(?, ?, ?, ?, ?, ?, ?)";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, question.getQuestion());
            ps.setString(2, question.getOption_a());
            ps.setString(3, question.getOption_b());
            ps.setString(4, question.getOption_c());
            ps.setString(5, question.getOption_d());
            ps.setString(6, question.getCorrect_option());
            ps.setInt(7, question.getLesson_id());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
    }

    @Override
    public void editQuestion(Question newQuestion) {
        xSql = "UPDATE question SET question = ?, option_a = ?, option_b = ?, option_c = ?, option_d = ?, correct_option = ?, lesson_id = ? WHERE question_id = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, newQuestion.getQuestion());
            ps.setString(2, newQuestion.getOption_a());
            ps.setString(3, newQuestion.getOption_b());
            ps.setString(4, newQuestion.getOption_c());
            ps.setString(5, newQuestion.getOption_d());
            ps.setString(6, newQuestion.getCorrect_option());
            ps.setInt(7, newQuestion.getLesson_id());
            ps.setInt(8, newQuestion.getQuestion_id());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
    }

    @Override
    public Question getQuestionById(int questionId) {
        Question q = null;
        xSql = "SELECT * FROM question WHERE question_id = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, questionId);
            rs = ps.executeQuery();
            if (rs.next()) {
                q = new Question();
                q.setQuestion_id(rs.getInt("question_id"));
                q.setQuestion(rs.getString("question"));
                q.setOption_a(rs.getString("option_a"));
                q.setOption_b(rs.getString("option_b"));
                q.setOption_c(rs.getString("option_c"));
                q.setOption_d(rs.getString("option_d"));
                q.setCorrect_option(rs.getString("correct_option"));
                q.setLesson_id(rs.getInt("lesson_id"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return q;
    }

    @Override
    public List<Question> searchQuestion(String keyword) {
        List<Question> questions = new ArrayList<>();
        xSql = "SELECT * FROM question WHERE question LIKE ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, "%" + keyword + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                Question q = new Question();
                q.setQuestion_id(rs.getInt("question_id"));
                q.setQuestion(rs.getString("question"));
                q.setOption_a(rs.getString("option_a"));
                q.setOption_b(rs.getString("option_b"));
                q.setOption_c(rs.getString("option_c"));
                q.setOption_d(rs.getString("option_d"));
                q.setCorrect_option(rs.getString("correct_option"));
                q.setLesson_id(rs.getInt("lesson_id"));
                questions.add(q);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return questions;
    }

    @Override
    public void deleteQuestion(int questionId) {
        xSql = "DELETE FROM question WHERE question_id = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, questionId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
    }
}
