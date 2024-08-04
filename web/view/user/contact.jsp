<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="/view/user/parts/header.jsp" %>

<!-- main-area -->
<main class="main-area fix">

    <!-- breadcrumb-area -->
    <section class="breadcrumb__area breadcrumb__bg" data-background="${pageContext.request.contextPath}/view/user/assets/img/bg/breadcrumb_bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="breadcrumb__content">
                        <h3 class="title">Contact With Us</h3>
                        <nav class="breadcrumb">
                                <span property="itemListElement" typeof="ListItem">
                                    <a href="${pageContext.request.contextPath}/home">Home</a>
                                </span>
                            <span class="breadcrumb-separator"><i class="fas fa-angle-right"></i></span>
                            <span property="itemListElement" typeof="ListItem">Contact</span>
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

    <!-- contact-area -->
    <section class="contact-area section-py-120">
        <div class="container">
            <div class="row">
                <div class="col-lg-4">
                    <div class="contact-info-wrap">
                        <ul class="list-wrap">
                            <li>
                                <div class="icon">
                                    <img src="${pageContext.request.contextPath}/view/user/assets/img/icons/map.svg" alt="img" class="injectable">
                                </div>
                                <div class="content">
                                    <h4 class="title">Address</h4>
                                    <p>Khu CNC Hoa Lac <br> Ha Noi, VN</p>
                                </div>
                            </li>
                            <li>
                                <div class="icon">
                                    <img src="${pageContext.request.contextPath}/view/user/assets/img/icons/contact_phone.svg" alt="img" class="injectable">
                                </div>
                                <div class="content">
                                    <h4 class="title">Phone</h4>
                                    <a href="">0362815301</a>
                                </div>
                            </li>
                            <li>
                                <div class="icon">
                                    <img src="${pageContext.request.contextPath}/view/user/assets/img/icons/emial.svg" alt="img" class="injectable">
                                </div>
                                <div class="content">
                                    <h4 class="title">E-mail Address</h4>
                                    <a href="mailto:info@gmail.com">esteemws203@gmail.com</a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="contact-form-wrap">
                        <h4 class="title">Send Us Message</h4>
                        <p>Your email address will not be published. Required fields are marked *</p>
                        <form id="contact-form" action="contact" method="POST">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-grp">
                                        <input name="name" type="text" placeholder="Name *" required>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-grp">
                                        <input name="email" type="email" placeholder="E-mail *" required>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-grp">
                                        <input name="subject" type="text" placeholder="Subject *" required>
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <div class="form-grp">
                                        <input name="mobile" type="text" placeholder="Mobile *" required>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-grp">
                                        <select style="height: 50px;" name="contact_type" class="form-select" id="contact-type" required>
                                            <option selected value="contact_admin">Contact Admin</option>
                                            <option value="issue_class">Issue Class</option>
                                            <option value="issue_subject">Issue Less</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-grp">
                                        <textarea name="message" placeholder="Comment" required></textarea>
                                    </div>
                                </div>

                                <c:if test="${param.success != null}">
                                    <p id="success-message" style="color: green;">Contact successfully!</p>
                                </c:if>

                                <c:if test="${param.error != null}">
                                    <p id="error-message" style="color: red;">
                                        <c:choose>
                                            <c:when test="${param.error == 'validation'}">Please fill in all fields.</c:when>
                                            <c:otherwise>Failed to send contact email. Please try again later.</c:otherwise>
                                        </c:choose>
                                    </p>
                                </c:if>
                            </div>
                            <button type="submit" class="btn btn-two arrow-btn">Submit Now <img src="${pageContext.request.contextPath}/view/user/assets/img/icons/right_arrow.svg" alt="img" class="injectable"></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- contact-area-end -->

</main>
<!-- main-area-end -->

<%@ include file="/view/user/parts/footer.jsp" %>
