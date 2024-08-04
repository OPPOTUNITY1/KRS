<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Online Courses & Education</title>
    <meta name="description" content="SkillGro - Online Courses & Education Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/view/user/assets/img/favicon.png">
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/view/user/assets/img/favicon.ico">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/user/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/user/assets/css/animate.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/user/assets/css/magnific-popup.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/user/assets/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/user/assets/css/flaticon-skillgro.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/user/assets/css/swiper-bundle.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/user/assets/css/default-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/user/assets/css/select2.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/user/assets/css/odometer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/user/assets/css/aos.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/user/assets/css/spacing.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/user/assets/css/tg-cursor.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/user/assets/css/main.css">
    <link href="${pageContext.request.contextPath}/view/user/assets/other/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/view/user/assets/other/style.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/view/user/assets/plugins/jquery-3.7.1.min.js"></script>

    <style>
        #suggestions-popup {
            position: absolute;
            width: calc(100% - 2px);
            max-height: 200px;
            overflow-y: auto;
            background-color: white;
            border: 1px solid #ccc;
            border-top: none;
            z-index: 1000;
            display: none;
        }

        #suggestions-popup-custom {
            position: absolute;
            width: calc(100% - 2px);
            max-height: 200px;
            overflow-y: auto;
            background-color: white;
            border: 1px solid #ccc;
            border-top: none;
            z-index: 1000;
            display: none;
        }

        .suggestion-item {
            padding: 10px;
            cursor: pointer;
            list-style-type: none;
        }

        .suggestion-item:hover {
            background-color: #f1f1f1;
        }
    </style>
</head>

<body>

<!--Preloader-->
<div id="preloader">
    <div id="loader" class="loader">
        <div class="loader-container">
            <div class="loader-icon"><img src="${pageContext.request.contextPath}/view/user/assets/img/logo/preloader.svg" alt="Preloader"></div>
        </div>
    </div>
</div>
<!--Preloader-end -->

<!-- Scroll-top -->
<button class="scroll__top scroll-to-target" data-target="html">
    <i class="tg-flaticon-arrowhead-up"></i>
</button>
<!-- Scroll-top-end-->

<!-- header-area -->
<header>
    <div id="header-fixed-height"></div>
    <div id="sticky-header" class="tg-header__area">
        <div class="container custom-container">
            <div class="row">
                <div class="col-12">
                    <div class="tgmenu__wrap">
                        <nav class="tgmenu__nav">
                            <div class="logo">
                                <a href="${pageContext.request.contextPath}/home">
                                <img src="${pageContext.request.contextPath}/view/user/assets/img/logo/logo.svg" alt="Logo"></a>
                            </div>

                            <div class="tgmenu__navbar-wrap tgmenu__main-menu d-none d-xl-flex">
                                <ul class="navigation">
                                    <li class=""><a href="${pageContext.request.contextPath}/home">Home</a></li>
                                    <li class=""><a href="${pageContext.request.contextPath}/subject">Subject</a></li>
                                    <li class=""><a href="${pageContext.request.contextPath}/blog">Blog</a></li>
                                    <li class=""><a href="${pageContext.request.contextPath}/contact">Contact</a></li>
<%--                                    <li class=""><a href="${pageContext.request.contextPath}/about">Class</a></li>--%>
                                    <li class=""><a href="${pageContext.request.contextPath}/studyset">Studyset</a></li>
                                    <c:choose>
                                        <c:when test="${sessionScope.user.getRoleName() != null && (sessionScope.user.getRoleName().equalsIgnoreCase('admin') || sessionScope.user.getRoleName().equalsIgnoreCase('teacher') || sessionScope.user.getRoleName().equalsIgnoreCase('manager'))}">
