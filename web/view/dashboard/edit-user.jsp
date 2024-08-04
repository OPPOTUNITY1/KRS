<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/view/dashboard/parts/header.jsp" %>
<%@ include file="/view/dashboard/parts/sidebar.jsp" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/view/dashboard/parts/header.jsp" %>
<%@ include file="/view/dashboard/parts/sidebar.jsp" %>

<script type="text/javascript">
    function validateForm() {
        var fullName = document.getElementById("fullName").value.trim();
        var email = document.getElementById("email").value.trim();
        var phone = document.getElementById("phone").value.trim();

        // Validate fullName (Vietnamese characters and spaces only)
        var nameRegex = /^[\p{L} ]+$/u;
        if (!nameRegex.test(fullName)) {
            alert("Invalid full name. Please use Vietnamese characters and spaces only.");
            return false;
        }

        // Validate email format
        if (email.indexOf("@") === -1) {
            alert("Invalid email format.");
            return false;
        }

        // Validate phone number (must be exactly 10 digits)
        var phoneRegex = /^\d{10}$/;
        if (!phoneRegex.test(phone)) {
            alert("Invalid phone number. Please enter a 10-digit number.");
            return false;
        }

        return true; // Form is valid, proceed with submission
    }
</script>
<div class="main-wrapper">
    <!-- Page Wrapper -->
    <div class="page-wrapper">
        <div class="content container-fluid">
            <!-- Page Header -->
            <div class="page-header">
                <div class="row align-items-center">
                    <div class="col-sm-12">
                        <div class="page-sub-header">
                            <h3 class="page-title">Edit Users</h3>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="users">User</a></li>
                                <li class="breadcrumb-item active">Edit Users</li>
                            </ul>
                        </div>
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

            <!-- Error Message -->
            <c:if test="${not empty sessionScope.errorMessage}">
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        ${sessionScope.errorMessage}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <!-- Clear the error message from session after displaying -->
                <%
                    session.removeAttribute("errorMessage");
                %>
            </c:if>
            <!-- /Error Message -->

            <!-- Edit Student Form -->
            <div class="row">
                <div class="col-sm-12">
                    <div class="card comman-shadow">
                        <div class="card-body">
                            <form action="${pageContext.request.contextPath}/manager-user/update" method="post" onsubmit="return validateForm()">
                                <input type="hidden" name="uid" value="${requestScope.user.user_id}" />
                                <div class="row">
                                    <div class="col-12">
                                        <h5 class="form-title user-info">Student Information</h5>
                                    </div>

                                    <div class="col-12 col-sm-4">
                                        <div class="input-block local-forms">
                                            <label>Full Name <span class="login-danger">*</span></label>
                                            <input class="form-control" value="${requestScope.user.getFullname()}" type="text" name="fullname" placeholder="Enter Full Name" required />
                                        </div>
                                    </div>

                                    <div class="col-12 col-sm-4">
                                        <div class="input-block local-forms">
                                            <label>Username <span class="login-danger">*</span></label>
                                            <input class="form-control" value="${requestScope.user.getUsername()}" type="text" name="username" placeholder="Enter Username" required />
                                        </div>
                                    </div>

                                    <div class="col-12 col-sm-4">
                                        <div class="input-block local-forms">
                                            <label>Gender <span class="login-danger">*</span></label>
                                            <select class="form-control" name="gender" required>
                                                <option value="">Select Gender</option>
                                                <option ${requestScope.user.getGender().equals("F") ? 'selected' : ''} value="F">Female</option>
                                                <option ${requestScope.user.getGender().equals("M") ? 'selected' : ''} value="M">Male</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-12 col-sm-6">
                                        <div class="input-block local-forms">
                                            <label>Email <span class="login-danger">*</span></label>
                                            <input class="form-control" type="email" value="${requestScope.user.getEmail()}"  name="email" placeholder="Enter Email Address" required />
                                        </div>
                                    </div>

                                    <div class="col-12 col-sm-6">
                                        <div class="input-block local-forms">
                                            <label>Role <span class="login-danger">*</span></label>
                                            <select class="form-control" name="role" required>
                                                <option value="">Select Role</option>
                                                <option ${requestScope.user.getSetting_id() == 4 ? 'selected' : ''} value="Student">Student</option>
                                                <option ${requestScope.user.getSetting_id() == 3 ? 'selected' : ''} value="Teacher">Teacher</option>
                                                <option ${requestScope.user.getSetting_id() == 2 ? 'selected' : ''} value="Manager">Manager</option>
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
            <!-- /Edit Student Form -->
        </div>
    </div>
    <!-- /Page Wrapper -->
    <!-- /Page Wrapper -->
</div>
<!-- /Main Wrapper -->
<%@ include file="/view/dashboard/parts/footer.jsp" %>