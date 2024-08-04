<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@include file="/view/user/parts/header.jsp" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.ews.krs.model.Subject" %>
<%@ page import="java.util.List" %>


<!-- main-area -->
<main class="main-area fix">

    <!-- breadcrumb-area -->
    <section class="breadcrumb__area breadcrumb__bg"
             data-background="${pageContext.request.contextPath}/view/user/assets/img/bg/breadcrumb_bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="breadcrumb__content">
                        <h3 class="title">All Courses</h3>
                        <nav class="breadcrumb">
                                <span property="itemListElement" typeof="ListItem">
                                    <a href="${pageContext.request.contextPath}/home">Home</a>
                                </span>
                            <span class="breadcrumb-separator"><i class="fas fa-angle-right"></i></span>
                            <span property="itemListElement" typeof="ListItem">Courses</span>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <div class="breadcrumb__shape-wrap">
            <img src="${pageContext.request.contextPath}/view/user/assets/img/others/breadcrumb_shape01.svg" alt="img"
                 class="alltuchtopdown">
            <img src="${pageContext.request.contextPath}/view/user/assets/img/others/breadcrumb_shape02.svg" alt="img"
                 data-aos="fade-right" data-aos-delay="300">
            <img src="${pageContext.request.contextPath}/view/user/assets/img/others/breadcrumb_shape03.svg" alt="img"
                 data-aos="fade-up" data-aos-delay="400">
            <img src="${pageContext.request.contextPath}/view/user/assets/img/others/breadcrumb_shape04.svg" alt="img"
                 data-aos="fade-down-left" data-aos-delay="400">
            <img src="${pageContext.request.contextPath}/view/user/assets/img/others/breadcrumb_shape05.svg" alt="img"
                 data-aos="fade-left" data-aos-delay="400">
        </div>
    </section>
    <!-- breadcrumb-area-end -->

    <!-- all-courses -->
    <section class="all-courses-area section-py-120">
        <div class="container">
            <div class="row">
                <div class="col-xl-3 col-lg-4 order-2 order-lg-0">
                    <aside class="courses__sidebar">
                        <div class="courses-widget">
                            <h4 class="widget-title">Categories</h4>
                            <div class="courses-cat-list">
                                <ul class="list-wrap">
                                    <form id="filterForm" method="POST" action="subject">
                                        <c:forEach var="categoriesSubject" items="${requestScope.categoriesSubjectMap.keySet()}">
                                            <c:if test="${requestScope.categoriesSubjectMap.get(categoriesSubject).size() != 0}">
                                                <li>
                                                    <div class="form-check">
                                                        <input class="form-check-input category-checkbox" name="category" type="checkbox" value="${categoriesSubject.getSetting_value()}" id="cate-${categoriesSubject.getSetting_value()}">
                                                        <label class="form-check-label" for="cate-${categoriesSubject.getSetting_value()}">${categoriesSubject.getSetting_value()} (${requestScope.categoriesSubjectMap.get(categoriesSubject).size()})</label>
                                                    </div>
                                                </li>
                                            </c:if>
                                        </c:forEach>
                                    </form>
                                </ul>
                            </div>
                        </div>

                        <div class="courses-widget">
                            <h4 class="widget-title">Managers</h4>
                            <div class="courses-cat-list">
                                <ul class="list-wrap">
                                    <c:forEach var="teacher" items="${requestScope.teacherSubjectMap.keySet()}">
                                        <li>
                                            <div class="form-check">
                                                <input class="form-check-input teacher-checkbox" name="teacher" type="checkbox" value="${teacher.getUser_id()}" id="teacher-${teacher.getUser_id()}">
                                                <label class="form-check-label" for="teacher-${teacher.getUser_id()}">${teacher.getFullname()} (${requestScope.teacherSubjectMap.get(teacher).size()})</label>
                                            </div>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                    </aside>
                </div>

                <script>
                    $(document).ready(function () {
                        let timeoutId;

                        $("#searchSubjectValue").on("input", function () {
                            let searchValue = $(this).val().trim();
                            clearTimeout(timeoutId);

                            if (searchValue.length > 0) {
                                timeoutId = setTimeout(function () {
                                    $.ajax({
                                        url: 'getSuggestions',
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
                                    let li = $('<li class="suggestion-item">' + item.subject_name + '</li>');
                                    li.on('click', function () {
                                        $('#searchSubjectValue').val(item.subject_name);
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
                            let inputOffset = $("#searchSubjectValue").offset();
                            let inputHeight = $("#searchSubjectValue").outerHeight();

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

                <div class="col-xl-9 col-lg-8">
                    <div class=" col-md-12 tgmenu__search d-none d-md-block" style="margin-right: 0;margin-bottom: 30px;">
                        <form action="#" class="tgmenu__search-form" method="GET" style="width: 100%">
                            <div class="input-grp">
                                <label style="width: 100%">
                                    <input autocomplete="off" style="width: 100%" type="text" id="searchSubjectValue" name="searchValue" placeholder="Search For Course . . .">
                                </label>
                                <button id="searchSubjectButton" type="submit"><i class="flaticon-search"></i></button>
                            </div>
                            <div id="suggestions-popup-custom">
                                <div id="suggestions-custom"></div>
                            </div>
                        </form>
                    </div>
                    <div class="courses-top-wrap courses-top-wrap">
                        <div class="row align-items-center">
                            <div class="col-md-5">
                                <div class="courses-top-left">
                                    <p>Showing ${requestScope.subjectList.size() != null ? requestScope.subjectList.size() : 0 } total results</p>
                                </div>
                            </div>

                            <div class="col-md-7">
                                <div class="d-flex justify-content-center justify-content-md-end align-items-center flex-wrap">
                                    <div class="courses-top-right m-0 ms-md-auto">
                                        <span class="sort-by">Sort By:</span>
                                        <label for="orderBy"></label>
                                        <div class="courses-top-right-select">
                                            <form id="orderByForm" action="subject" method="POST">
                                                <select id="orderBy" name="orderBy" class="orderBy">
                                                    <option value="AtoZ" ${param.get("orderBy").equals("AtoZ") ? "selected" : ""}>Order A - Z</option>
                                                    <option value="ZtoA" ${param.get("orderBy").equals("ZtoA") ? "selected" : ""}>Order Z - A</option>
                                                    <option value="rating" ${param.get("orderBy").equals("rating") ? "selected" : ""}>Order Rating DESC</option>
                                                </select>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <c:if test="${requestScope.subjectList.isEmpty()}">
                        <h5 class="alert-danger text-center">
                            <c:out value="${requestScope.alertSubjectList}"/>
                        </h5>
                    </c:if>
                    <c:if test="${requestScope.subjectListPage == null}">
                        <h5 class="alert-danger text-center">
                            <c:out value="No subject is found!"/>
                        </h5>
                    </c:if>

                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active" id="grid" role="tabpanel" aria-labelledby="grid-tab">
                            <div id="productList" class="row courses__grid-wrap row-cols-1 row-cols-xl-3 row-cols-lg-2 row-cols-md-2 row-cols-sm-1">
                                <c:forEach items="${requestScope.subjectListPage}" var="subject">
                                    <c:url value="/view/user/assets/img/courses/${subject.getThumbail()}" var="urlImg"/>
                                    <div class="col">
                                        <div class="courses__item shine__animate-item">
                                            <div class="courses__item-thumb">
                                                <a href="${pageContext.request.contextPath}/subject-detail?subject_id=${subject.getSubject_id()}"
                                                   class="shine__animate-link">
                                                    <img src="${urlImg}" alt="img">
                                                </a>
                                            </div>
                                            <div class="courses__item-content">
                                                <ul class="courses__item-meta list-wrap">
                                                    <li class="courses__item-tag">
                                                        <a href="#">${subject.getCategoryName()}</a>
                                                    </li>
                                                    <li class="avg-rating"><i class="fas fa-star"></i>
                                                        (${subject.getRating()} Reviews)
                                                    </li>
                                                </ul>
                                                <h5 class="title"><a
                                                        href="${pageContext.request.contextPath}/subject-detail?subject_id=${subject.getSubject_id()}">${subject.getSubject_name()}</a>
                                                </h5>
                                                <p class="author">By <a href="#">${subject.getTeacherName()}</a></p>
                                                <div class="courses__item-bottom">
                                                    <div class="button">
                                                        <a href="${pageContext.request.contextPath}/subject-detail?subject_id=${subject.getSubject_id()}">
                                                            <span class="text">See Details</span>
                                                            <i class="flaticon-arrow-right"></i>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>

                            </div>

                            <c:if test="">

                            </c:if>

                            <c:set var="page" value="${requestScope.page}"/>
                            <nav class="pagination__wrap mt-30">
                                <ul class="list-wrap">
                                    <li class="">
                                        <a href="${pageContext.request.contextPath}/subject?page=${page - 1 == 0 ? 1 : page - 1}"><<</a>
                                    </li>
                                    <c:forEach var="i" begin="1" end="${requestScope.numPage}" varStatus="loop">
                                        <c:if test="${loop.index >= page - 1 && loop.index <= page + 1}">
                                            <li class="${i == page ? 'active' : ''}">
                                                <a href="${pageContext.request.contextPath}/subject?page=${i}">${i}</a>
                                            </li>
                                        </c:if>
                                    </c:forEach>
                                    <li class="">
                                        <a href="${pageContext.request.contextPath}/subject?page=${page == requestScope.numPage ? requestScope.numPage  : page + 1}">>></a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- all-courses-end -->

</main>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        // Check and clear localStorage if this is the first visit
        // if (!localStorage.getItem('firstVisit')) {
        localStorage.clear();
        //     localStorage.setItem('firstVisit', 'true');
        // }

        let categoryCheckboxes = document.querySelectorAll('.category-checkbox');
        let teacherCheckboxes = document.querySelectorAll('.teacher-checkbox');

        function addCheckboxListeners(checkboxes, saveStateFunction) {
            checkboxes.forEach(function(checkbox) {
                checkbox.addEventListener('change', function() {
                    saveStateFunction();
                    reloadProducts();
                });
            });
        }

        addCheckboxListeners(categoryCheckboxes, saveCategoryCheckedState);
        addCheckboxListeners(teacherCheckboxes, saveTeacherCheckedState);

        function saveCheckedState(checkboxes, storageKey) {
            let checkedValues = [];
            checkboxes.forEach(function(checkbox) {
                if (checkbox.checked) {
                    checkedValues.push(checkbox.value);
                }
            });
            localStorage.setItem(storageKey, JSON.stringify(checkedValues));
        }

        function saveCategoryCheckedState() {
            saveCheckedState(categoryCheckboxes, 'checkedCategories');
        }

        function saveTeacherCheckedState() {
            saveCheckedState(teacherCheckboxes, 'checkedTeachers');
        }

        function restoreCheckedState(checkboxes, storageKey) {
            let checkedValues = JSON.parse(localStorage.getItem(storageKey));
            if (checkedValues) {
                checkedValues.forEach(function(value) {
                    let checkbox = document.querySelector('input[value="' + value + '"]');
                    if (checkbox) {
                        checkbox.checked = true;
                    }
                });
            }
        }

        restoreCheckedState(categoryCheckboxes, 'checkedCategories');
        restoreCheckedState(teacherCheckboxes, 'checkedTeachers');

        function reloadProducts() {
            let checkedCategoryCheckboxes = document.querySelectorAll('.category-checkbox:checked');
            let checkedTeacherCheckboxes = document.querySelectorAll('.teacher-checkbox:checked');

            let params = new URLSearchParams();

            if (checkedCategoryCheckboxes.length > 0) {
                checkedCategoryCheckboxes.forEach(function(checkbox) {
                    params.append('categories', checkbox.value);
                });
            }

            if (checkedTeacherCheckboxes.length > 0) {
                checkedTeacherCheckboxes.forEach(function(checkbox) {
                    params.append('teachers', checkbox.value);
                });
            }

            let url = "${pageContext.request.contextPath}/subject";
            if (params.toString()) {
                url += '/filterSubject?' + params.toString();
            }
            window.location.href = url;
        }
    });

    document.addEventListener("DOMContentLoaded", function() {
        // Get the select element
        const orderBySelect = document.getElementById('orderBy');

        // Add event listener to update URL when selection changes
        orderBySelect.addEventListener('change', function() {
            // Get the selected value
            const selectedValue = this.value;

            // Update the URL with selected value
            updateURL(selectedValue);
        });

        // Function to update URL with selected value
        function updateURL(selectedValue) {
            // Get the current URL
            let url = new URL(window.location.href);

            // Update or add the "orderBy" parameter with selected value
            url.searchParams.set('orderBy', selectedValue);

            // Redirect to the updated URL
            window.location.href = url.toString();
        }

        // Function to pre-select the option based on the URL parameter
        function preSelectOption() {
            // Get the current URL
            let url = new URL(window.location.href);

            // Get the value of the "orderBy" parameter from the URL
            const orderByParam = url.searchParams.get('orderBy');

            // If orderByParam exists and matches one of the options, select it
            if (orderByParam && document.querySelector(`option[value="${requestScope.orderByParam}"]`)) {
                orderBySelect.value = orderByParam;
            }
        }

        // Call preSelectOption function to pre-select the option when the page loads
        preSelectOption();
    });

</script>



<%@include file="/view/user/parts/footer.jsp" %>
