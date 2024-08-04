<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/view/user/parts/header.jsp" %>

<!-- main-area -->
<main class="main-area fix">

  <!-- breadcrumb-area -->
  <div class="breadcrumb__area breadcrumb__bg breadcrumb__bg-two" data-background="${pageContext.request.contextPath}/view/user/assets/img/bg/breadcrumb_bg.jpg">
    <div class="container">
      <div class="row">
        <div class="col-12">
          <div class="breadcrumb__content">
            <h3 class="title">Subject Details</h3>
            <nav class="breadcrumb">
              <span property="itemListElement" typeof="ListItem">
                <a href="${pageContext.request.contextPath}/home">Home</a>
              </span>
              <span class="breadcrumb-separator"><i class="fas fa-angle-right"></i></span>
              <span property="itemListElement" typeof="ListItem">
                <a href="${pageContext.request.contextPath}/subject">Subject</a>
              </span>
              <span class="breadcrumb-separator"><i class="fas fa-angle-right"></i></span>
              <span property="itemListElement" typeof="ListItem">${requestScope.subject.getSubject_name()}</span>
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
  </div>
  <!-- breadcrumb-area-end -->

  <!-- courses-details-area -->
  <section class="courses__details-area section-py-120">
    <div class="container">
      <div class="row">
        <div class="col-xl-9 col-lg-8">
          <div class="courses__details-thumb">
            <c:url value="/view/user/assets/img/courses/${requestScope.subject.getThumbail()}" var="urlImg"/>
            <img style="width: 1000px !important;" src="${urlImg}" alt="img">
          </div>
          <div class="courses__details-content">
            <ul class="courses__item-meta list-wrap">
              <li class="courses__item-tag">
                <a href="#">${requestScope.subject.getCategoryName()}</a>
              </li>
              <li class="avg-rating"><i class="fas fa-star"></i> (${requestScope.subject.getRating()} Reviews)</li>
            </ul>
            <h2 class="title">${requestScope.subject.getSubject_name()}</h2>
            <div class="courses__details-meta">
              <ul class="list-wrap">
                <li class="author-two">
                  <c:url value="/view/user/assets/img/users/${requestScope.xUser.getAvatar()}" var="urlImg"/>
                  <c:if test="${sessionScope.user.getAvatar() == null}">
                    <c:set value="${pageContext.request.contextPath}/view/user/assets/img/users/default_img.png" var="urlImg"/>
                  </c:if>
                  <img style="width: 35px !important;" src="${urlImg}" alt="img">
                  By
                  <a href="#">${requestScope.subject.getTeacherName()}</a>
                </li>
                <li><i class="flaticon-mortarboard"></i>0 Students</li>
              </ul>
            </div>

            <ul class="nav nav-tabs" id="myTab" role="tablist">
              <li class="nav-item" role="presentation">
                <button class="nav-link active" id="overview-tab" data-bs-toggle="tab" data-bs-target="#overview-tab-pane" type="button" role="tab" aria-controls="overview-tab-pane" aria-selected="true">Overview</button>
              </li>
              <li class="nav-item" role="presentation">
                <button class="nav-link" id="curriculum-tab" data-bs-toggle="tab" data-bs-target="#curriculum-tab-pane" type="button" role="tab" aria-controls="curriculum-tab-pane" aria-selected="false">Curriculum</button>
              </li>
              <c:if test="${requestScope.material ne null}">
                <li class="nav-item">
                  <a href="${requestScope.material}" download="" class="nav-link">Download</a>
                </li>
              </c:if>
              <c:if test="${requestScope.studyset ne null}">
                <li class="nav-item">
                  <a href="${pageContext.request.contextPath}/studyset?id=${studyset.setId}" class="nav-link">Studyset</a>
                </li>
              </c:if>
            </ul>
            <div class="tab-content" id="myTabContent">
              <div class="tab-pane fade show active" id="overview-tab-pane" role="tabpanel" aria-labelledby="overview-tab" tabindex="0">
                <div class="courses__overview-wrap">
                  <p>${requestScope.subject.getDescription()}</p>
                </div>
              </div>
              <div class="tab-pane fade" id="curriculum-tab-pane" role="tabpanel" aria-labelledby="curriculum-tab" tabindex="0">
                <div class="courses__curriculum-wrap">
                  <h3 class="title">Course Curriculum</h3>
                  <c:if test="${requestScope.lessonMap.isEmpty()}">
                    <h5 class="alert-danger text-center">
                      <c:out value="List of empty curriculum!"/>
                    </h5>
                  </c:if>
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
              </div>
            </div>
          </div>
        </div>
        <div class="col-xl-3 col-lg-4">
          <div class="courses__details-sidebar">

            <div class="courses__information-wrap">
              <h5 class="title">Course includes:</h5>
              <ul class="list-wrap">
                <li>
                  <img src="${pageContext.request.contextPath}/view/user/assets/img/icons/course_icon03.svg" alt="img" class="injectable">
                  Lessons
                  <span>${requestScope.totalLessons}</span>
                </li>
                <li>
                  <img src="${pageContext.request.contextPath}/view/user/assets/img/icons/course_icon04.svg" alt="img" class="injectable">
                  Quizzes
                  <span>0</span>
                </li>

              </ul>
            </div>
            <div class="courses__details-enroll">
              <div class="tg-button-wrap">
                <a href="${pageContext.request.contextPath}/subject/lesson?subject_id=${requestScope.subject.getSubject_id()}" class="btn btn-two arrow-btn">
                  Start Now
                  <img src="${pageContext.request.contextPath}/view/user/assets/img/icons/right_arrow.svg" alt="img" class="injectable">
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- courses-details-area-end -->

</main>
<!-- main-area-end -->

<%@include file="/view/user/parts/footer.jsp" %>
