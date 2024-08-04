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
                        <h3 class="page-title">Add Teachers</h3>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="teachers">Teachers</a></li>
                            <li class="breadcrumb-item active">Add Teachers</li>
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
                                            <input
                                                    type="text"
                                                    class="form-control"
                                                    placeholder="Teacher ID"
                                            />
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="input-block local-forms">
                                            <label>Name <span class="login-danger">*</span></label>
                                            <input
                                                    type="text"
                                                    class="form-control"
                                                    placeholder="Enter Name"
                                            />
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
                                                    placeholder="DD-MM-YYYY"
                                            />
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="input-block local-forms">
                                            <label>Mobile <span class="login-danger">*</span></label>
                                            <input
                                                    type="text"
                                                    class="form-control"
                                                    placeholder="Enter Phone"
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
                                                    placeholder="DD-MM-YYYY"
                                            />
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-4 local-forms">
                                        <div class="input-block">
                                            <label
                                            >Qualification <span class="login-danger">*</span></label
                                            >
                                            <input
                                                    class="form-control"
                                                    type="text"
                                                    placeholder="Enter Joining Date"
                                            />
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="input-block local-forms">
                                            <label>Experience <span class="login-danger">*</span></label>
                                            <input
                                                    class="form-control"
                                                    type="text"
                                                    placeholder="Enter Experience"
                                            />
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <h5 class="form-title"><span>Login Details</span></h5>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="input-block local-forms">
                                            <label>Username <span class="login-danger">*</span></label>
                                            <input
                                                    type="text"
                                                    class="form-control"
                                                    placeholder="Enter Username"
                                            />
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="input-block local-forms">
                                            <label>Email ID <span class="login-danger">*</span></label>
                                            <input
                                                    type="email"
                                                    class="form-control"
                                                    placeholder="Enter Mail Id"
                                            />
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="input-block local-forms">
                                            <label>Password <span class="login-danger">*</span></label>
                                            <input
                                                    type="text"
                                                    class="form-control"
                                                    placeholder="Enter Password"
                                            />
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="input-block local-forms">
                                            <label
                                            >Repeat Password <span class="login-danger">*</span></label
                                            >
                                            <input
                                                    type="text"
                                                    class="form-control"
                                                    placeholder="Repeat Password"
                                            />
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
                                                    placeholder="Enter address"
                                            />
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="input-block local-forms">
                                            <label>City <span class="login-danger">*</span></label>
                                            <input
                                                    type="text"
                                                    class="form-control"
                                                    placeholder="Enter City"
                                            />
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="input-block local-forms">
                                            <label>State <span class="login-danger">*</span></label>
                                            <input
                                                    type="text"
                                                    class="form-control"
                                                    placeholder="Enter State"
                                            />
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="input-block local-forms">
                                            <label>Zip Code <span class="login-danger">*</span></label>
                                            <input
                                                    type="text"
                                                    class="form-control"
                                                    placeholder="Enter Zip"
                                            />
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="input-block local-forms">
                                            <label>Country <span class="login-danger">*</span></label>
                                            <input
                                                    type="text"
                                                    class="form-control"
                                                    placeholder="Enter Country"
                                            />
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
    <!-- /Page Wrapper -->
</div>
<!-- /Main Wrapper -->

<%@include file="/view/dashboard/parts/footer.jsp" %>
