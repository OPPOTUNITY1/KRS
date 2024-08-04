<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/view/user/parts/header.jsp" %>

<!-- main-area -->
<main class="main-area fix">

    <!-- breadcrumb-area -->
    <section class="breadcrumb__area breadcrumb__bg" data-background="${pageContext.request.contextPath}/view/user/assets/img/bg/breadcrumb_bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="breadcrumb__content">
                        <h3 class="title">Student SingUp</h3>
                        <nav class="breadcrumb">
                                <span property="itemListElement" typeof="ListItem">
                                    <a href="${pageContext.request.contextPath}/home">Home</a>
                                </span>
                            <span class="breadcrumb-separator"><i class="fas fa-angle-right"></i></span>
                            <span property="itemListElement" typeof="ListItem">SingUp</span>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <div class="breadcrumb__shape-wrap">
            <img src="${pageContext.request.contextPath}/view/user/assets/img/others/breadcrumb_shape01.svg" alt="img" class="alltuchtopdown">
            <img src="${pageContext.request.contextPath}/view/user/assets/img/others/breadcrumb_shape02.svg" alt="img" data-aos="fade-right" data-aos-delay="300">
            <img src="${pageContext.request.contextPath}/view/user/assets/img/others/breadcrumb_shape03.svg" alt="img" data-aos="fade-up" data-aos-delay="400">
            <img src="${pageContext.request.contextPath}/view/user/assets/img/others/breadcrumb_shape04.svg" alt="img" data-aos="fade-down-left" data-aos-delay="400">
            <img src="${pageContext.request.contextPath}/view/user/assets/img/others/breadcrumb_shape05.svg" alt="img" data-aos="fade-left" data-aos-delay="400">
        </div>
    </section>
    <!-- breadcrumb-area-end -->

    <!-- singUp-area -->
    <section class="singUp-area section-py-120">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-6 col-lg-8">
                    <div class="singUp-wrap">
                        <h2 class="title">Create Your Account</h2>
                        <p>Hey there! Ready to join the party? We just need a few details from you to get <br> started. Let's do this!</p>
                        <div class="account__social">
                            <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid&redirect_uri=http://localhost:9999/KRS/login-google&response_type=code&client_id=156208071240-8k0pc7f2p2tsfsifhai2qu5i25gnd6nr.apps.googleusercontent.com&approval_prompt=force" class="account__social-btn">
                                <img src="${pageContext.request.contextPath}/view/user/assets/img/icons/google.svg" alt="img">
                                Continue with google
                            </a>
                        </div>
                        <div class="account__divider">
                            <span>or</span>
                        </div>

                        <form action="register" id="register-form" method="post" class="account__form">
                            <div class="row gutter-20">
                                <div class="col-md-12">
                                    <div class="form-grp">
                                        <label for="fast-name">Full Name</label>
                                        <input type="text" id="fast-name" name="fullName" placeholder="First Name"
                                        <c:if test="${requestScope.fullName != null}">
                                               value="${requestScope.fullName.toString()}"
                                        </c:if>
                                        >
                                    </div>
                                </div>
                                <div class="form-grp">
                                    <label for="email">Email</label>
                                    <input type="email" name="email" id="email"
                                    <c:if test="${requestScope.email != null}">
                                           value="${requestScope.email.toString()}"
                                    </c:if> placeholder="email">
                                </div>
                                <div class="col-md-12">
                                    <div class="form-grp">
                                        <label for="last-name">Username</label>
                                        <input type="text" id="last-name" name="username" <c:if test="${requestScope.username != null}">
                                               value="${requestScope.username.toString()}"
                                        </c:if> placeholder="Last name">
                                    </div>
                                </div>
                            </div>

                            <div class="form-grp">
                                <label for="password">Password</label>
                                <input type="password" id="password" name="password" <c:if test="${requestScope.password != null}">
                                       value="${requestScope.password.toString()}"
                                </c:if> placeholder="password">
                                <label>
                                    <input type="checkbox" class="show-password" onclick="togglePasswordVisibility('password')">
                                </label> Show password
                            </div>

                            <div class="form-grp">
                                <label for="confirm-password">Confirm Password</label>
                                <input type="password" id="confirm-password" name="rePassword"  placeholder="Confirm Password">
                                <label>
                                    <input type="checkbox" class="show-password" onclick="togglePasswordVisibility('confirm-password')">
                                </label> Show password
                            </div>

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

                            <br>
                            <div id="notice" hidden="" class="alert alert-warning" role="alert">
                                <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Warning:"><use xlink:href="#exclamation-triangle-fill"/></svg>
                                <span id="error-message" style="color: red;"></span>
                            </div>

                            <c:if test="${requestScope.alertMsg != null}">
                                <div class="alert alert-warning" role="alert">
                                    <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Warning:"><use xlink:href="#exclamation-triangle-fill"/></svg>
                                        ${requestScope.alertMsg}
                                </div>
                            </c:if>

                            <button type="submit" class="btn btn-two arrow-btn">Sign Up<img src="${pageContext.request.contextPath}/view/user/assets/img/icons/right_arrow.svg" alt="img" class="injectable"></button>
                        </form>

                        <div class="account__switch">
                            <p>Already have an account?<a href="${pageContext.request.contextPath}/login">Login</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- singUp-area-end -->

    <script>
        document.getElementById('register-form').addEventListener('submit', function(event) {
            event.preventDefault();
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirm-password').value;
            const errorMessage = document.getElementById('error-message');
            const notice = document.getElementById('notice');

            if (password !== confirmPassword) {
                notice.hidden = false;
                errorMessage.textContent = 'Passwords do not match. Please try again!';
            } else {
                notice.hidden = true;
                errorMessage.textContent = '';
                document.getElementById('register-form').submit();
            }
        });

        function togglePasswordVisibility(inputId) {
            const inputField = document.getElementById(inputId);
            if (inputField.type === 'password') {
                inputField.type = 'text';
            } else {
                inputField.type = 'password';
            }
        }
    </script>

</main>
<!-- main-area-end -->

<%@include file="/view/user/parts/footer.jsp" %>
