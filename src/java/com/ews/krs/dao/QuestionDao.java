package com.ews.krs.dao;

import com.ews.krs.model.Question;

import java.util.List;


public interface QuestionDao {

    List<Question> getAllQuestion();

    void insertQuestion(Question question);

    void editQuestion(Question newQuestion);

    Question getQuestionById(int questionId);

    List<Question> searchQuestion(String keyword);
    
    void deleteQuestion(int questionId);

}
