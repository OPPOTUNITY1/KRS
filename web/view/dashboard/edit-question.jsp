<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@include file="/view/dashboard/parts/header.jsp" %>
<%@include file="/view/dashboard/parts/sidebar.jsp" %>

<div class="main-wrapper">

    <!-- Page Wrapper -->
    <div class="page-wrapper">
        <div class="content container-fluid">
            <!-- Page Header -->
            <div class="page-header">
                <div class="row align-items-center">
                    <div class="col">
                        <h3 class="page-title">Edit Question</h3>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/questions">Questions</a></li>
                            <li class="breadcrumb-item active">Edit Question</li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- /Page Header -->

            <!-- Display success message if present -->
            <c:if test="${not empty sessionScope.successMessage}">
                <div class="alert alert-success" role="alert">
                        ${sessionScope.successMessage}
                </div>
                <!-- Remove success message after displaying -->
                <c:remove var="successMessage" scope="session"/>
            </c:if>

            <div class="row">
                <div class="col-sm-12">
                    <div class="card">
                        <div class="card-body">
                            <form action="${pageContext.request.contextPath}/manager-question/update" method="post">
                                <input type="hidden" name="question_id" value="${requestScope.question.question_id}" />

                                <div class="row">
                                    <div class="col-12">
                                        <h5 class="form-title"><span>Edit Question</span></h5>
                                    </div>

                                    <div class="col-12 col-sm-4">
                                        <div class="input-block local-forms">
                                            <label>Question <span class="login-danger">*</span></label>
                                            <input type="text" value="${requestScope.question != null ? requestScope.question.getQuestion() : ""}" name="question" class="form-control" placeholder="Question" required />
                                        </div>
                                    </div>

                                    <div class="col-12 col-sm-4">
                                        <div class="input-block local-forms">
                                            <label>Correct Option <span class="login-danger">*</span></label>
                                            <c:set value="${requestScope.question.getCorrect_option()}" var="correct"/>
                                            <select name="correct_option" class="form-control" required>
                                                <option value="">Select Correct Option</option>
                                                <option ${correct.equals('A') ? 'selected' :''} value="A">A</option>
                                                <option ${correct.equals('B') ? 'selected' :''}  value="B">B</option>
                                                <option ${correct.equals('C') ? 'selected' :''}  value="C">C</option>
                                                <option ${correct.equals('D') ? 'selected' :''}  value="D">D</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-12 col-sm-4">
                                        <div class="input-block local-forms">
                                            <label>Option A <span class="login-danger">*</span></label>
                                            <input type="text" value="${requestScope.question != null ? requestScope.question.getOption_a() : ""}" name="option_a" class="form-control" placeholder="Enter option A" required />
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="input-block local-forms">
                                            <label>Option B <span class="login-danger">*</span></label>
                                            <input type="text" value="${requestScope.question != null ? requestScope.question.getOption_b() : ""}" name="option_b" class="form-control" placeholder="Enter option B" required />
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="input-block local-forms">
                                            <label>Option C <span class="login-danger">*</span></label>
                                            <input type="text" name="option_c" value="${requestScope.question != null ? requestScope.question.getOption_c() : ""}" class="form-control" placeholder="Enter option C" required />
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="input-block local-forms">
                                            <label>Option D <span class="login-danger">*</span></label>
                                            <input type="text" name="option_d" class="form-control" value="${requestScope.question != null ? requestScope.question.getOption_d() : ""}" placeholder="Enter option D" required />
                                        </div>
                                    </div>

                                    <div class="col-12 col-sm-12">
                                        <div class="input-block local-forms">
                                            <c:set value="${requestScope.question.getLesson_id()}" var="lesson_idd"/>
                                            <label for="part_title">Lesson<span class="login-danger">*</span></label>
                                            <select id="part_title" name="lesson_choose" class="form-control">
                                                <c:forEach items="${requestScope.lessons}" var="lesson">
                                                    <c:if test="${lesson.parent_id != 0}">
                                                        <option ${lesson_idd == lesson.lesson_id ? 'selected' : ''} value="${lesson.lesson_id}">${lesson.title}</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <div class="student-submit">
                                            <button type="submit" class="btn btn-primary">Submit</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="/view/dashboard/parts/footer.jsp" %>
