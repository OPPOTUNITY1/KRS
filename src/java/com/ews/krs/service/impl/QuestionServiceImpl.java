package com.ews.krs.service.impl;

import com.ews.krs.dao.QuestionDao;
import com.ews.krs.dao.impl.QuestionDaoImpl;
import com.ews.krs.model.Question;
import com.ews.krs.service.QuestionService;

import java.util.List;

public class QuestionServiceImpl implements QuestionService {
    QuestionDao questionDao = new QuestionDaoImpl();
    @Override
    public List<Question> getAllQuestion() {
        return questionDao.getAllQuestion();
    }

    @Override
    public void insertQuestion(Question question) {
        questionDao.insertQuestion(question);
    }

    @Override
    public void editQuestion(Question newQuestion) {
        questionDao.editQuestion(newQuestion);
    }

    @Override
    public Question getQuestionById(int questionId) {
        return questionDao.getQuestionById(questionId);
    }

    @Override
    public List<Question> searchQuestion(String keyword) {
        return questionDao.searchQuestion(keyword);
    }

    @Override
    public void deleteQuestion(int questionId) {
        questionDao.deleteQuestion(questionId);
    }
}
