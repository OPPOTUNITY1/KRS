<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, user-scalable=0"
    />

    <title>Dashboard</title>

    <link rel="shortcut icon" type="image/x-icon"
          href="${pageContext.request.contextPath}/view/user/assets/img/favicon.png">
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/view/user/assets/img/favicon.ico">

    <!-- Font family -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,400;0,500;0,700;0,900;1,400;1,500;1,700&display=swap"
          rel="stylesheet"/>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/dashboard/assets/css/bootstrap.min.css"/>

    <!-- Feather icon CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/dashboard/assets/plugins/feather/feather.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/dashboard/assets/css/feather.css">

    <!-- Pe7 CSS -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/view/dashboard/assets/plugins/icons/flags/flags.css"/>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/view/dashboard/assets/plugins/icons/pe7/pe-icon-7.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/view/dashboard/assets/plugins/icons/themify/themify.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/view/dashboard/assets/plugins/icons/weather/weathericons.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/view/dashboard/assets/plugins/icons/typicons/typicons.css">

    <!-- Datepicker CSS -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/view/dashboard/assets/css/bootstrap-datetimepicker.min.css">

    <!-- Fontawesome CSS -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/view/dashboard/assets/plugins/fontawesome/css/fontawesome.min.css"/>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/view/dashboard/assets/plugins/fontawesome/css/all.min.css"/>

    <!-- Ckeditor CSS-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/dashboard/assets/css/ckeditor.css">

    <!-- Datatables CSS -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/view/dashboard/assets/plugins/datatables/datatables.min.css">

    <!-- Calendar CSS -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/view/dashboard/assets/plugins/simple-calendar/simple-calendar.css">

    <!-- Full Calander CSS -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/view/dashboard/assets/plugins/fullcalendar/fullcalendar.min.css">

    <!-- Dragula CSS -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/view/dashboard/assets/plugins/dragula/css/dragula.min.css">

    <!-- Summernote CSS -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/view/dashboard/assets/plugins/summernote/summernote-bs4.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/view/dashboard/assets/plugins/summernote/summernote-lite.min.css">

    <!-- Sticky CSS -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/view/dashboard/assets/plugins/stickynote/sticky.css">

    <!-- Select CSS -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/view/dashboard/assets/plugins/select2/css/select2.min.css">

    <!-- Wizard CSS -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/view/dashboard/assets/plugins/twitter-bootstrap-wizard/form-wizard.css">

    <!-- Ionic CSS -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/view/dashboard/assets/plugins/icons/ionic/ionicons.css">

    <!-- Material CSS -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/view/dashboard/assets/plugins/material/materialdesignicons.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/view/dashboard/assets/plugins/simpleline/simple-line-icons.css">

    <!-- Lightbox CSS -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/view/dashboard/assets/plugins/lightbox/glightbox.min.css">

    <!-- Rangeslider CSS -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/view/dashboard/assets/plugins/ion-rangeslider/css/ion.rangeSlider.min.css">

    <!-- scroll CSS -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/view/dashboard/assets/plugins/scrollbar/scroll.min.css">

    <!-- Toatr CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/dashboard/assets/plugins//toastr/toatr.css">

    <!-- Main CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/dashboard/assets/css/style.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/dashboard/assets/plugins/c3-chart/c3.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/view/dashboard/assets/plugins/alertify/alertify.min.css">


    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/user/assets/plugins/summernote/summernote.min.css">
    <script src="${pageContext.request.contextPath}/view/user/assets/plugins/jquery-3.7.1.min.js"></script>

</head>

<body>
<!--    index-->
<!-- Main Wrapper -->
<div class="main-wrapper">
    <!-- Header -->
    <div class="header">
        <!-- Logo -->
        <div class="header-left">
            <a href="${pageContext.request.contextPath}/home" class="logo">
                <img src="${pageContext.request.contextPath}/view/user/assets/img/logo/logo.svg" alt="Logo">
            </a>
        </div>
        <!-- /Logo -->

        <div class="menu-toggle">
            <a href="javascript:void(0);" id="toggle_btn">
                <i class="fas fa-bars"></i>
            </a>
        </div>

        <!-- Mobile Menu Toggle -->
        <a class="mobile_btn" id="mobile_btn">
            <i class="fas fa-bars"></i>
        </a>
        <!-- /Mobile Menu Toggle -->

        <!-- Header Right Menu -->
        <ul class="nav user-menu">
            <!-- User Menu -->
            <li class="nav-item dropdown has-arrow new-user-menus">
                <a href="#" class="dropdown-toggle nav-link" data-bs-toggle="dropdown">
                    <div class="user-img">

                        <c:url value="/view/user/assets/img/users/${sessionScope.user.getAvatar()}" var="urlImg"/>
                        <c:if test="${sessionScope.user.getAvatar() == null}">
                            <c:set value="${pageContext.request.contextPath}/view/user/assets/img/users/default_img.png" var="urlImg"/>
                        </c:if>

                        <img
                                class="rounded-circle"
                                src="${urlImg}"
                                width="150"
                                alt="${sessionScope.user.getFullname()}"
                        />
                        <div class="user-text">
                            <h6>${sessionScope.user.getFullname()}</h6>
                            <p class="text-muted mb-0">${requestScope.userRole}</p>
                        </div>
                    </div>
                </a>
                <div class="dropdown-menu">
                    <div class="user-header">
                        <div class="avatar avatar-sm">
                            <img
                                    src="${urlImg}"
                                    alt="User Image"
                                    class="avatar-img rounded-circle"
                            />
                        </div>
                        <div class="user-text">
                            <h6>${sessionScope.user.getFullname()}</h6>
                            <p class="text-muted mb-0">${requestScope.userRole}</p>
                        </div>
                    </div>
                    <a
                            class="dropdown-item"
                            href="${pageContext.request.contextPath}/user-profile"
                            class=""
                    >My Profile</a
                    >
<%--                    <a class="dropdown-item" href="inbox.html">Inbox</a>--%>
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/logout">Logout</a>
                </div>
            </li>
            <!-- /User Menu -->
        </ul>
        <!-- /Header Right Menu -->
    </div>
    <!-- /Header -->
