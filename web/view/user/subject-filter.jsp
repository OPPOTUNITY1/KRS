<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@include file="/view/user/parts/header.jsp" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.ews.krs.model.Subject" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>


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
                                    <form id="filterForm" method="POST" action="#">
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
                            <h4 class="widget-title">Instructors</h4>
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
<%--                        <div class="courses-widget">--%>
<%--                            <h4 class="widget-title">Ratings</h4>--%>
<%--                            <div class="courses-rating-list">--%>
<%--                                <form id="ratingsForm" action="#" method="POST">--%>
<%--                                    <ul class="list-wrap">--%>
<%--                                        <%--%>
<%--                                            Map<Integer, List<Subject>> ratingCountsMap = (Map<Integer, List<Subject>>) request.getAttribute("ratingCountsMap");--%>
<%--                                        %>--%>
<%--                                        <% for (int i = 5; i >= 1; i--) { %>--%>
<%--                                        <li>--%>
<%--                                            <div class="form-check">--%>
<%--                                                <label>--%>
<%--                                                    <input class="form-check-input rating-checkbox" type="checkbox" name="ratings" value="<%= i %>">--%>
<%--                                                </label>--%>
<%--                                                <div class="rating">--%>
<%--                                                    <ul class="list-wrap">--%>
<%--                                                        <% for (int j = 1; j <= 5; j++) { %>--%>
<%--                                                        <li class="<%= j > i ? "delete" : "" %>">--%>
<%--                                                            <i class="fas fa-star"></i>--%>
<%--                                                        </li>--%>
<%--                                                        <% } %>--%>
<%--                                                    </ul>--%>
<%--                                                    <span>(<%=ratingCountsMap.get(i).size() %>)</span>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </li>--%>
<%--                                        <% } %>--%>
<%--                                    </ul>--%>
<%--                                </form>--%>
<%--                            </div>--%>
<%--                        </div>--%>
                    </aside>
                </div>
                <div class="col-xl-9 col-lg-8">
                    <div class="courses-top-wrap courses-top-wrap">
                        <div class="row align-items-center">
                            <div class="col-md-5">
                                <div class="courses-top-left">
                                    <p>Showing ${requestScope.subjectList.size()} total results</p>
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
                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active" id="grid" role="tabpanel" aria-labelledby="grid-tab">
                            <div id="productList" class="row courses__grid-wrap row-cols-1 row-cols-xl-3 row-cols-lg-2 row-cols-md-2 row-cols-sm-1">
                                <c:if test="${!requestScope.subjectListPage.isEmpty()}">
                                    <c:forEach items="${requestScope.subjectListPage}" var="subject">
                                        <c:url value="/view/user/assets/img/courses/${subject.getThumbail()}" var="urlImg"/>
                                        <div class="col">
                                            <div class="courses__item shine__animate-item">
                                                <div class="courses__item-thumb">
                                                    <a href="${pageContext.request.contextPath}/subject-detail"
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
                                                            href="${pageContext.request.contextPath}/subject-detail">${subject.getSubject_name()}</a>
                                                    </h5>
                                                    <p class="author">By <a href="#">${subject.getTeacherName()}</a></p>
                                                    <div class="courses__item-bottom">
                                                        <div class="button">
                                                            <a href="${pageContext.request.contextPath}/subject-detail">
                                                                <span class="text">Enroll Now</span>
                                                                <i class="flaticon-arrow-right"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </c:if>
                            </div>

                            <c:set var="page" value="${requestScope.page}"/>
                            <nav class="pagination__wrap mt-30">
                                <ul class="list-wrap">
                                    <li class="">
                                        <a href="${pageContext.request.contextPath}/subject/filterSubject?page=${page - 1 == 0 ? 1 : page - 1}"><<</a>
                                    </li>
                                    <c:forEach var="i" begin="1" end="${requestScope.numPage}" varStatus="loop">
                                        <c:if test="${loop.index >= page - 1 && loop.index <= page + 1}">
                                            <li class="${i == page ? 'active' : ''}">
                                                <a href="${pageContext.request.contextPath}/subject/filterSubject?page=${i}">${i}</a>
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
<!-- main-area-end -->

<script>
    document.addEventListener("DOMContentLoaded", function() {

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

    function getAllURLParams(url) {
        let queryString = url ? url.split('?')[1] : window.location.search.slice(1);
        let params = {};
        if (queryString) {
            queryString = queryString.split('#')[0];
            let arr = queryString.split('&');

            arr.forEach(function (item) {
                let param = item.split('=');
                let paramName = param[0];
                if (paramName === 'page') {
                    params[paramName] = param[1];
                } else {
                    if (!params[paramName]) {
                        params[paramName] = [];
                    }
                    params[paramName].push(param[1]);
                }
            });
        }
        return params;
    }

    let currentURLParams = getAllURLParams();

    let paginationLinks = document.querySelectorAll('.pagination__wrap a');

    paginationLinks.forEach(function(link) {
        link.addEventListener('click', function(event) {
            let pageUrl = new URL(link.href);

            Object.keys(currentURLParams).forEach(function(key) {
                if (key === 'page') {
                    let pageValue = new URL(link.href).searchParams.get('page');
                    pageUrl.searchParams.set(key, pageValue);
                } else {
                    currentURLParams[key].forEach(function(value) {
                        pageUrl.searchParams.append(key, value);
                    });
                }
            });

            link.href = pageUrl.href;
        });
    });

    document.addEventListener("DOMContentLoaded", function() {
        var form = document.querySelector('.tgmenu__search-form');
        form.action = "filterSubject";
        form.addEventListener('submit', function(event) {
            event.preventDefault();
            localStorage.clear();
            this.submit();
        });
    });

</script>


<%@include file="/view/user/parts/footer.jsp" %>
