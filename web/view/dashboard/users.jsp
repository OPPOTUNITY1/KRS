<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="/view/dashboard/parts/header.jsp" %>
<%@ include file="/view/dashboard/parts/sidebar.jsp" %>
<div class="main-wrapper">
    <div class="page-wrapper">
        <div class="content container-fluid">
            <div class="page-header">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="page-sub-header">
                            <h3 class="page-title">Users</h3>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/users">User</a></li>
                                <li class="breadcrumb-item active">All Users</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <%-- Display success message if available --%>
            <c:if test="${not empty sessionScope.successMessage}">
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                        ${sessionScope.successMessage}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <%-- Clear the success message after displaying --%>
                <c:set var="successMessage" scope="session" value="" />
            </c:if>

            <%-- Display error message if available --%>
            <c:if test="${not empty sessionScope.errorMessage}">
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        ${sessionScope.errorMessage}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <%-- Clear the error message after displaying --%>
                <c:set var="errorMessage" scope="session" value="" />
            </c:if>

            <div class="user-group-form">

                <form id="searchForm" method="post" action="${pageContext.request.contextPath}/manager-user/search">
                    <div class="row">
                        <div class="col-lg-4 col-md-4">
                            <div class="input-block">
                                <input type="text" class="form-control" name="searchId" placeholder="Search by ID ..." />
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4">
                            <div class="input-block">
                                <input type="text" class="form-control" name="searchName" placeholder="Search by Name ..." />
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-3">
                            <div class="input-block">
                                <select class="form-select" name="searchRole" style="height: 46px;" onchange="submitForm()">
                                    <option value="">Select Role</option>
                                    <option value="Student">Student</option>
                                    <option value="Teacher">Teacher</option>
                                    <option value="Manager">Manager</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-1 col-md-1 text-center">
                            <div class="search-user-btn text-center">
                                <button type="submit" style="height: 46px;" class="btn btn-primary text-center">Search</button>
                            </div>
                        </div>
                    </div>
                </form>

            </div>

            <div class="row">
                <div class="col-sm-12">
                    <div class="card card-table comman-shadow">
                        <div class="card-body">

                            <div class="page-header">
                                <div class="row align-items-center">
                                    <div class="col">
                                        <h3 class="page-title">Users</h3>
                                    </div>
                                    <div class="col-auto text-end float-end ms-auto download-grp">
                                        <a href="${pageContext.request.contextPath}/add-user" class="btn btn-primary"><i class="fas fa-plus"></i></a>
                                    </div>
                                </div>
                            </div>

                            <div class="table-responsive">
                                <table class="table border-0 star-user table-hover table-center mb-0 table-striped">
                                    <thead class="user-thread">
                                    <tr>
                                        <th>
                                            <div class="form-check check-tables">
                                                <input class="form-check-input" type="checkbox" value="something" />
                                            </div>
                                        </th>
                                        <th>ID</th>
                                        <th>Name</th>
                                        <th>Role</th>
                                        <th>DOB</th>
                                        <th>Email</th>
                                        <th>Email Verified</th>
                                        <th class="text-end">Action</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="user" items="${requestScope.users}">
                                        <c:if test="${sessionScope.role.equalsIgnoreCase('admin')}">
                                            <tr>
                                                <td>
                                                    <div class="form-check check-tables">
                                                        <input class="form-check-input" type="checkbox" value="something" />
                                                    </div>
                                                </td>
                                                <td>${user.user_id}</td>
                                                <td>${user.fullname}</td>
                                                <td>${user.roleName}</td>
                                                <td><fmt:formatDate pattern="yyyy-MM-dd" value="${user.dob}" /></td>
                                                <td>${user.email}</td>
                                                <td>${user.getIsVerified_email() == 1 ? "Activated" : "Not activated"}</td>
                                                <td class="text-end">
                                                    <div class="actions">
                                                        <a href="${pageContext.request.contextPath}/manager-user/edit?uid=${user.user_id}" class="btn btn-sm bg-danger-light">
                                                            <i class="feather-edit"></i>
                                                        </a>
                                                        <button type="button" class="btn btn-sm bg-danger-light" onclick="confirmDelete(${user.user_id})">
                                                            <i class="feather-trash"></i>
                                                        </button>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:if>

                                        <c:if test="${sessionScope.role.equalsIgnoreCase('TEACHER') && user.roleName.equalsIgnoreCase('Student')}">
                                            <tr>
                                                <td>
                                                    <div class="form-check check-tables">
                                                        <input class="form-check-input" type="checkbox" value="something" />
                                                    </div>
                                                </td>
                                                <td>${user.user_id}</td>
                                                <td>${user.fullname}</td>
                                                <td>${user.roleName}</td>
                                                <td><fmt:formatDate pattern="yyyy-MM-dd" value="${user.dob}" /></td>
                                                <td>${user.email}</td>
                                                <td>${user.getIsVerified_email() == 1 ? "Activated" : "Not activated"}</td>
                                                <td class="text-end">
                                                    <div class="actions">
                                                        <a href="${pageContext.request.contextPath}/manager-user/edit?uid=${user.user_id}" class="btn btn-sm bg-danger-light">
                                                            <i class="feather-edit"></i>
                                                        </a>
                                                        <button type="button" class="btn btn-sm bg-danger-light" onclick="confirmDelete(${user.user_id})">
                                                            <i class="feather-trash"></i>
                                                        </button>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:if>
                                        <c:if test="${sessionScope.role.equalsIgnoreCase('MANAGER') && (user.roleName.equalsIgnoreCase('Student') || user.roleName.equalsIgnoreCase('Teacher'))}">

                                            <tr>
                                                <td>
                                                    <div class="form-check check-tables">
                                                        <input class="form-check-input" type="checkbox" value="something" />
                                                    </div>
                                                </td>
                                                <td>${user.user_id}</td>
                                                <td>${user.fullname}</td>
                                                <td>${user.roleName}</td>
                                                <td><fmt:formatDate pattern="yyyy-MM-dd" value="${user.dob}" /></td>
                                                <td>${user.email}</td>
                                                <td>${user.getIsVerified_email() == 1 ? "Activated" : "Not activated"}</td>
                                                <td class="text-end">
                                                    <div class="actions">
                                                        <a href="${pageContext.request.contextPath}/manager-user/edit?uid=${user.user_id}" class="btn btn-sm bg-danger-light">
                                                            <i class="feather-edit"></i>
                                                        </a>
                                                        <button type="button" class="btn btn-sm bg-danger-light" onclick="confirmDelete(${user.user_id})">
                                                            <i class="feather-trash"></i>
                                                        </button>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:if>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <c:set var="page" value="${requestScope.page}"/>
            <nav class="pagination__wrap mt-30">
                <ul class="pagination justify-content-center">
                    <li class="page-item ${page == 1 ? 'disabled' : ''}">
                        <a class="page-link" href="${pageContext.request.contextPath}/manager-user?page=${page - 1 == 0 ? 1 : page - 1}" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <c:forEach var="i" begin="1" end="${requestScope.numPage}" varStatus="loop">
                        <c:if test="${loop.index >= page - 1 && loop.index <= page + 1}">
                            <li class="page-item ${i == page ? 'active' : ''}">
                                <a class="page-link" href="${pageContext.request.contextPath}/manager-user?page=${i}">${i}</a>
                            </li>
                        </c:if>
                    </c:forEach>
                    <li class="page-item ${page == requestScope.numPage ? 'disabled' : ''}">
                        <a class="page-link" href="${pageContext.request.contextPath}/manager-user?page=${page == requestScope.numPage ? requestScope.numPage : page + 1}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>


<script type="text/javascript">
    function submitForm() {
        document.getElementById("searchForm").submit();
    }

    function confirmDelete(userId) {
        if (confirm('Are you sure you want to delete this user?')) {
            let form = document.createElement('form');
            form.method = 'post';
            form.action = '${pageContext.request.contextPath}/manager-user/delete';

            let input = document.createElement('input');
            input.type = 'hidden';
            input.name = 'user_id';
            input.value = userId;

            form.appendChild(input);
            document.body.appendChild(form);
            form.submit();
        }
    }
</script>
<%@ include file="/view/dashboard/parts/footer.jsp" %>