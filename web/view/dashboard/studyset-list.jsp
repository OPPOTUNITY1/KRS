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
            <h3 class="page-title">Material List</h3>
            <ul class="breadcrumb">
              <li class="breadcrumb-item"><a href="index">Dashboard</a></li>
              <li class="breadcrumb-item active">Material List</li>
            </ul>
          </div>
        </div>
      </div>
      <!-- /Page Header -->

      <div class="row">
        <div class="col-sm-12">
          <div class="card card-table">
            <div class="card-body">
              <!-- Page Header -->
              <div class="page-header">
                <div class="row align-items-center">
                  <div class="col">
                    <h3 class="page-title">Material</h3>

                  </div>
                  <div class="col-auto text-end float-end ms-auto download-grp">

                    <a href="${pageContext.request.contextPath}/studyset/new" class="btn btn-primary"
                       ><i class="fas fa-plus"></i
                      ></a>
                  </div>
                </div>
              </div>
              <!-- /Page Header -->
              <div class="table-responsive">
                <table class="table border-0 star-student table-hover table-center mb-0 datatable table-striped">
                  <thead class="student-thread">
                    <tr>
                      <th>ID</th>
                      <th>Name</th>
                      <th>Subject</th>
                      <th>User</th>
                      <th>Action</th>
                      <!--<th class="text-end">Action</th>-->
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach var="item" items="${studysets}">
                      <tr id="file${item.setId}">
                        <td>${item.setId}</td>
                        <td>${item.setName}</td>
                        <td>${subjects[item.subjectId].subject_name}</td>
                        <td>${users[item.userId].username}</td>
                        <%--<td class="text-end">
                          <div class="actions">
                            <a href="${pageContext.request.contextPath}/studyset/delete?id=${item.id}" onclick="return confirm('Are you sure you want to delete this item?');" class="btn btn-sm bg-danger-light">
                              <i class="feather-delete"></i>
                            </a>
                          </div>
                        </td>--%>
                        <td class="text-end">
                          <div class="actions">
                            <a href="${pageContext.request.contextPath}/studyset/new?id=${item.setId}" class="btn btn-sm bg-danger-light">
                              <i class="feather-edit"></i>
                            </a>
                            <a href="${pageContext.request.contextPath}/studyset/delete?id=${item.setId}" onclick="return confirm('Are you sure you want to delete this item?');" class="btn btn-sm bg-danger-light">
                              <i class="feather-delete"></i>
                            </a>
                          </div>
                        </td>
                      </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

  </div>
</div>

<%@include file="/view/dashboard/parts/footer.jsp" %>