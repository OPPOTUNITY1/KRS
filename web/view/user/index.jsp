<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/view/user/parts/header.jsp" %>

<!-- main-area -->
<main class="main-area fix">
    <!-- banner-area -->
    <section class="banner-area banner-bg tg-motion-effects" data-background="${pageContext.request.contextPath}/view/user/assets/img/banner/banner_bg.png">
        <div class="container">
            <div class="row justify-content-between align-items-start">
                <div class="col-xl-5 col-lg-6">
                    <div class="banner__content">
                        <h3 class="title tg-svg" data-aos="fade-right" data-aos-delay="400">
                            Never Stop
                            <span class="position-relative">
                                    <span class="svg-icon" id="banner-svg"
                                          data-svg-icon="${pageContext.request.contextPath}/view/user/assets/img/objects/title_shape.svg"></span>
                                    <svg x="0px" y="0px" preserveAspectRatio="none" viewBox="0 0 209 59" fill="none"
                                         xmlns="http://www.w3.org/2000/svg">
                                        <path d="M4.74438 7.70565C69.7006 -1.18799 136.097 -2.38304 203.934 4.1205C207.178 4.48495 209.422 7.14626 208.933 10.0534C206.793 23.6481 205.415 36.5704 204.801 48.8204C204.756 51.3291 202.246 53.5582 199.213 53.7955C136.093 59.7623 74.1922 60.5985 13.5091 56.3043C10.5653 56.0924 7.84371 53.7277 7.42158 51.0325C5.20725 38.2627 2.76333 25.6511 0.0898448 13.1978C-0.465589 10.5873 1.61173 8.1379 4.73327 7.70565"
                                              fill="currentcolor"></path>
                                    </svg>
                                    Learning
                                </span>
                            <br>Life <b>Never Stop</b> Teaching
                        </h3>
                        <p data-aos="fade-right" data-aos-delay="600">Every teaching and learning journey is unique
                            Following We'll help guide your way.</p>
                        <div class="banner__btn-wrap" data-aos="fade-right" data-aos-delay="800">
                            <a href="${pageContext.request.contextPath}/subject" class="btn arrow-btn">Start Free Trial <img
                                    src="${pageContext.request.contextPath}/view/user/assets/img/icons/right_arrow.svg" alt="img" class="injectable"></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="banner__images">
                        <img src="${pageContext.request.contextPath}/view/user/assets/img/banner/banner_img.png" alt="img" class="main-img">
                        <div class="shape big-shape" data-aos="fade-up-right" data-aos-delay="600">
                            <img src="${pageContext.request.contextPath}/view/user/assets/img/banner/banner_shape01.png" alt="shape" class="tg-motion-effects1">
                        </div>
                        <img src="${pageContext.request.contextPath}/view/user/assets/img/banner/bg_dots.svg" alt="shape" class="shape bg-dots rotateme">
                        <img src="${pageContext.request.contextPath}/view/user/assets/img/banner/banner_shape02.png" alt="shape"
                             class="shape small-shape tg-motion-effects3">
                        <div class="banner__author">
                            <div class="banner__author-item">
                                <div class="image">
                                    <img src="${pageContext.request.contextPath}/view/user/assets/img/banner/banner_author01.png" alt="img">
                                </div>
                                <h6 class="name">Robert Fox</h6>
                            </div>
                            <div class="banner__author-item">
                                <div class="image">
                                    <img src="${pageContext.request.contextPath}/view/user/assets/img/banner/banner_author02.png" alt="img">
                                </div>
                                <h6 class="name">Michel Jones</h6>
                            </div>
                            <img src="${pageContext.request.contextPath}/view/user/assets/img/banner/banner_shape02.svg" alt="shape"
                                 class="arrow-shape tg-motion-effects3">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <img src="${pageContext.request.contextPath}/view/user/assets/img/banner/banner_shape01.svg" alt="shape" class="line-shape" data-aos="fade-right"
             data-aos-delay="1600">
    </section>
    <!-- banner-area-end -->

    <!-- about-area -->
    <section class="about-area tg-motion-effects section-py-120">
        <div class="container">
            <div class="row align-items-center justify-content-center">
                <div class="col-lg-6 col-md-9">
                    <div class="about__images">
                        <img src="${pageContext.request.contextPath}/view/user/assets/img/others/about_img.png" alt="img" class="main-img">
                        <img src="${pageContext.request.contextPath}/view/user/assets/img/others/about_shape.svg" alt="img" class="shape alltuchtopdown">
                        <a href="https://www.youtube.com/watch?v=b2Az7_lLh3g" class="popup-video">
                            <svg xmlns="http://www.w3.org/2000/svg" width="22" height="28" viewBox="0 0 22 28"
                                 fill="none">
                                <path d="M0.19043 26.3132V1.69421C0.190288 1.40603 0.245303 1.12259 0.350273 0.870694C0.455242 0.6188 0.606687 0.406797 0.79027 0.254768C0.973854 0.10274 1.1835 0.0157243 1.39936 0.00193865C1.61521 -0.011847 1.83014 0.0480663 2.02378 0.176003L20.4856 12.3292C20.6973 12.4694 20.8754 12.6856 20.9999 12.9535C21.1245 13.2214 21.1904 13.5304 21.1904 13.8456C21.1904 14.1608 21.1245 14.4697 20.9999 14.7376C20.8754 15.0055 20.6973 15.2217 20.4856 15.3619L2.02378 27.824C1.83056 27.9517 1.61615 28.0116 1.40076 27.9981C1.18536 27.9847 0.97607 27.8983 0.792638 27.7472C0.609205 27.596 0.457661 27.385 0.352299 27.1342C0.246938 26.8833 0.191236 26.6008 0.19043 26.3132Z"
                                      fill="currentcolor"></path>
                            </svg>
                        </a>
                        <div class="about__enrolled" data-aos="fade-right" data-aos-delay="200">
                            <p class="title"><span>36K+</span> Enrolled Students</p>
                            <img src="${pageContext.request.contextPath}/view/user/assets/img/others/student_grp.png" alt="img">
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="about__content">
                        <div class="section__title">
                            <span class="sub-title">Get More About Us</span>
                            <h2 class="title">
                                Thousand Of Top
                                <span class="position-relative">
                                        <svg x="0px" y="0px" preserveAspectRatio="none" viewBox="0 0 209 59" fill="none"
                                             xmlns="http://www.w3.org/2000/svg">
                                            <path d="M4.74438 7.70565C69.7006 -1.18799 136.097 -2.38304 203.934 4.1205C207.178 4.48495 209.422 7.14626 208.933 10.0534C206.793 23.6481 205.415 36.5704 204.801 48.8204C204.756 51.3291 202.246 53.5582 199.213 53.7955C136.093 59.7623 74.1922 60.5985 13.5091 56.3043C10.5653 56.0924 7.84371 53.7277 7.42158 51.0325C5.20725 38.2627 2.76333 25.6511 0.0898448 13.1978C-0.465589 10.5873 1.61173 8.1379 4.73327 7.70565"
                                                  fill="currentcolor"></path>
                                        </svg>
                                        Courses
                                    </span>
                                Now in One Place
                            </h2>
                        </div>
                        <p class="desc">Groove’s intuitive shared inbox makes it easy for team members to
                            organize, prioritize and.In this episode of the Smashing Pod we’re talking about Web
                            Platform Baseline.</p>
                        <ul class="about__info-list list-wrap">
                            <li class="about__info-list-item">
                                <i class="flaticon-angle-right"></i>
                                <p class="content">The Most World Class Instructors</p>
                            </li>
                            <li class="about__info-list-item">
                                <i class="flaticon-angle-right"></i>
                                <p class="content">Access Your Class anywhere</p>
                            </li>
                            <li class="about__info-list-item">
                                <i class="flaticon-angle-right"></i>
                                <p class="content">Flexible Course Plan</p>
                            </li>
                        </ul>
                        <div class="tg-button-wrap">
                            <a href="${pageContext.request.contextPath}/subject" class="btn arrow-btn">Start Free Trial <img
                                    src="${pageContext.request.contextPath}/view/user/assets/img/icons/right_arrow.svg" alt="img" class="injectable"></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- about-area-end -->

    <!-- features-area -->
    <section class="features__area">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-6">
                    <div class="section__title white-title text-center mb-50">
                        <span class="sub-title">How We Start Journey</span>
                        <h2 class="title">Start your Learning Journey Today!</h2>
                        <p>Groove’s intuitive shared inbox makesteam members together <br> organize, prioritize and.In
                            this episode.</p>
                    </div>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-xl-3 col-lg-4 col-md-6">
                    <div class="features__item">
                        <div class="features__icon">
                            <img src="${pageContext.request.contextPath}/view/user/assets/img/icons/features_icon01.svg" class="injectable" alt="img">
                        </div>
                        <div class="features__content">
                            <h4 class="title">Learn with Experts</h4>
                            <p>Curate anding area share Pluralsight content to reach your</p>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-4 col-md-6">
                    <div class="features__item">
                        <div class="features__icon">
                            <img src="${pageContext.request.contextPath}/view/user/assets/img/icons/features_icon02.svg" class="injectable" alt="img">
                        </div>
                        <div class="features__content">
                            <h4 class="title">Learn Anything</h4>
                            <p>Curate anding area share Pluralsight content to reach your</p>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-4 col-md-6">
                    <div class="features__item">
                        <div class="features__icon">
                            <img src="${pageContext.request.contextPath}/view/user/assets/img/icons/features_icon03.svg" class="injectable" alt="img">
                        </div>
                        <div class="features__content">
                            <h4 class="title">Get Online Certificate</h4>
                            <p>Curate anding area share Pluralsight content to reach your</p>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-4 col-md-6">
                    <div class="features__item">
                        <div class="features__icon">
                            <img src="${pageContext.request.contextPath}/view/user/assets/img/icons/features_icon04.svg" class="injectable" alt="img">
                        </div>
                        <div class="features__content">
                            <h4 class="title">E-mail Marketing</h4>
                            <p>Curate anding area share Pluralsight content to reach your</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- features-area-end -->

    <!-- instructor-area-two -->
    <section class="instructor__area-two">
        <div class="container">
            <div class="instructor__item-wrap-two">
                <div class="row">
                    <div class="col-xl-6">
                        <div class="instructor__item-two tg-svg">
                            <div class="instructor__thumb-two">
                                <img src="${pageContext.request.contextPath}/view/user/assets/img/instructor/instructor_two01.png" alt="img">
                                <div class="shape-one">
                                    <img src="${pageContext.request.contextPath}/view/user/assets/img/instructor/instructor_shape01.svg" alt="img"
                                         class="injectable">
                                </div>
                                <div class="shape-two">
                                    <span class="svg-icon" id="instructor-svg"
                                          data-svg-icon="${pageContext.request.contextPath}/view/user/assets/img/instructor/instructor_shape02.svg"></span>
                                </div>
                            </div>
                            <div class="instructor__content-two">
                                <h3 class="title"><a href="${pageContext.request.contextPath}/contact">Become a Instructor</a></h3>
                                <p>To take a trivial example, which of us undertakes physical exercise yes is this
                                    happen here.</p>
                                <div class="tg-button-wrap">
                                    <a href="${pageContext.request.contextPath}/contact" class="btn arrow-btn">Apply Now <img
                                            src="${pageContext.request.contextPath}/view/user/assets/img/icons/right_arrow.svg" alt="img" class="injectable"></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-6">
                        <div class="instructor__item-two tg-svg">
                            <div class="instructor__thumb-two">
                                <img src="${pageContext.request.contextPath}/view/user/assets/img/instructor/instructor_two02.png" alt="img">
                                <div class="shape-one">
                                    <img src="${pageContext.request.contextPath}/view/user/assets/img/instructor/instructor_shape01.svg" alt="img"
                                         class="injectable">
                                </div>
                                <div class="shape-two">
                                    <span class="svg-icon" id="instructor-svg-two"
                                          data-svg-icon="${pageContext.request.contextPath}/view/user/assets/img/instructor/instructor_shape02.svg"></span>
                                </div>
                            </div>
                            <div class="instructor__content-two">
                                <h3 class="title"><a href="contact.html">Become a Student</a></h3>
                                <p>Join millions of people from around the world learning together. Online learning.</p>
                                <div class="tg-button-wrap">
                                    <a href="contact.html" class="btn arrow-btn">Apply Now <img
                                            src="${pageContext.request.contextPath}/view/user/assets/img/icons/right_arrow.svg" alt="img" class="injectable"></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- instructor-area-two-end -->

    <!-- newsletter-area -->
    <section class="newsletter__area">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-4">
                    <div class="newsletter__img-wrap">
                        <img src="${pageContext.request.contextPath}/view/user/assets/img/others/newsletter_img.png" alt="img">
                        <img src="${pageContext.request.contextPath}/view/user/assets/img/others/newsletter_shape01.png" alt="img" data-aos="fade-up"
                             data-aos-delay="400">
                        <img src="${pageContext.request.contextPath}/view/user/assets/img/others/newsletter_shape02.png" alt="img" class="alltuchtopdown">
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="newsletter__content">
                        <h2 class="title">Want to stay <span>informed</span> about <br> new
                            <span>courses & study?</span></h2>
                        <div class="newsletter__form">
                            <form action="send-info" method="post">
                                <label>
                                    <input type="email" name="email" placeholder="Type your e-mail">
                                </label>
                                <button type="submit" class="btn">Subscribe Now</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="newsletter__shape">
            <img src="${pageContext.request.contextPath}/view/user/assets/img/others/newsletter_shape03.png" alt="img" data-aos="fade-left" data-aos-delay="400">
        </div>
    </section>
    <!-- newsletter-area-end -->



</main>
<!-- main-area-end -->
<%@include file="/view/user/parts/footer.jsp" %>
