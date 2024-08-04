package com.ews.krs.controller.admin;

import com.ews.krs.model.Lesson;
import com.ews.krs.model.Question;
import com.ews.krs.model.User;
import com.ews.krs.service.LessonService;
import com.ews.krs.service.QuestionService;
import com.ews.krs.service.impl.LessonServiceImpl;
import com.ews.krs.service.impl.QuestionServiceImpl;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.apache.log4j.Logger;

import java.io.IOException;
import java.io.Serial;
import java.sql.SQLException;
import java.util.List;

@WebServlet(urlPatterns = {"/manager-question", "/manager-question/new", "/manager-question/insert", "/manager-question/delete", "/manager-question/edit", "/manager-question/update", "/manager-question/view"})
public class ManagerQuestionController extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;
    private final Logger logger = Logger.getLogger(SubjectManagerController.class);
    QuestionService questionService;
    LessonService lessonService;
    public void init() {
        questionService = new QuestionServiceImpl();
        lessonService = new LessonServiceImpl();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");

        HttpSession session = request.getSession();
        if((User) session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String action = request.getServletPath();
        System.out.println("action = " + action);

        try {
            switch (action) {
                case "/manager-question/new":
                    showNewForm(request, response);
                    break;
                case "/manager-question/insert":
                    insertLesson(request, response);
                    break;
                case "/manager-question/delete":
                    deleteLesson(request, response);
                    break;
                case "/manager-question/edit":
                    showEditForm(request, response);
                    break;
                case "/manager-question/update":
                    updateQuestion(request, response);
                    break;
                case "/manager-question/view":
                    detailQuestion(request, response);
                    break;
                default:
                    listQuestion(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new IOException(ex.getMessage());
        }
    }

    private void detailQuestion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String xQuestion_id = request.getParameter("question_id");
        int question_id = Integer.parseInt(xQuestion_id);
        Question question = questionService.getQuestionById(question_id);

        request.setAttribute("question", question);

        List<Lesson> lessons = lessonService.getAllLesson();
        request.setAttribute("lessons", lessons);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/dashboard/question-details.jsp");
        dispatcher.forward(request, response);
    }

    private void listQuestion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        List<Question> questions = questionService.getAllQuestion();

        int size = questions.size();
        int numPerPage = 6;
        int numPage = (size % numPerPage == 0) ? (size / numPerPage) : (size / numPerPage) + 1;

        String xPage = request.getParameter("page");
        int page = (xPage == null) ? 1 : Integer.parseInt(xPage);

        if (page < 1) {
            page = 1;
        } else if (page > numPage) {
            page = numPage;
        }

        int start = (page - 1) * numPerPage;
        int end = Math.min(page * numPerPage, size);

        if(!questions.isEmpty()) {
            questions = questions.subList(start, end);
        }

        request.setAttribute("numPage", numPage);
        request.setAttribute("page", page);
        request.setAttribute("questions", questions);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/dashboard/question.jsp");
        dispatcher.forward(request, response);
    }

    private void updateQuestion(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String xQuestion_id = request.getParameter("question_id");
        int question_id = Integer.parseInt(xQuestion_id);
        Question question = questionService.getQuestionById(question_id);
        question.setQuestion(request.getParameter("question"));
        question.setOption_a(request.getParameter("option_a"));
        question.setOption_b(request.getParameter("option_b"));
        question.setOption_c(request.getParameter("option_c"));
        question.setOption_d(request.getParameter("option_d"));
        question.setCorrect_option(request.getParameter("correct_option"));

        String lesson_choose = request.getParameter("lesson_choose");
        int lesson_id = Integer.parseInt(lesson_choose);
        question.setLesson_id(lesson_id);
        questionService.editQuestion(question);
        response.sendRedirect("../manager-question");
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String xQuestion_id = request.getParameter("question_id");
        int question_id = Integer.parseInt(xQuestion_id);
        Question question = questionService.getQuestionById(question_id);

        request.setAttribute("question", question);

        List<Lesson> lessons = lessonService.getAllLesson();
        request.setAttribute("lessons", lessons);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/dashboard/edit-question.jsp");
        dispatcher.forward(request, response);
    }

    private void deleteLesson(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String xQuestion_id = request.getParameter("question_id");
        int question_id = Integer.parseInt(xQuestion_id);
        questionService.deleteQuestion(question_id);
        response.sendRedirect("../manager-lesson");
    }

    private void insertLesson(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        Question question = getInputQuestion(request, response);
        questionService.insertQuestion(question);
        response.sendRedirect("../manager-question");
    }

    private Question getInputQuestion(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Question question = new Question();

        question.setQuestion(request.getParameter("question"));
        question.setOption_a(request.getParameter("option_a"));
        question.setOption_b(request.getParameter("option_b"));
        question.setOption_c(request.getParameter("option_c"));
        question.setOption_d(request.getParameter("option_d"));
        question.setCorrect_option(request.getParameter("correct_option"));

        String lesson_choose = request.getParameter("lesson_choose");
        int lesson_id = Integer.parseInt(lesson_choose);
        question.setLesson_id(lesson_id);

        return question;
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/dashboard/add-question.jsp");

        List<Lesson> lessons = lessonService.getAllLesson();
        request.setAttribute("lessons", lessons);

        dispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
