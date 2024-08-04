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
                        <h3 class="title">Student Login</h3>
                        <nav class="breadcrumb">
                                <span property="itemListElement" typeof="ListItem">
                                    <a href="${pageContext.request.contextPath}/home">Home</a>
                                </span>
                            <span class="breadcrumb-separator"><i class="fas fa-angle-right"></i></span>
                            <span property="itemListElement" typeof="ListItem">Login</span>
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
                        <h2 class="title">Welcome back!</h2>
                        <p>Hey there! Ready to log in? Just enter your username and password below, you'll be back in action in no time. Let's go!</p>

                        <div class="account__social">
                            <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid&redirect_uri=http://localhost:9999/KRS/login-google&response_type=code&client_id=156208071240-8k0pc7f2p2tsfsifhai2qu5i25gnd6nr.apps.googleusercontent.com&approval_prompt=force"
                               class="account__social-btn">
                                <img src="${pageContext.request.contextPath}/view/user/assets/img/icons/google.svg" alt="img">
                                Continue with google
                            </a>
                        </div>

                        <div class="account__divider">
                            <span>or</span>
                        </div>
                        <form action="login" method="post" class="account__form">

                            <div class="form-grp">
                                <label for="username">Username</label>
                                <input id="username" name="username" type="text"
                                <c:if test="${requestScope.username != null}">
                                       value="${requestScope.username.toString()}"
                                </c:if>
                                placeholder="username">
                            </div>

                            <div class="form-grp">
                                <label for="password">Password</label>
                                <input id="password" name="password" type="password"
                                <c:if test="${requestScope.password != null}">
                                       value="${requestScope.password.toString()}"
                                </c:if>
                                placeholder="password">
                            </div>

                            <div class="account__check">
                                <div class="account__check-remember">
                                    <input type="checkbox" class="form-check-input" name="remember" value="true" id="terms-check"
                                        <c:if test="${requestScope.remember == true}">
                                           checked
                                        </c:if>
                                    >
                                    <label for="terms-check" class="form-check-label">Remember me</label>
                                </div>

                                <div class="account__check-forgot">
                                    <a href="${pageContext.request.contextPath}/forgot">Forgot Password?</a>
                                </div>
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

                            <c:if test="${requestScope.resetPassSuccess != null}">
                                <div class="alert alert-success d-flex align-items-center" role="alert">
                                    <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>
                                    <div>
                                        ${requestScope.resetPassSuccess}
                                    </div>
                                </div>
                            </c:if>

                            <c:if test="${requestScope.emailSuccess != null}">
                                <div class="alert alert-success d-flex align-items-center" role="alert">
                                    <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>
                                    <div>
                                        ${requestScope.emailSuccess}
                                    </div>
                                </div>
                            </c:if>

                            <c:if test="${requestScope.changeSuccess != null}">
                                <div class="alert alert-success d-flex align-items-center" role="alert">
                                    <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>
                                    <div>
                                        ${requestScope.changeSuccess}
                                    </div>
                                </div>
                            </c:if>

                            <c:if test="${requestScope.loginFailMessage != null}">
                                <div class="alert alert-warning" role="alert">
                                    <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Warning:"><use xlink:href="#exclamation-triangle-fill"/></svg>
                                        ${requestScope.loginFailMessage}
                                </div>
                            </c:if>

                            <button type="submit" class="btn btn-two arrow-btn">Sign In<img src="${pageContext.request.contextPath}/view/user/assets/img/icons/right_arrow.svg" alt="img" class="injectable"></button>
                        </form>
                        <div class="account__switch">
                            <p>Don't have an account?<a href="${pageContext.request.contextPath}/register">Sign Up</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- singUp-area-end -->

</main>
<!-- main-area-end -->
<%@include file="/view/user/parts/footer.jsp" %>
