<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@include file="/view/dashboard/parts/header.jsp" %>
<%@include file="/view/dashboard/parts/sidebar.jsp" %>

<div class="main-wrapper">


    <!-- Page Wrapper -->
    <div class="page-wrapper">
        <div class="content container-fluid">
            <!-- Page Header -->
            <div class="page-header">
                <div class="row align-items-center">
                    <div class="col">
                        <h3 class="page-title">Edit Setting</h3>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="subjects">Setting</a></li>
                            <li class="breadcrumb-item active">Edit Setting</li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- /Page Header -->

            <div class="row">
                <div class="col-sm-12">
                    <div class="card">
                        <div class="card-body">
                            <form action="update" method="POST">
                                <div class="row">
                                    <div class="col-12">
                                        <h5 class="form-title"><span>Setting Information</span></h5><br>
                                    </div>
                                    <input type="hidden" class="form-control" name="settingId" value="${settingId}"/>
                                    <div style="width: 15%;margin-top:10px" class="col-12 col-sm-4">
                                        <div class="input-block local-forms">
                                            <select name="settingType">
                                                <option selected disabled>Setting Type</option>
                                                <c:forEach var="type" items="${listSettingType}">
                                                    <option ${type==settingType? 'selected':''} value="${type}">${type}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="input-block local-forms">
                                            <label
                                            >Setting Name <span class="login-danger">*</span></label
                                            >
                                            <input type="text" class="form-control" name="settingName"  value="${settingName}"/>
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="input-block local-forms">
                                            <label>Setting Value <span class="login-danger">*</span></label>
                                            <input type="text" class="form-control" name="settingValue" value="${settingValue}"/>
                                        </div>
                                    </div>
                                        <h5 style="color: red;padding-bottom: 10px"><span>${editStatus}</span></h5>
                                    <div class="col-12">
                                        <div class="student-submit">
                                            <button type="submit" class="btn btn-primary">Submit</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<%@include file="/view/dashboard/parts/footer.jsp" %>
