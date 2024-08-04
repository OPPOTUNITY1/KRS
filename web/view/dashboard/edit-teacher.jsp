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
                        <h3 class="page-title">Edit Teachers</h3>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="teachers">Teachers</a></li>
                            <li class="breadcrumb-item active">Edit Teachers</li>
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
                                        <h5 class="form-title"><span>Basic Details</span></h5>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="input-block local-forms">
                                            <label>Teacher ID <span class="login-danger">*</span></label>
                                            <input type="text" class="form-control" value="PRE1234"/>
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="input-block local-forms">
                                            <label>Name <span class="login-danger">*</span></label>
                                            <input type="text" class="form-control" value="Vincent"/>
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="input-block local-forms">
                                            <label>Gender <span class="login-danger">*</span></label>
                                            <select class="form-control select">
                                                <option>Male</option>
                                                <option>Female</option>
                                                <option>Others</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="input-block local-forms calendar-icon">
                                            <label
                                            >Date Of Birth <span class="login-danger">*</span></label
                                            >
                                            <input
                                                    class="form-control datetimepicker"
                                                    type="text"
                                                    placeholder="29-04-2022"
                                            />
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="input-block local-forms">
                                            <label>Mobile <span class="login-danger">*</span></label>
                                            <input
                                                    type="text"
                                                    class="form-control"
                                                    value="077 3499 9959"
                                            />
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="input-block local-forms calendar-icon">
                                            <label
                                            >Joining Date <span class="login-danger">*</span></label
                                            >
                                            <input
                                                    class="form-control datetimepicker"
                                                    type="text"
                                                    placeholder="29-04-2022"
                                            />
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="input-block local-forms">
                                            <label
                                            >Qualification <span class="login-danger">*</span></label
                                            >
                                            <input
                                                    class="form-control"
                                                    type="text"
                                                    value="Bachelor of Engineering"
                                            />
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="input-block local-forms">
                                            <label>Experience <span class="login-danger">*</span></label>
                                            <input class="form-control" type="text" value="5"/>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <h5 class="form-title"><span>Login Details</span></h5>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="input-block local-forms">
                                            <label>Username <span class="login-danger">*</span></label>
                                            <input type="text" class="form-control" value="Vincent"/>
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="input-block local-forms">
                                            <label>Email ID <span class="login-danger">*</span></label>
                                            <input
                                                    type="email"
                                                    class="form-control"
                                                    value="vincent20@gmail.com"
                                            />
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="input-block local-forms">
                                            <label>Password <span class="login-danger">*</span></label>
                                            <input type="password" class="form-control" value="vincent"/>
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="input-block local-forms">
                                            <label
                                            >Repeat Password <span class="login-danger">*</span></label
                                            >
                                            <input type="password" class="form-control" value="vincent"/>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <h5 class="form-title"><span>Address</span></h5>
                                    </div>
                                    <div class="col-12">
                                        <div class="input-block local-forms">
                                            <label>Address <span class="login-danger">*</span></label>
                                            <input
                                                    type="text"
                                                    class="form-control"
                                                    value="3979 Ashwood Drive"
                                            />
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="input-block local-forms">
                                            <label>City <span class="login-danger">*</span></label>
                                            <input type="text" class="form-control" value="Omaha"/>
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="input-block local-forms">
                                            <label>State <span class="login-danger">*</span></label>
                                            <input type="text" class="form-control" value="Omaha"/>
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="input-block local-forms">
                                            <label>Zip Code <span class="login-danger">*</span></label>
                                            <input type="text" class="form-control" value="3979"/>
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="input-block local-forms">
                                            <label>Country <span class="login-danger">*</span></label>
                                            <input type="text" class="form-control" value="USA"/>
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
