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
            <h3 class="page-title">Add Setting</h3>
            <ul class="breadcrumb">
              <li class="breadcrumb-item"><a href="subjects">Setting</a></li>
              <li class="breadcrumb-item active">Add Study Set</li>
            </ul>
          </div>
        </div>
      </div>
      <!-- /Page Header -->

      <div class="row">
        <div class="col-sm-12">
          <div class="card">
            <div class="card-body">
              <form action="insert" method="POST" enctype="multipart/form-data">
                <div class="col">
                  <div class="col-12">
                    <h5 class="form-title"><span>Setting Information</span></h5><br>

                  </div>
                  <div style="margin-top:10px" class="col-12 col-sm-4">
                    <div class="input-block local-forms">
                      <select name="subject_id" class="form-select" required="">
                        <option selected disabled>Subject</option>
                        <c:forEach var="sbj" items="${subject_list}">
                          <option value="${sbj.subject_id}">${sbj.subject_name}</option>
                        </c:forEach>
                      </select>
                    </div>
                  </div>
                  <div class="col-12 col-sm-4">
                    <div class="input-block local-forms">
                      <input type="file" name="file" class="form-control" required="">
                    </div>
                  </div>
                  <!--                  <div class="col-12 col-sm-4">
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
                                    </div>-->
                  <h5 style="color: red;padding-bottom: 10px"><span>${addStatus}</span></h5>
                  <div class="col-12">
                    <div class="student-submit">
                      <button type="submit" class="btn btn-primary"> Save </button>
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
