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
                        <h3 class="title">Lesson Details</h3>
                        <nav class="breadcrumb">
                                <span property="itemListElement" typeof="ListItem">
                                    <a href="${pageContext.request.contextPath}/home">Home</a>
                                </span>
                            <span class="breadcrumb-separator"><i class="fas fa-angle-right"></i></span>
                            <span property="itemListElement" typeof="ListItem">
                                    <a href="${pageContext.request.contextPath}/subject">Subject</a>
                                </span>
                            <span class="breadcrumb-separator"><i class="fas fa-angle-right"></i></span>
                            <span property="itemListElement" typeof="ListItem"><a>${requestScope.subject.getSubject_name()}</a></span>
                            <span class="breadcrumb-separator"><i class="fas fa-angle-right"></i></span>
<%--                            <span property="itemListElement" typeof="ListItem"><a href="#">Lesson</a></span>--%>
<%--                            <span class="breadcrumb-separator"><i class="fas fa-angle-right"></i></span>--%>
                            <span property="itemListElement" typeof="ListItem">${requestScope.lesson.getTitle()}</span>
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

    <!-- blog-details-area -->
    <section class="blog-details-area section-py-120">
        <div class="container">
            <div class="row">
                <div class="col-xl-8 col-lg-7">
                    <div class="blog__details-wrapper">
                        <h3 class="title">Video about ${requestScope.lesson.getTitle()}</h3>
                        <br>
                        <div class="blog__details-wrapper col-12">
                            <div class="blog__details-thumb">
                                <iframe class="embed-responsive-item col-12"
                                        src="${requestScope.lesson.getVideo_url()}"
                                        allowfullscreen="" width="50"
                                        height="500">
                                </iframe>
                            </div>
                        </div>
                        <div class="blog__details-content">
                            <h3 class="title">Reference</h3>
<%--                            <h5 class="">How To Become idiculously Self-Aware In 20 Minutes</h5>--%>
<%--                            <p>Maximus ligula eleifend id nisl quis interdum. Sed malesuada tortor non turpis semper bibendum. Ut ac nisi porta, malesuada risus nonrra dolo areay Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae in tristique libero, quis ultrices diamraesent varius diam dui. Class aptent taciti sociosqu ad litora torquent per conubia nostra.Maximus ligula eleifend.</p>--%>
<%--                            <p>Maximus ligula eleifend id nisl quis interdum. Sed malesuada tortor non turpis semper bibendum. Ut ac nisi porta, malesuada risus nonrra dolo areay Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae in tristique libero, quis ultrices diamraesent varius diam dui. Class aptent taciti sociosqu ad litora torquent per conubia nostra.Maximus ligula eleifend.</p>--%>
                                ${requestScope.lesson.getContent()}
                        </div>
                    </div>
                </div>


                <div class="col-xl-4 col-lg-5">
                    <aside class="blog-sidebar">
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane show active fade" id="curriculum-tab-pane" role="tabpanel" aria-labelledby="curriculum-tab" tabindex="0">
                                <div class="courses__curriculum-wrap">
                                    <h3 class="title">Course Curriculum</h3>
                                    <div class="accordion" id="accordionExample">
                                        <c:set var="countLesson" value="1"/>
                                        <c:forEach varStatus="status" items="${requestScope.lessonMap.keySet()}" var="section_name">
                                            <div class="accordion-item">
                                                <h2 class="accordion-header" id="heading${status.index}">
                                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse${status.index}" aria-expanded="false" aria-controls="collapse${status.index}">
                                                        Part ${status.index + 1} : ${section_name.getTitle()}
                                                    </button>
                                                </h2>
                                                <div id="collapse${status.index}" class="accordion-collapse collapse" aria-labelledby="heading${status.index}" data-bs-parent="#accordionExample">
                                                    <div class="accordion-body">
                                                        <ul class="list-wrap">
                                                            <c:forEach var="lesson_item" items="${requestScope.lessonMap.get(section_name)}">
                                                                <li class="course-item open-item">
                                                                    <a href="${pageContext.request.contextPath}/subject/lesson/lesson-details?subject_id=${requestScope.subject_id}&lesson_id=${lesson_item.lesson_id}" class="course-item-link">
                                                                        <span class="item-name fw-bold">Lesson ${countLesson}: ${lesson_item.title}</span>
                                                                        <c:set var="countLesson" value="${countLesson + 1}"/>
                                                                    </a>
                                                                </li>
                                                            </c:forEach>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                                <br>
                                <div class="courses__curriculum-wrap">
                                    <h3 class="title">Practice</h3>
                                    <br>
                                    <div class="courses__details-enroll row">
                                        <div class="tg-button-wrap col-12">
                                            <a style="width: 100% !important;" href="#" class="btn btn-two arrow-btn">
                                                Exam
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </aside>
                </div>
            </div>
        </div>
    </section>
    <!-- blog-details-area-end -->

</main>
<!-- main-area-end -->

<%@include file="/view/user/parts/footer.jsp" %>
