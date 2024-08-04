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
                        <h3 class="page-title">Edit Department</h3>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="departments">Department</a></li>
                            <li class="breadcrumb-item active">Edit Department</li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- /Page Header -->

            <div class="row">
                <div class="col-sm-12">
                    <div class="card">
                        <div class="card-body">
                            <form>
                                <div class="row">
                                    <div class="col-12">
                                        <h5 class="form-title"><span>Department Details</span></h5>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="input-block local-forms">
                                            <label
                                            >Department ID <span class="login-danger">*</span></label
                                            >
                                            <input type="text" class="form-control" value="PRE1534"/>
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="input-block local-forms">
                                            <label
                                            >Department Name <span class="login-danger">*</span></label
                                            >
                                            <input type="text" class="form-control" value="MCA"/>
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="input-block local-forms">
                                            <label
                                            >Head of Department
                                                <span class="login-danger">*</span></label
                                            >
                                            <input type="text" class="form-control" value="Lois A"/>
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="input-block local-forms calendar-icon">
                                            <label
                                            >Department Start Date
                                                <span class="login-danger">*</span></label
                                            >
                                            <input
                                                    class="form-control datetimepicker"
                                                    type="text"
                                                    placeholder="DD-MM-YYYY"
                                            />
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="input-block local-forms">
                                            <label
                                            >No of Students <span class="login-danger">*</span></label
                                            >
                                            <input type="text" class="form-control" value="200"/>
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
