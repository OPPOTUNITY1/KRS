<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="com.ews.krs.model.User" %>
<%@include file="/view/dashboard/parts/header.jsp" %>
<%@include file="/view/dashboard/parts/sidebar.jsp" %>
<div class="main-wrapper">
    <!-- Page Wrapper -->
    <div class="page-wrapper">
        <div class="content container-fluid">
            <div class="page-header">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="page-sub-header">
                            <h3 class="page-title">Student Details</h3>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="users">Student</a></li>
                                <li class="breadcrumb-item active">Student Details</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="about-info">
                                <h4>
                                    Profile
                                    <span
                                    ><a href="javascript:;"><i class="feather-more-vertical"></i></a
                                    ></span>
                                </h4>
                            </div>
                            <div class="user-profile-head">
                                <div class="profile-bg-img">
                                    <img src="${pageContext.request.contextPath}/view/dashboard/assets/img/profile-bg.jpg"
                                         alt="Profile"/>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4 col-md-4">
                                        <div class="profile-user-box">
                                            <div class="profile-user-img">
                                                <img src="${pageContext.request.contextPath}/view/dashboard/assets/img/profile-user.jpg"
                                                     alt="Profile"/>
                                                <div
                                                        class="input-block users-up-files profile-edit-icon mb-0"
                                                >
                                                    <div class="uplod d-flex">
                                                        <label class="file-upload profile-upbtn mb-0">
                                                            <i class="feather-edit-3"></i><input type="file"/>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="names-profiles">
                                                <h4>${userBID.fullname}</h4>
                                                <h5><c:choose>
                                                    <c:when test="${userBID.setting_id == '1'}">Admin</c:when>
                                                    <c:when test="${userBID.setting_id == '2'}">Manager</c:when>
                                                    <c:when test="${userBID.setting_id == '3'}">Teacher</c:when>
                                                    <c:when test="${userBID.setting_id == '4'}">Student</c:when>
                                                </c:choose></h5>
                                            </div>
                                        </div>
                                    </div>


                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="user-personals-grp">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="heading-detail">
                                            <h4>Personal Details :</h4>
                                        </div>
                                        <div class="personal-activity">
                                            <div class="personal-icons">
                                                <i class="feather-user"></i>
                                            </div>
                                            <div class="views-personal">
                                                <h4>Name</h4>
                                                <h5>${userBID.fullname}</h5>
                                            </div>
                                        </div>

                                        <div class="personal-activity">
                                            <div class="personal-icons">
                                                <i class="feather-phone-call"></i>
                                            </div>
                                            <div class="views-personal">
                                                <h4>Mobile</h4>
                                                <h5>${userBID.phone}</h5>
                                            </div>
                                        </div>
                                        <div class="personal-activity">
                                            <div class="personal-icons">
                                                <i class="feather-mail"></i>
                                            </div>
                                            <div class="views-personal">
                                                <h4>Email</h4>
                                                <h5>${userBID.email}</h5>
                                            </div>
                                        </div>
                                        <div class="personal-activity">
                                            <div class="personal-icons">
                                                <i class="feather-user"></i>
                                            </div>
                                            <div class="views-personal">
                                                <h4>Gender</h4>
                                                <h5><c:choose>
                                                    <c:when test="${userBID.gender == 'M'}">Male</c:when>
                                                    <c:when test="${userBID.gender == 'F'}">Female</c:when>
                                                </c:choose></h5>
                                            </div>
                                        </div>
                                        <div class="personal-activity">
                                            <div class="personal-icons">
                                                <i class="feather-calendar"></i>
                                            </div>
                                            <div class="views-personal">
                                                <h4>Date of Birth</h4>
                                                <h5><fmt:formatDate value="${userBID.dob}" pattern="dd-MM-yyyy"/></h5>
                                            </div>
                                        </div>


                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>
                </div>
            </div>
        </div>
<%@include file="/view/dashboard/parts/footer.jsp" %>