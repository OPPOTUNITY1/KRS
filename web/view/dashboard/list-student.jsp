<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@include file="/view/dashboard/parts/header.jsp" %>
<%@include file="/view/dashboard/parts/sidebar.jsp" %>

<%--<%@include file="/view/dashboard/parts/footer.jsp" %>--%>
<div class="main-wrapper">
    <!-- Page Wrapper -->
    <div class="page-wrapper">
        <div class="content container-fluid">
            <!-- Page Header -->
            <div class="page-header">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="page-sub-header">
                            <h3 class="page-title">${className}</h3>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="students">Student</a></li>
                                <li class="breadcrumb-item active">All Students</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /Page Header -->

            <div class="student-group-form">
                <div class="row">
                    <div class="col-lg-3 col-md-6">
                        <div class="input-block">
                            <input
                                    type="text"
                                    class="form-control"
                                    placeholder="Search by ID ..."
                            />
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="input-block">
                            <input
                                    type="text"
                                    class="form-control"
                                    placeholder="Search by Name ..."
                            />
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="input-block">
                            <input
                                    type="text"
                                    class="form-control"
                                    placeholder="Search by Phone ..."
                            />
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="search-student-btn">
                            <button type="button" class="btn btn-primary">Search</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-12">
                    <div class="card card-table comman-shadow">
                        <div class="card-body">
                            <!-- Page Header -->
                            <div class="page-header">
                                <div class="row align-items-center">
                                    <div class="col">
                                        <h3 class="page-title">Students</h3>
                                    </div>
                                    <div class="col-auto text-end float-end ms-auto download-grp">
                                        
                                        <a href="${pageContext.request.contextPath}/add-student" class="btn btn-primary"
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
                                        <th>Full Name</th>
                                        <th>Gender</th>
                                        <th>DOB</th>
                                        <th>Email</th>
                                        <th>Phone Number</th>
                                        <th class="text-end">Action</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="item" items="${studentList}">
                                    <tr>
                                        <td>
                                            <h2 class="table-avatar">
                                                <a href="student-details" class="avatar avatar-sm me-2"
                                                ><img
                                                        class="avatar-img rounded-circle"
                                                        src="${pageContext.request.contextPath}/view/dashboard/assets/img/profiles/avatar-01.jpg"
                                                        alt="User Image"
                                                /></a>
                                                <a href="student-details">${item.getFullname()}</a>
                                            </h2>
                                        </td>
                                        <td>${item.getGender()}</td>
                                        <td>${item.getDob()}</td>
                                        <td>${item.getEmail()}</td>
                                        <td>${item.getPhone()}</td>
                                        <td class="text-end">
                                            <div class="actions">
                                                <a
                                                        href="${pageContext.request.contextPath}/student-details"
                                                        class="btn btn-sm bg-success-light me-2"
                                                >
                                                    <i class="feather-eye"></i>
                                                </a>
                                                <a href="${pageContext.request.contextPath}/edit-student"
                                                   class="btn btn-sm bg-danger-light">
                                                    <i class="feather-edit"></i>
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

<%@include file="/view/dashboard/parts/footer.jsp" %>
