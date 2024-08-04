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
                        <h3 class="page-title">Exam</h3>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index">Dashboard</a></li>
                            <li class="breadcrumb-item active">Exam</li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- /Page Header -->

            <div class="row">
                <div class="col-sm-12">
                    <div class="card card-table">
                        <div class="card-body">
                            <!-- Page Header -->
                            <div class="page-header">
                                <div class="row align-items-center">
                                    <div class="col">
                                        <h3 class="page-title">Exam</h3>
                                    </div>
                                    <div class="col-auto text-end float-end ms-auto download-grp">
                                        <a href="#" class="btn btn-outline-primary me-2"
                                        ><i class="fas fa-download"></i> Download</a
                                        >
                                        <a href="${pageContext.request.contextPath}/add-exam" class="btn btn-primary"
                                        ><i class="fas fa-plus"></i
                                        ></a>
                                    </div>
                                </div>
                            </div>
                            <!-- /Page Header -->
                            <div class="table-responsive">
                                <table
                                        class="table border-0 star-student table-hover table-center mb-0 datatable table-striped"
                                >
                                    <thead class="student-thread">
                                    <tr>
                                        <th>Exam Name</th>
                                        <th>Class</th>
                                        <th>Subject</th>
                                        <th>Start Time</th>
                                        <th>End Time</th>
                                        <th>Date</th>
                                        <th class="text-end">Action</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>
                                            <h2>
                                                <a>Class Test</a>
                                            </h2>
                                        </td>
                                        <td>10</td>
                                        <td>English</td>
                                        <td>10:00 AM</td>
                                        <td>01:00 PM</td>
                                        <td>23 Apr 2020</td>
                                        <td class="text-end">
                                            <div class="actions">
                                                <a
                                                        href="${pageContext.request.contextPath}/exam-details"
                                                        class="btn btn-sm bg-success-light me-2"
                                                >
                                                    <i class="feather-eye"></i>
                                                </a>
                                                <a href="${pageContext.request.contextPath}/edit-exam" class="btn btn-sm bg-danger-light">
                                                    <i class="feather-edit"></i>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>

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

<%@include file="/view/dashboard/parts/footer.jsp" %>