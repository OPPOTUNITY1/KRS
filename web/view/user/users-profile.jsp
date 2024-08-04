<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/view/user/parts/header.jsp" %>

<main id="main" class="main">
    <section class="section profile">
        <div class="row">
            <div class="col-xl-4">

                <div class="card">
                    <div class="card-body profile-card pt-4 d-flex flex-column align-items-center">
                        <c:url value="/view/user/assets/img/users/${sessionScope.user.getAvatar()}" var="urlImg"/>

                        <c:if test="${sessionScope.user.getAvatar() == null}">
                            <c:set value="${pageContext.request.contextPath}/view/user/assets/img/users/default_img.png" var="urlImg"/>
                        </c:if>
                        <img src="${urlImg}" style="object-fit: cover !important; object-position: center; width: 80px !important; height: 80px !important;" alt="Profile" class="rounded-circle">

                        <h2>${sessionScope.user.getFullname()}</h2>
                        <h3>${requestScope.userRole}</h3>
                        <div class="social-links mt-2">
                            <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
                            <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
                            <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
                            <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
                        </div>
                    </div>
                </div>

            </div>

            <div class="col-xl-8">

                <div class="card">
                    <div class="card-body pt-3">
                        <!-- Bordered Tabs -->
                        <ul class="nav nav-tabs nav-tabs-bordered">

                            <li class="nav-item">
                                <button class="nav-link ${requestScope.wrong_password != null ? "" : "active"}" data-bs-toggle="tab" data-bs-target="#profile-overview">
                                    Overview
                                </button>
                            </li>

                            <li class="nav-item">
                                <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-edit">Edit
                                    Profile
                                </button>
                            </li>

                            <li class="nav-item">
                                <button class="nav-link ${requestScope.wrong_password != null ? "active" : ""}" data-bs-toggle="tab" data-bs-target="#profile-change-password">
                                    Change Password
                                </button>
                            </li>

                        </ul>
                        <div class="tab-content pt-2">

                            <div class="tab-pane fade ${requestScope.wrong_password != null ? "" : "show active"} profile-overview" id="profile-overview">
                                <h5 class="card-title">About</h5>
                                <p class="small fst-italic">Have a good day!</p>

                                <h5 class="card-title">Profile Details</h5>

                                <div class="row">
                                    <div class="col-lg-3 col-md-4 label ">Full Name</div>
                                    <div class="col-lg-9 col-md-8">${sessionScope.user.getFullname()}</div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-3 col-md-4 label">Phone</div>
                                    <div class="col-lg-9 col-md-8">${sessionScope.user.getPhone()}</div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-3 col-md-4 label">Date Of Birth</div>
                                    <div class="col-lg-9 col-md-8">${sessionScope.user.getDob() == null ? "01/01/1990" :sessionScope.user.getDob()}</div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-3 col-md-4 label">Gender</div>
                                    <div class="col-lg-9 col-md-8">${sessionScope.user.getGender() == "M" ? "Male" : ""}${sessionScope.user.getGender() == "F" ? "Female" : ""}</div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-3 col-md-4 label">Email</div>
                                    <div class="col-lg-9 col-md-8">${sessionScope.user.getEmail()}</div>
                                </div>
                                <c:if test="${sessionScope.user.getIsVerified_email() == 0}">
                                    <div class="alert alert-danger" role="alert">
                                        Your email has not been verified!<a href="verify-email?username=${sessionScope.user.getUsername()}&email=${sessionScope.user.getEmail()}" class="alert-link"> Please verify! </a>
                                    </div>
                                </c:if>

                            </div>

                            <div class="tab-pane fade profile-edit pt-3" id="profile-edit">
                                <!-- Profile Edit Form -->
                                <c:set value="image" var="update"/>
                                <form action="${pageContext.request.contextPath}/user-profile?update=${update}" method="post" enctype="multipart/form-data">
                                    <div class="row mb-3">
                                        <label for="formFile" class="col-md-4 col-lg-3 form-label">Profile Image</label>
                                        <div class="col-md-8 col-lg-9">
                                            <c:url value="/view/user/assets/img/users/${sessionScope.user.getAvatar()}" var="urlImg1"/>
                                            <c:if test="${sessionScope.user.getAvatar() == null}">
                                                <c:url value="/view/user/assets/img/users/default_img.png" var="urlImg1"/>
                                            </c:if>

                                            <img class="col-md-8 col-lg-9" src="${urlImg1}" style="padding-bottom: 5px;" id="img_display" alt="Profile">
                                            <input class="form-control" name="fileImage" accept=".jpg, .png" type="file" id="formFile">
                                        </div>
                                    </div>
                                    <div class="text-center mb-5">
                                        <button type="submit" class="btn btn-primary">Save Changes</button>
                                    </div>
                                </form>
                                <c:set value="info" var="update"/>
                                <form action="${pageContext.request.contextPath}/user-profile?update=${update}" method="post" >
                                    <div class="row mb-3">
                                        <label for="fullName" class="col-md-4 col-lg-3 col-form-label">Full Name</label>
                                        <div class="col-md-8 col-lg-9">
                                            <input name="fullName" type="text" class="form-control" id="fullName"
                                                   value="${sessionScope.user.getFullname()}">
                                        </div>
                                    </div>

                                    <div class="row mb-3">
                                        <label for="Phone" class="col-md-4 col-lg-3 col-form-label">Phone</label>
                                        <div class="col-md-8 col-lg-9">
                                            <input name="phone" type="text" class="form-control" id="Phone"
                                                   value="${sessionScope.user.getPhone()}">
                                        </div>
                                    </div>

                                    <div class="row mb-3">
                                        <div class="col-md-11 col-lg-12">
                                            <label class="col-md-4 col-lg-3 col-form-label">Gender</label>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="gender" id="inlineRadio1" value="M" ${sessionScope.user.gender == 'M' ? 'checked' : ''} />
                                                <label class="form-check-label" for="inlineRadio1">Male</label>
                                            </div>

                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="gender" id="inlineRadio2" value="F" ${sessionScope.user.gender == 'F' ? 'checked' : ''} />
                                                <label class="form-check-label" for="inlineRadio2">Female</label>
                                            </div>
                                        </div>
                                        <div class="invalid-feedback">Please enter your gender!</div>
                                    </div>

                                    <div class="row mb-3">
                                        <label for="dob" class="col-md-4 col-lg-3 col-form-label">Date Of Birth</label>
                                        <div class="col-md-8 col-lg-9">
                                            <input name="dob" type="date" class="form-control" id="dob"
                                                   value="${sessionScope.user.getDob()}">
                                        </div>
                                    </div>

                                    <div class="row mb-3">
                                        <label for="Email" class="col-md-4 col-lg-3 col-form-label">Email</label>
                                        <div class="col-md-8 col-lg-9">
                                            <input name="email" type="email" class="form-control" id="Email"
                                                   value="${sessionScope.user.getEmail()}">
                                        </div>
                                    </div>

                                    <div class="text-center">
                                        <button type="submit" class="btn btn-primary">Save Changes</button>
                                    </div>
                                </form><!-- End Profile Edit Form -->

                            </div>

                            <div class="tab-pane fade pt-3 ${requestScope.wrong_password != null ? "show active" : ""}" id="profile-change-password">
                                <!-- Change Password Form -->
                                <form action="change-pass"  id="change-pass-form"  method="post">
                                    <div class="row mb-3">
                                        <label for="currentPassword" class="col-md-4 col-lg-3 col-form-label">Current
                                            Password</label>
                                        <div class="col-md-8 col-lg-9">
                                            <input name="currentPassword" type="password" class="form-control"
                                                   id="currentPassword">
                                        </div>
                                    </div>

                                    <div class="row mb-3">
                                        <label for="newPassword" class="col-md-4 col-lg-3 col-form-label">New
                                            Password</label>
                                        <div class="col-md-8 col-lg-9">
                                            <input name="new_password" type="password" class="form-control"
                                                   id="newPassword">
                                        </div>
                                    </div>

                                    <div class="row mb-3">
                                        <label for="renewPassword" class="col-md-4 col-lg-3 col-form-label">Re-enter New
                                            Password</label>
                                        <div class="col-md-8 col-lg-9">
                                            <input name="re_new_password" type="password" class="form-control"
                                                   id="renewPassword">
                                        </div>
                                    </div>

                                    <div class="text-center">
                                        <button type="submit" class="btn btn-primary">Change Password</button>
                                    </div>
                                    <div id="error-message" class="text-danger text-center mt-3"></div>

                                    <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
                                        <symbol id="exclamation-triangle-fill" fill="currentColor" viewBox="0 0 16 16">
                                            <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"></path>
                                        </symbol>
                                        <symbol id="check-circle-fill" fill="currentColor" viewBox="0 0 16 16">
                                            <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"></path>
                                        </symbol>
                                        <symbol id="info-fill" fill="currentColor" viewBox="0 0 16 16">
                                            <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z"></path>
                                        </symbol>
                                    </svg>

                                    <c:if test="${requestScope.wrong_password != null}">
                                        <div class="alert alert-warning" role="alert">
                                            <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Warning:"><use xlink:href="#exclamation-triangle-fill"/></svg>
                                                ${requestScope.wrong_password}
                                        </div>
                                    </c:if>

                                </form><!-- End Change Password Form -->
                            </div>
                        </div><!-- End Bordered Tabs -->
                    </div>
                </div>
            </div>
        </div>
    </section>
</main><!-- End #main -->

<script>
    document.getElementById('change-pass-form').addEventListener('submit', function(event) {
        event.preventDefault();
        const newPassword = document.getElementById('newPassword').value;
        const renewPassword = document.getElementById('renewPassword').value;
        const errorMessage = document.getElementById('error-message');

        if (newPassword !== renewPassword) {
            errorMessage.textContent = 'Passwords do not match. Please try again!';
        } else {
            errorMessage.textContent = '';
            document.getElementById('change-pass-form').submit();
        }
    });
</script>
<%@include file="/view/user/parts/footer.jsp" %>
