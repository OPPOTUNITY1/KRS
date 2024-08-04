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
                        <h3 class="page-title">Class List</h3>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index">Dashboard</a></li>
                            <li class="breadcrumb-item active">Class List</li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- /Page Header -->
            <form action="class-manager" method="GET">
                <div class="student-group-form">
                    <div class="row">

                        <div class="col-lg-3 col-md-6">
                            <div class="input-block">
                                <input
                                    type="text"
                                    class="form-control"
                                    name="searchId"
                                    placeholder="Search by ID ..."
                                    />
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="input-block">
                                <input
                                    type="text"
                                    class="form-control"
                                    name="searchName"
                                    placeholder="Search by Name ..."
                                    />
                            </div>
                        </div>

                        <div class="col-lg-2">
                            <div class="search-student-btn">
                                <button type="submit" class="btn btn-primary">Search</button>
                            </div>
                        </div>

                    </div>
                </div>
            </form>
            <div class="row">
                <div class="col-sm-12">
                    <div class="card card-table">
                        <div class="card-body">
                            <!-- Page Header -->
                            <div class="page-header">
                                <div class="row align-items-center">
                                    <div class="col">
                                        <h3 class="page-title">Class List</h3>
                                    </div>
                                    <div class="col-auto text-end float-end ms-auto download-grp">
                                        <a href="${pageContext.request.contextPath}/class-manager/new" class="btn btn-primary"
                                           ><i class="fas fa-plus"></i
                                            ></a>
                                    </div>
                                </div>
                            </div>
                            <!-- /Page Header -->

                            <table
                                class="table border-0 star-student table-hover table-center mb-0 datatable table-striped"
                                >
                                <thead class="student-thread">
                                    <tr>
                                        <th>Class ID</th>
                                        <th>Class Name</th>
                                        <th>Description</th>
                                        <th>Teacher</th>
                                        <th>No of Students</th>
                                        <th class="text-end">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="item" items="${listClass}">
                                        <tr>
                                            <td>${item.getClassId()}</td>
                                            <td>
                                                <h2>
                                                    <a>${item.getClassName()}</a>
                                                </h2>
                                            </td>
                                            <td>${item.getDescription()}</td>
                                            <td>${item.getTeacherName()}</td>
                                            <td>${item.getNumOfStudents()}</td>
                                            <td class="text-end">
                                                <div class="actions">
                                                    <a
                                                        href="${pageContext.request.contextPath}/class-manager/list?id=${item.getClassId()}&name=${item.getClassName()}"
                                                        class="btn btn-sm bg-success-light me-2"
                                                        >
                                                        <i class="feather-eye"></i>
                                                    </a>
                                                    <a
                                                        href="${pageContext.request.contextPath}/edit-class"
                                                        class="btn btn-sm bg-danger-light"
                                                        >
                                                        <i class="feather-edit"></i>
                                                    </a>
                                                        <a href="${pageContext.request.contextPath}/class-manager/delete?id=${item.getClassId()}" onclick="return confirm('Are you sure you want to delete this item?');" class="btn btn-sm bg-danger-light">
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

<%@include file="/view/dashboard/parts/footer.jsp" %>
