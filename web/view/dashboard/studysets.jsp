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
            <h3 class="page-title">Subjects</h3>
            <ul class="breadcrumb">
              <li class="breadcrumb-item"><a href="index">Dashboard</a></li>
              <li class="breadcrumb-item active">Subjects</li>
            </ul>
          </div>
        </div>
      </div>
      <!-- /Page Header -->

      <div class="student-group-form">
        <div class="row">
          <form action="#" class="tgmenu__search-form row" method="POST" style="width: 100%">
            <div class="col-lg-10 col-md-8">
              <div class="input-block">
                <label for="searchSubjectValue"></label>
                <input autocomplete="off" style="width: 100%" type="text" id="searchSubjectValue" name="searchValue" class="form-control" placeholder="Search by Name ..."/>
                <div id="suggestions-popup-custom" style="background: white !important;">
                  <div id="suggestions-custom"></div>
                </div>
              </div>
            </div>
            <div class="col-lg-2 col-md-2">
              <div class="search-student-btn">
                <button type="submit" id="searchSubjectButton" style="width: 100%; margin-top: 23px !important;" class="btn btn-primary">Search</button>
              </div>
            </div>
          </form>
        </div>

        <div class="row">
          <div class="col-sm-12">
            <div class="card card-table">
              <div class="card-body">
                <!-- Page Header -->
                <div class="page-header">
                  <div class="row align-items-center">
                    <div class="col">
                      <h3 class="page-title">Subjects List</h3>
                    </div>
                    <div class="col-auto text-end float-end ms-auto download-grp">
                      <a href="${pageContext.request.contextPath}/studyset/new" class="btn btn-primary">
                        <i class="fas fa-plus"></i></a>
                    </div>
                  </div>
                </div>
                <!-- /Page Header -->

                <div class="col-12">
                  <div class="card top-selling overflow-auto">
                    <div class="card-body pb-0">
                      <table class="table table-borderless">
                        <thead>
                          <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Name</th>
                            <th scope="col">Manager</th>
                            <th scope="col">Category</th>
                            <th scope="col" class="text-center">Action</th>
                          </tr>
                        </thead>
                        <tbody>
                          <c:forEach varStatus="status" items="${requestScope.studysets}" var="studyset">
                            <tr>
                              <%--                                                    <th scope="row"><a href="#"><img src="assets/img/product-1.jpg" alt=""></a></th>--%>
                              <td>${subject.getSubject_id()}</td>
                              <td><a href="#" class="text-primary fw-bold">${subject.getSubject_name()}</a></td>
                              <td><a href="#" class="text-primary fw-bold">${subject.getTeacherName()}</a></td>
                              <td><a href="#" class="text-primary fw-bold">${subject.getCategoryName()}</a></td>
                              <td>
                                <div class="actions">
                                  <a href="${pageContext.request.contextPath}/subject-detail?subject_id=${subject.getSubject_id()}" class="btn btn-sm bg-success-light me-2">
                                    <i class="feather-eye"></i>
                                  </a>
                                  <a href="${pageContext.request.contextPath}/manager-subject/edit?subject_id=${subject.getSubject_id()}" class="btn btn-sm bg-danger-light">
                                    <i class="feather-edit"></i>
                                  </a>

                                  <a href = "${pageContext.request.contextPath}/manager-subject/delete?subject_id=${subject.getSubject_id()}" class="btn btn-sm bg-success-light me-2 alert-confirm-delete">
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
        <c:set var="page" value="${requestScope.page}"/>
        <nav class="pagination__wrap mt-30">
          <ul class="pagination justify-content-center">
            <li class="page-item ${page == 1 ? 'disabled' : ''}">
              <a class="page-link" href="${pageContext.request.contextPath}/manager-subject?page=${page - 1 == 0 ? 1 : page - 1}" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
              </a>
            </li>
            <c:forEach var="i" begin="1" end="${requestScope.numPage}" varStatus="loop">
              <c:if test="${loop.index >= page - 1 && loop.index <= page + 1}">
                <li class="page-item ${i == page ? 'active' : ''}">
                  <a class="page-link" href="${pageContext.request.contextPath}/manager-subject?page=${i}">${i}</a>
                </li>
              </c:if>
            </c:forEach>
            <li class="page-item ${page == requestScope.numPage ? 'disabled' : ''}">
              <a class="page-link" href="${pageContext.request.contextPath}/manager-subject?page=${page == requestScope.numPage ? requestScope.numPage : page + 1}" aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
              </a>
            </li>
          </ul>
        </nav>
      </div>
    </div>
  </div>

  <script>
    // Hàm hiển thị popup xác nhận
    function confirmDelete() {
      if (confirm("Are you sure delete it?")) {
        return true;
      } else {
        return false;
      }
    }

    const deleteButtons = document.querySelectorAll('.alert-confirm-delete');
    deleteButtons.forEach(button => {
      button.addEventListener('click', function (event) {
        event.preventDefault();
        if (confirmDelete()) {
          window.location.href = this.getAttribute('href');
        }
      });
    });
  </script>

  <%@include file="/view/dashboard/parts/footer.jsp" %>
