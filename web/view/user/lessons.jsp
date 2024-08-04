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
                        <h3 class="title">Lesson List</h3>
                        <nav class="breadcrumb">
                                <span property="itemListElement" typeof="ListItem">
                                    <a href="${pageContext.request.contextPath}/home">Home</a>
                                </span>
                            <span class="breadcrumb-separator"><i class="fas fa-angle-right"></i></span>
                            <span property="itemListElement" typeof="ListItem">
                                    <a href="${pageContext.request.contextPath}/subject">Subject</a>
                            </span>
                            <span class="breadcrumb-separator"><i class="fas fa-angle-right"></i></span>
                            <span property="itemListElement" typeof="ListItem"><a href="#">${requestScope.subject.getSubject_name()}</a></span>
                            <span class="breadcrumb-separator"><i class="fas fa-angle-right"></i></span>
                            <span property="itemListElement" typeof="ListItem">Lesson</span>

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
    <script>
        $(document).ready(function () {
            let timeoutId;
            $("#searchLessonValue").on("input", function () {
                let searchValue = $(this).val().trim();
                clearTimeout(timeoutId);

                if (searchValue.length > 0) {
                    timeoutId = setTimeout(function () {
                        $.ajax({
                            url: 'getLessonSuggestions',
                            type: 'GET',
                            data: { searchValue: searchValue },
                            success: function (data) {
                                displaySuggestions(data);
                            },
                            error: function (xhr, status, error) {
                                console.error("Error: " + error);
                            }
                        });
                    }, 300);
                } else {
                    hideSuggestions();
                }
            });

            function displaySuggestions(data) {
                $("#suggestions-custom").empty();

                if (data.length > 0) {
                    let ul = $('<ul class="suggestions-list"></ul>');

                    data.forEach(function (item) {
                        let li = $('<li class="suggestion-item">' + item + '</li>');
                        li.on('click', function () {
                            $('#searchLessonValue').val(item);
                            hideSuggestions();
                        });
                        ul.append(li);
                    });

                    $("#suggestions-custom").append(ul);
                    showSuggestions();
                } else {
                    hideSuggestions();
                }
            }

            function showSuggestions() {
                let inputOffset = $("#searchLessonValue").offset();
                let inputHeight = $("#searchLessonValue").outerHeight();

                $("#suggestions-popup-custom").css({
                    top: inputOffset.top + inputHeight + "px",
                    left: inputOffset.left + "px",
                    marginTop: 5 + "px",
                    width: 450 + "px",
                    borderTop:  1+ "px " + "solid" + " #ccc",
                    borderRadius: 10+"px",
                    display: 'block'
                });
                $(".suggestions-list").css({
                    marginBottom: 0 + "px",
                    padding: 0 + "px"
                });
            }

            function hideSuggestions() {
                $("#suggestions-popup-custom").hide();
            }

            $(document).on('click', function (e) {
                if (!$(e.target).closest('#suggestions-popup-custom').length && !$(e.target).is('#searchSubjectValue')) {
                    hideSuggestions();
                }
            });
        });
    </script>
    <!-- all-courses -->
    <section class="all-courses-area section-py-120">
        <div class="container">
            <div class="row">
                <div class=" col-md-12 tgmenu__search d-none d-md-block" style="margin-right: 0;margin-bottom: 30px;">
                    <form action="#" class="tgmenu__search-form" method="GET" style="width: 100%">
                        <div class="input-grp">
                            <label style="width: 100%">
                                <input autocomplete="off" style="width: 100%" type="text" id="searchLessonValue" name="searchLessonValue" placeholder="Search For Lesson . . .">
                            </label>
                            <button id="searchLessonButton" type="submit"><i class="flaticon-search"></i></button>
                        </div>

                        <label>
                            <input type="text" name="subject_id" value="${requestScope.subject_id}" hidden="">
                        </label>

                        <div id="suggestions-popup-custom">
                            <div id="suggestions-custom"></div>
                        </div>
                    </form>
                </div>
                <div class="col-xl-12 col-lg-11">
                    <c:if test="${requestScope.lessonMap.isEmpty()}">
                        <h5 class="alert-danger text-center">
                            <c:out value="${requestScope.alertLessonMap}"/>
                        </h5>
                    </c:if>
                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active" id="list" role="tabpanel" aria-labelledby="list-tab">
                            <div class="row courses__list-wrap row-cols-1">
                                <c:if test="${!requestScope.isSearchLesson.equals('search_lesson_true')}">
                                    <c:set var="countLesson" value="1"/>
                                    <c:forEach varStatus="status" items="${requestScope.lessonMap.keySet()}" var="section_name">
                                        <h4>Part ${status.index + 1} : ${section_name.getTitle()}</h4>
                                        <hr>
                                        <c:forEach var="lesson_item" items="${requestScope.lessonMap.get(section_name)}">
                                            <div class="col-6">
                                                <div class="courses__item courses__item-three shine__animate-item" style="height: 148px !important;">
                                                    <div class="courses__item-content">
                                                        <h5 class="title">
                                                            <a href="${pageContext.request.contextPath}/subject/lesson/lesson-details?subject_id=${requestScope.subject_id}&lesson_id=${lesson_item.getLesson_id()}">Lesson ${countLesson}: ${lesson_item.getTitle()}</a>
                                                        </h5>
                                                        <p class="info"><span class="fw-bold">Description:</span> ${lesson_item.getDescription()}</p>
                                                        <c:set var="countLesson" value="${countLesson + 1}"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </c:forEach>
                                </c:if>
                            </div>

                            <c:if test="${requestScope.isSearchLesson.equals('search_lesson_true')}">
                                <c:set var="countLesson" value="1"/>
                                <c:forEach var="lesson_item" items="${requestScope.lessonsSearch}">
                                    <div class="col-6">
                                        <div class="courses__item courses__item-three shine__animate-item" style="height: 148px !important;">
                                            <div class="courses__item-content">
                                                <h5 class="title">
                                                    <a href="${pageContext.request.contextPath}/subject/lesson/lesson-details?subject_id=${requestScope.subject_id}&lesson_id=${lesson_item.getLesson_id()}">Lesson ${countLesson}: ${lesson_item.getTitle()}</a>
                                                </h5>
                                                <p class="info"><span class="fw-bold">Description:</span> ${lesson_item.getDescription()}</p>
                                                <c:set var="countLesson" value="${countLesson + 1}"/>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:if>

<%--                            <nav class="pagination__wrap mt-30">--%>
<%--                                <ul class="list-wrap">--%>
<%--                                    <li class="active"><a href="#">1</a></li>--%>
<%--                                    <li><a href="courses.html">2</a></li>--%>
<%--                                    <li><a href="courses.html">3</a></li>--%>
<%--                                    <li><a href="courses.html">4</a></li>--%>
<%--                                </ul>--%>
<%--                            </nav>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- all-courses-end -->

</main>
<!-- main-area-end -->

<%@include file="/view/user/parts/footer.jsp" %>
