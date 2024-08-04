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
              <li class="breadcrumb-item active">Add Material</li>
            </ul>
          </div>
        </div>
      </div>
      <!-- /Page Header -->

      <div class="row">
        <div class="col-sm-12">
          <div class="card">
            <div class="card-body">
              <form action="/studyset/edit" method="POST">
                <div class="col">
                  <div class="col-12">
                    <h5 class="form-title"><span>Setting Information</span></h5><br>
                  </div>
                  <div class="col-12 col-sm-4">
                    <div class="input-block local-forms">
                      <input type="text" name="${studyset.name}" class="form-control" required="" placeholder="Studyset Name">
                    </div>
                  </div>

                  <div  class="col-12 col-sm-4">
                    <div class="input-block local-forms">
                      <select name="subject_id" class="form-select" required="">
                        <option selected disabled>Subject</option>
                        <c:forEach var="sbj" items="${subjects}">
                          <option value="${sbj.subject_id}">${studyset.subject_name}</option>
                        </c:forEach>
                      </select>
                    </div>
                  </div>
                  <div class="col-12 col-sm-4">
                    <div class="input-block local-forms">
                      <select name="user_id" class="form-select" required="">
                        <option selected disabled>User</option>
                        <c:forEach var="user" items="${users}">
                          <option value="${user.user_id}">${studyset.username}</option>
                        </c:forEach>
                      </select>
                    </div>
                  </div>
                  <div class="col-12">
                    <div class="student-submit">
                      <button type="submit" class="btn btn-primary"> Submit </button>
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
