<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@include file="/view/dashboard/parts/header.jsp" %>
<%@include file="/view/dashboard/parts/sidebar.jsp" %>

<div class="main-wrapper">
    <!-- Page Wrapper -->
    <div class="page-wrapper">
        <div class="content container-fluid">

            <!-- Blog List -->
            <div class="row">
                <div class="col-md-9">
                </div>
                <div class="col-md-3 text-md-end">
                    <a href="${pageContext.request.contextPath}/add-post" class="btn btn-primary btn-blog mb-3"><i
                            class="feather-plus-circle me-1"></i>
                        Add New</a>
                </div>
            </div>

            <div class="row">
                <c:forEach items="${requestScope.postList}" var="post">
                    <div class="col-md-6 col-xl-4 col-sm-12 d-flex">
                        <div class="blog grid-blog flex-fill">
                            <div class="blog-image">
                                <a href="${pageContext.request.contextPath}/post-details?id=${post.id}">
                                    <img class="img-fluid" src="${post.thumbnail}" alt="${post.title}">
                                </a>
                                <div class="blog-views">
                                    <i class="feather-eye me-1"></i> 225
                                </div>
                            </div>

                            <div class="blog-content">
                                <ul class="entry-meta meta-item">
                                    <li>
                                        <div class="post-author">
                                            <a href="profile">
                                                <img src="${pageContext.request.contextPath}/view/dashboard/assets/img/profiles/avatar-01.jpg"
                                                     alt="Post Author">
                                                <span>
                                                  <span class="post-title">Vincent</span>
                                                  <span class="post-date"><i class="far fa-clock"></i>  4 Dec 2022</span>
                                                </span>
                                            </a>
                                        </div>
                                    </li>
                                </ul>
                                <h3 class="blog-title"><a
                                        href="${pageContext.request.contextPath}/post-details?id=${post.id}">${post.title}</a>
                                </h3>
                                <p>${post.content}</p>
                            </div>
                            <div class="row">
                                <div class="edit-options">
                                    <div class="edit-delete-btn">
                                        <!--                    <a href="${pageContext.request.contextPath}/edit-post" class="text-success"><i class="feather-edit-3 me-1"></i>
                      Edit</a>
                    <a href="${pageContext.request.contextPath}/delete-post" class="text-danger" data-bs-toggle="modal"
                       data-bs-target="#deleteModal"><i class="feather-trash-2 me-1"></i> Delete</a>-->
                                    </div>

                                    <div class="status-toggle">
                                        <input id="rating_4" class="check" type="checkbox" checked>
                                        <label for="rating_4"
                                               class="checktoggle checkbox-bg">checkbox</label><span>Active</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <!-- Pagination -->
            <div class="row ">
                <div class="col-md-12">
                    <div class="pagination-tab  d-flex justify-content-center">
                        <ul class="pagination mb-0">
                            <li class="page-item disabled">
                                <a class="page-link" href="#" tabindex="-1"><i class="feather-chevron-left mr-2"></i>Previous</a>
                            </li>
                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                            <li class="page-item active">
                                <a class="page-link" href="#">2 <span class="sr-only">(current)</span></a>
                            </li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item"><a class="page-link" href="#">4</a></li>
                            <li class="page-item">
                                <a class="page-link" href="#">Next<i class="feather-chevron-right ml-2"></i></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- /Pagination -->
        </div>
        <!-- Modal -->
        <div class="modal fade contentmodal" id="deleteModal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content doctor-profile">
                    <div class="modal-header pb-0 border-bottom-0  justify-content-end">
                        <button type="button" class="close-btn" data-bs-dismiss="modal" aria-label="Close"><i
                                class="feather-x-circle"></i></button>
                    </div>
                    <div class="modal-body pt-0">
                        <div class="delete-wrap text-center">
                            <div class="del-icon"><i class="feather-x-circle"></i></div>
                            <h2>Sure you want to delete</h2>
                            <div class="submit-section">
                                <a href="pending-blog" class="btn btn-success me-2">Yes</a>
                                <a href="#" class="btn btn-danger" data-bs-dismiss="modal">No</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /Modal -->


    </div>
    <!-- /Page Wrapper -->
</div>
<!-- /Main Wrapper -->


<%@include file="/view/dashboard/parts/footer.jsp" %>
