<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
                        <h3 class="page-title">Question</h3>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin">Dashboard</a></li>
                            <li class="breadcrumb-item active">Question</li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- /Page Header -->

            <div class="student-group-form">
                <form method="post" action="${pageContext.request.contextPath}/questions">
                    <div class="row">
                        <div class="col-lg-10 col-md-10">
                            <div class="input-block">
                                <input type="text" class="form-control" name="keyword" placeholder="Search Question ..." />
                            </div>
                        </div>
                        <div class="col-lg-2 text-center">
                            <div class="search-student-btn text-center">
                                <button type="submit" class="btn btn-primary text-center">Search</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>

            <div class="row">
                <div class="col-sm-12">
                    <div class="card card-table">
                        <div class="card-body">
                            <!-- Page Header -->
                            <div class="page-header">
                                <div class="row align-items-center">
                                    <div class="col">
                                        <h3 class="page-title">Question List</h3>
                                    </div>
                                    <div class="col-auto text-end float-end ms-auto download-grp">
                                        <a href="${pageContext.request.contextPath}/manager-question/new"
                                           class="btn btn-primary">
                                            <i class="fas fa-plus"></i></a>
                                    </div>
                                </div>
                            </div>
                            <!-- /Page Header -->

                            <div class="col-12">
                                <div class="card top-selling overflow-auto">
                                    <div class="card-body pb-0">
                                        <table class="table table-borderless">
                                            <thead>
                                            <tr>
                                                <th scope="col">ID</th>
                                                <th scope="col">Question</th>
                                                <th scope="col">Correct Option</th>
                                                <th scope="col">Lesson ID</th>
                                                <th scope="col" class="text-center">Action</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach varStatus="status" items="${requestScope.questions}"
                                                       var="question">
                                                <tr>
                                                    <td>${question.getQuestion_id()}</td>
                                                    <td><a href="#"
                                                           class="text-primary fw-bold">${question.getQuestion()}</a>
                                                    </td>
                                                    <td><a href="#"
                                                           class="text-primary fw-bold">${question.getCorrect_option()}</a>
                                                    </td>
                                                    <td><a href="#"
                                                           class="text-primary fw-bold">${question.getLesson_id()}</a>
                                                    </td>
                                                    <td>
                                                        <div class="actions">
                                                            <a
                                                                    href="${pageContext.request.contextPath}/manager-question/view?question_id=${question.getQuestion_id()}"
                                                                    class="btn btn-sm bg-success-light me-2"
                                                            >
                                                                <i class="feather-eye"></i>
                                                            </a>
                                                            <a href="${pageContext.request.contextPath}/manager-question/edit?question_id=${question.getQuestion_id()}"
                                                               class="btn btn-sm bg-danger-light">
                                                                <i class="feather-edit"></i>
                                                            </a>

                                                            <a href="${pageContext.request.contextPath}/manager-question/delete?question_id=${question.getQuestion_id()}"
                                                               class="btn btn-sm bg-success-light me-2 alert-confirm-delete">
                                                                <i class="feather-delete"></i>
                                                            </a>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
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

<%@ include file="/view/dashboard/parts/footer.jsp" %>