<%--                                            <li class=""><a href="${pageContext.request.contextPath}/dashboard/${sessionScope.user.getRoleName()}">Dashboard</a></li>--%>
                                            <li class=""><a href="${pageContext.request.contextPath}/dashboard/${sessionScope.user.getRoleName()}">Dashboard</a></li>
                                        </c:when>
                                    </c:choose>
                                </ul>
                            </div>

                            <script>
                                $(document).ready(function () {
                                    let timeoutId;

                                    $("#searchValue").on("input", function () {
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
                                        $("#suggestions").empty();

                                        if (data.length > 0) {
                                            let ul = $('<ul class="suggestions-list"></ul>');

                                            data.forEach(function (item) {
                                                let li = $('<li class="suggestion-item">' + item.subject_name + '</li>');
                                                li.on('click', function () {
                                                    $('#searchValue').val(item.subject_name);
                                                    hideSuggestions();
                                                });
                                                ul.append(li);
                                            });

                                            $("#suggestions").append(ul);
                                            showSuggestions();
                                        } else {
                                            hideSuggestions();
                                        }
                                    }

                                    function showSuggestions() {
                                        let inputOffset = $("#searchValue").offset();
                                        let inputHeight = $("#searchValue").outerHeight();

                                        $("#suggestions-popup").css({
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
                                        $("#suggestions-popup").hide();
                                    }

                                    $(document).on('click', function (e) {
                                        if (!$(e.target).closest('#suggestions-popup').length && !$(e.target).is('#searchValue')) {
                                            hideSuggestions();
                                        }
                                    });
                                });
                            </script>

                            <div class="tgmenu__search d-none d-md-block">
                                <form action="subject" class="tgmenu__search-form" method="GET">
                                    <div class="input-grp">
                                        <label style="width: 100%;">
                                            <input autocomplete="off" style="width: 100%;" type="text" id="searchValue" name="searchValue" placeholder="Search For Course . . .">
                                        </label>
                                        <button id="searchButton" type="submit"><i class="flaticon-search"></i></button>
                                    </div>
                                </form>
                                <div id="suggestions-popup">
                                    <div id="suggestions"></div>
                                </div>
                            </div>

                            <div class="tgmenu__action">
                                <ul class="list-wrap text-dark fw-bolder">
                                    <c:choose>
                                        <c:when test="${sessionScope.user == null}">
                                            <li class="header-btn login-btn">
                                                <a href="${pageContext.request.contextPath}/login">Log in</a>
                                            </li>
                                            <li class="header-btn login-btn">
                                                <a href="${pageContext.request.contextPath}/register">Sign up</a>
                                            </li>
                                        </c:when>

                                        <c:when test="${sessionScope.user != null}">
                                            <nav class="header-nav ms-auto">
                                                <ul class="d-flex align-items-center">
                                                    <li class="nav-item dropdown pe-3">
                                                        <c:url value="/view/user/assets/img/users/${sessionScope.user.getAvatar()}" var="urlImg"/>
                                                        <c:if test="${sessionScope.user.getAvatar() == null}">
                                                            <c:set value="${pageContext.request.contextPath}/view/user/assets/img/users/default_img.png" var="urlImg"/>
                                                        </c:if>

                                                        <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
                                                            <img style="object-fit: cover !important; object-position: center; width: 36px !important; height: 36px !important;" src="${urlImg}" alt="Profile" class="rounded-circle">
                                                            <span class="d-none d-md-block dropdown-toggle ps-2">${sessionScope.user.getFullname()}</span>
                                                        </a>
                                                        <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
                                                            <li class="dropdown-header">
                                                                <h6>${sessionScope.user.getFullname()}</h6>
                                                                <span>${requestScope.userRole}</span>
                                                            </li>
                                                            <li>
                                                                <hr class="dropdown-divider">
                                                            </li>

                                                            <li>
                                                                <a class="dropdown-item d-flex align-items-center" href="${pageContext.request.contextPath}/user-profile">
                                                                    <i class="bi bi-person"></i>
                                                                    <span>My Profile</span>
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <hr class="dropdown-divider">
                                                            </li>

                                                            <li>
                                                                <a class="dropdown-item d-flex align-items-center" href="${pageContext.request.contextPath}/logout">
                                                                    <i class="bi bi-box-arrow-right"></i>
                                                                    <span>Log Out</span>
                                                                </a>
                                                            </li>
                                                        </ul><!-- End Profile Dropdown Items -->
                                                    </li><!-- End Profile Nav -->
                                                </ul>
                                            </nav><!-- End Icons Navigation -->
                                        </c:when>
                                    </c:choose>
                                </ul>
                            </div>
                            <div class="mobile-nav-toggler"><i class="tg-flaticon-menu-1"></i></div>
                        </nav>
                    </div>
                    <!-- Mobile Menu  -->
                    <div class="tgmobile__menu">
                        <nav class="tgmobile__menu-box">
                            <div class="close-btn"><i class="tg-flaticon-close-1"></i></div>
                            <div class="nav-logo">
                                <a href="${pageContext.request.contextPath}/home"><img src="${pageContext.request.contextPath}/view/user/assets/img/logo/logo.svg" alt="Logo"></a>
                            </div>
                            <div class="tgmobile__search">
                                <form action="subject" method="GET">
                                    <label style="width: 100%;">
                                        <input autocomplete="on"  style="width: 100%;" type="text" id="" name="searchValue" placeholder="Search For Course . . .">
                                    </label>
                                    <button><i class="fas fa-search"></i></button>
                                </form>
                            </div>

                            <div class="social-links">
                                <ul class="list-wrap">
                                    <li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
                                    <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                                    <li><a href="#"><i class="fab fa-instagram"></i></a></li>
                                    <li><a href="#"><i class="fab fa-linkedin-in"></i></a></li>
                                    <li><a href="#"><i class="fab fa-youtube"></i></a></li>
                                </ul>
                            </div>
                        </nav>
                    </div>
                    <div class="tgmobile__menu-backdrop"></div>
                    <!-- End Mobile Menu -->
                </div>
            </div>
        </div>
    </div>
</header>
<!-- header-area-end -->


<script>
    document.addEventListener("DOMContentLoaded", function () {
        const navigationLinks = document.querySelectorAll('.navigation li a');
        navigationLinks.forEach(function (link) {
            if (link.href === window.location.href) {
                link.parentElement.classList.add('active');
            }
        });
    });

    document.addEventListener("DOMContentLoaded", function() {
        let form = document.querySelector('.tgmenu__search-form');
        form.action = "subject";
        form.addEventListener('submit', function(event) {
            event.preventDefault();
            localStorage.clear();
            this.submit();
        });
    });

</script>



