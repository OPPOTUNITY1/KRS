<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@include file="/view/user/parts/header.jsp" %>


<!-- Password Reset 1-->
<div class="bg-light py-3 py-md-5">
    <div class="container">
        <div class="row justify-content-md-center">
            <div class="col-12 col-md-11 col-lg-8 col-xl-7 col-xxl-6">
                <div class="bg-white p-4 p-md-5 rounded shadow-sm">
                    <h2 class="title text-center">Verification Code</h2>
                    <div class="row gy-3 mb-5">
                        <div class="col-12">
                            <h2 class="fs-6 fw-normal text-center text-secondary m-0 px-md-5">Please enter the code sent
                                to your email to verify your email.</h2>
                        </div>
                    </div>
                    <form action="verify" method="post">
                        <div class="row gy-3 gy-md-4 overflow-hidden">
                            <div class="col-12">
                                <label for="code_enter" class="form-label">Code <span
                                        class="text-danger">*</span></label>
                                <div class="input-group">

                  <span class="input-group-text">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                         class="bi bi-envelope" viewBox="0 0 16 16">
                      <path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4Zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2Zm13 2.383-4.708 2.825L15 11.105V5.383Zm-.034 6.876-5.64-3.471L8 9.583l-1.326-.795-5.64 3.47A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.741ZM1 11.105l4.708-2.897L1 5.383v5.722Z"></path>
                    </svg>
                  </span>
                                    <input type="text" class="form-control" name="code_enter"
                                           value="${requestScope.verificationCodeEnter != null ? requestScope.verificationCodeEnter : ""}"
                                           id="code_enter">


                                    <label for="code_created"></label>
                                    <input type="text" value="${requestScope.verificationCode != null ? requestScope.verificationCode : ""}" hidden=""
                                           class="form-control" name="code_created" id="code_created">

                                    <label for="username"></label>
                                    <input type="text" value="${requestScope.username != null ? requestScope.username : ""}" hidden=""
                                           class="form-control" name="username" id="username">

                                    <label for="forgotPassRequest"></label>
                                    <input type="text" value="${requestScope.forgotPassRequest != null ? requestScope.forgotPassRequest : ""}" hidden=""
                                           class="form-control" name="forgotPassRequest" id="forgotPassRequest">

                                    <label for="verify_email"></label>
                                    <input type="text" value="${requestScope.verify_email != null ? requestScope.verify_email : ""}" hidden=""
                                           class="form-control" name="verify_email" id="verify_email">

                                    <label for="verify_email_signUp"></label>
                                    <input type="text" value="${requestScope.verify_email_signUp != null ? requestScope.verify_email_signUp : ""}" hidden=""
                                           class="form-control" name="verify_email_signUp" id="verify_email_signUp">

                                </div>
                            </div>

                            <div class="col-12">
                                <div class="d-grid">
                                    <button class="btn btn-primary btn-lg mb-4" type="submit">Submit</button>
                                </div>

                                <c:if test="${requestScope.alertMsg != null}">
                                    <p id="error-message" style="color: red;">${requestScope.alertMsg}</p>
                                </c:if>

                            </div>
                            <div class="col-12">
                                <div class="d-flex gap-2 justify-content-between">
                                    <a href="${pageContext.request.contextPath}/login"
                                       class="link-primary text-decoration-none">Log In</a>
                                    <a href="${pageContext.request.contextPath}/register"
                                       class="link-primary text-decoration-none">Register</a>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<%--<c:if test="${requestScope.alertMsg != null}">--%>
<%--    <script>--%>
<%--        alert(${requestScope.alertMsg});--%>
<%--    </script>--%>
<%--</c:if>--%>

<%@include file="/view/user/parts/footer.jsp" %>
