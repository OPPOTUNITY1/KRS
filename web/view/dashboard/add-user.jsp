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
                    <div class="col-sm-12">
                        <div class="page-sub-header">
                            <h3 class="page-title">Add Users</h3>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/users">Students</a></li>
                                <li class="breadcrumb-item active">Add Users</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /Page Header -->

            <div class="row">
                <div class="col-sm-12">
                    <div class="card comman-shadow">
                        <div class="card-body">
                            <c:if test="${not empty message}">
                                <div class="alert alert-success">${message}</div>
                            </c:if>

                            <!-- Display error message -->
                            <c:if test="${not empty error}">
                                <div class="alert alert-danger">${error}</div>
                            </c:if>

                            <form method="post" action="${pageContext.request.contextPath}/manager-user/insert" name="userForm" onsubmit="return validateForm()">
                                <div class="row">
                                    <div class="col-12">
                                        <h5 class="form-title user-info">
                                            Users Information <span><a href="#"></a></span>
                                        </h5>
                                    </div>

                                    <div class="col-12 col-sm-4">
                                        <div class="input-block local-forms">
                                            <label>Full Name <span class="login-danger">*</span></label>
                                            <input class="form-control" type="text" name="fullname" placeholder="Enter Full Name" required />
                                        </div>
                                    </div>

                                    <div class="col-12 col-sm-4">
                                        <div class="input-block local-forms">
                                            <label>Username <span class="login-danger">*</span></label>
                                            <input class="form-control" type="text" name="username" placeholder="Enter Username" required />
                                        </div>
                                    </div>

                                    <div class="col-12 col-sm-4">
                                        <div class="input-block local-forms">
                                            <label>Gender <span class="login-danger">*</span></label>
                                            <select class="form-control" name="gender" required>
                                                <option value="">Select Gender</option>
                                                <option value="F">Female</option>
                                                <option value="M">Male</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-12 col-sm-6">
                                        <div class="input-block local-forms">
                                            <label>Email <span class="login-danger">*</span></label>
                                            <input class="form-control" type="email" name="email" placeholder="Enter Email Address" required />
                                        </div>
                                    </div>

                                    <div class="col-12 col-sm-6">
                                        <div class="input-block local-forms">
                                            <label>Role <span class="login-danger">*</span></label>
                                            <select class="form-control" name="role" required>
                                                <option value="">Select Role</option>
                                                <option value="Student">Student</option>
                                                <option value="Teacher">Teacher</option>
                                                <option value="Manager">Manager</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="user-submit">
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

    <!-- /Page Wrapper -->
</div>
<!-- /Main Wrapper -->
<script>
    function validateForm() {
        let fullname = document.forms["userForm"]["fullname"].value;
        let email = document.forms["userForm"]["email"].value;
        let phone = document.forms["userForm"]["phone"].value;

        let fullnameRegex = /^[\p{L}\s]+$/u;
        if (!fullnameRegex.test(fullname)) {
            alert("Invalid full name.");
            return false;
        }

        let emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(email)) {
            alert("Invalid email format.");
            return false;
        }

        let phoneRegex = /^\d{10}$/;
        if (!phoneRegex.test(phone)) {
            alert("Invalid phone number. Please enter a 10-digit number.");
            return false;
        }

        return true;
    }
</script>
<%@include file="/view/dashboard/parts/footer.jsp" %>