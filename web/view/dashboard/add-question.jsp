<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ include file="/view/dashboard/parts/header.jsp" %>
<%@ include file="/view/dashboard/parts/sidebar.jsp" %>

<div class="main-wrapper">
    <!-- Page Wrapper -->
    <div class="page-wrapper">
        <div class="content container-fluid">
            <!-- Page Header -->
            <div class="page-header">
                <div class="row align-items-center">
                    <div class="col">
                        <h3 class="page-title">Add Question</h3>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="questions">Question</a></li>
                            <li class="breadcrumb-item active">Add Questions</li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- /Page Header -->

            <!-- Success Message -->
            <c:if test="${not empty sessionScope.successMessage}">
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                        ${sessionScope.successMessage}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <!-- Clear the success message from session after displaying -->
                <%
                    session.removeAttribute("successMessage");
                %>
            </c:if>
            <!-- /Success Message -->

            <div class="row">
                <div class="col-sm-12">
                    <div class="card">
                        <div class="card-body">
                            <form action="${pageContext.request.contextPath}/manager-question/insert" method="post">
                                <div class="row">
                                    <div class="col-12">
                                        <h5 class="form-title"><span>Add new Question</span></h5>
                                    </div>

                                    <div class="col-12 col-sm-4">
                                        <div class="input-block local-forms">
                                            <label>Question <span class="login-danger">*</span></label>
                                            <input type="text" name="question" class="form-control" placeholder="Question" required />
                                        </div>
                                    </div>

                                    <div class="col-12 col-sm-4">
                                        <div class="input-block local-forms">
                                            <label>Correct Option <span class="login-danger">*</span></label>
                                            <select name="correct_option" class="form-control" required>
                                                <option value="">Select Correct Option</option>
                                                <option value="A">A</option>
                                                <option value="B">B</option>
                                                <option value="C">C</option>
                                                <option value="D">D</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-12 col-sm-4">
                                        <div class="input-block local-forms">
                                            <label>Option A <span class="login-danger">*</span></label>
                                            <input type="text" name="option_a" class="form-control" placeholder="Enter option A" required />
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="input-block local-forms">
                                            <label>Option B <span class="login-danger">*</span></label>
                                            <input type="text" name="option_b" class="form-control" placeholder="Enter option B" required />
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="input-block local-forms">
                                            <label>Option C <span class="login-danger">*</span></label>
                                            <input type="text" name="option_c" class="form-control" placeholder="Enter option C" required />
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="input-block local-forms">
                                            <label>Option D <span class="login-danger">*</span></label>
                                            <input type="text" name="option_d" class="form-control" placeholder="Enter option D" required />
                                        </div>
                                    </div>

                                    <div class="col-12 col-sm-12">
                                        <div class="input-block local-forms">
                                            <label for="part_title">Lesson<span class="login-danger">*</span></label>
                                            <select id="part_title" name="lesson_choose" class="form-control">
                                                <c:forEach items="${requestScope.lessons}" var="lesson">
                                                    <c:if test="${lesson.parent_id != 0}">
                                                        <option value="${lesson.lesson_id}">${lesson.title}</option>
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

<%@ include file="/view/dashboard/parts/footer.jsp" %>
