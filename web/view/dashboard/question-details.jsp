<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/view/dashboard/parts/header.jsp" %>
<%@ include file="/view/dashboard/parts/sidebar.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Question Details</title>
    <link href="${pageContext.request.contextPath}/view/dashboard/assets/css/style.css" rel="stylesheet">
</head>
<body>
<div class="main-wrapper">
    <!-- Page Wrapper -->
    <div class="page-wrapper">
        <div class="content container-fluid">
            <div class="page-header">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="page-sub-header">
                            <h3 class="page-title">Question Details</h3>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/questions">Questions</a></li>
                                <li class="breadcrumb-item active">Question Details</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="about-info">
                                <h4>Question Information</h4>
                            </div>
                            <div class="student-profile-head">
                                <div class="col-12 col-sm-12">
                                    <div class="input-block local-forms">
                                        <label>Question <span class="login-danger">*</span></label>
                                        <input readonly type="text" value="${requestScope.question != null ? requestScope.question.getQuestion() : ""}" name="question" class="form-control" placeholder="Question" required />
                                    </div>
                                </div>

                                <div class="col-12 col-sm-12">
                                    <div class="input-block local-forms">
                                        <label>Correct Option <span class="login-danger">*</span></label>
                                        <c:set value="${requestScope.question.getCorrect_option()}" var="correct"/>
                                        <select readonly="" name="correct_option" class="form-control" required>
                                            <option value="">Select Correct Option</option>
                                            <option ${correct.equals('A') ? 'selected' :''} value="A">A</option>
                                            <option ${correct.equals('B') ? 'selected' :''}  value="B">B</option>
                                            <option ${correct.equals('C') ? 'selected' :''}  value="C">C</option>
                                            <option ${correct.equals('D') ? 'selected' :''}  value="D">D</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-12 col-sm-12">
                                    <div class="input-block local-forms">
                                        <label>Option A <span class="login-danger">*</span></label>
                                        <input readonly type="text" value="${requestScope.question != null ? requestScope.question.getOption_a() : ""}" name="option_a" class="form-control" placeholder="Enter option A" required />
                                    </div>
                                </div>
                                <div class="col-12 col-sm-12">
                                    <div class="input-block local-forms">
                                        <label>Option B <span class="login-danger">*</span></label>
                                        <input readonly type="text" value="${requestScope.question != null ? requestScope.question.getOption_b() : ""}" name="option_b" class="form-control" placeholder="Enter option B" required />
                                    </div>
                                </div>
                                <div class="col-12 col-sm-12">
                                    <div class="input-block local-forms">
                                        <label>Option C <span class="login-danger">*</span></label>
                                        <input readonly type="text" name="option_c" value="${requestScope.question != null ? requestScope.question.getOption_c() : ""}" class="form-control" placeholder="Enter option C" required />
                                    </div>
                                </div>
                                <div class="col-12 col-sm-12">
                                    <div class="input-block local-forms">
                                        <label>Option D <span class="login-danger">*</span></label>
                                        <input readonly type="text" name="option_d" class="form-control" value="${requestScope.question != null ? requestScope.question.getOption_d() : ""}" placeholder="Enter option D" required />
                                    </div>
                                </div>

                                <div class="col-12 col-sm-12">
                                    <div class="input-block local-forms">
                                        <c:set value="${requestScope.question.getLesson_id()}" var="lesson_idd"/>
                                        <label for="part_title">Lesson<span class="login-danger">*</span></label>
                                        <select readonly id="part_title" name="lesson_choose" class="form-control">
                                            <c:forEach items="${requestScope.lessons}" var="lesson">
                                                <c:if test="${lesson.parent_id != 0}">
                                                    <option ${lesson_idd == lesson.lesson_id ? 'selected' : ''} value="${lesson.lesson_id}">${lesson.title}</option>
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

<%@ include file="/view/dashboard/parts/footer.jsp" %>
