<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@include file="/view/dashboard/parts/header.jsp" %>
<%@include file="/view/dashboard/parts/sidebar.jsp" %>

<div class="main-wrapper">


    <!-- Page Wrapper -->
    <div class="page-wrapper">
        <div class="content container-fluid">
            <div class="row">
                <div class="col-xl-12">
                    <!-- Page Header -->
                    <div class="page-header">
                        <div class="row">
                            <div class="col-sm-12">
                                <h3 class="page-title">Edit Post</h3>
                            </div>
                        </div>
                    </div>
                    <!-- /Page Header -->

                    <form action="update?post_id=${requestScope.post.getPost_id()}" method="post" enctype="multipart/form-data">

                        <div class="card">
                            <div class="card-body">
                                <div class="bank-inner-details container-fluid">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12">
                                            <div class="input-block">
                                                <label>Title<span class="text-danger">*</span></label>
                                                <input type="text" value="${requestScope.post != null ? requestScope.post.getTitle() :""}" class="form-control" name="title" required=""/>
                                            </div>
                                        </div>
                                        <c:set var="cate_id" value="${requestScope.post.getSetting_id()}"/>
                                        <div class="col-12 col-sm-12">
                                            <div class="input-block">
                                                <label for="category">Category <span class="login-danger">*</span></label>
                                                <select id="category" name="category" class="form-control">
                                                    <c:forEach items="${requestScope.categoryMap.keySet()}" var="category_key">
                                                        <option  value="${category_key}" ${cate_id==category_key? 'selected' : ''}>${requestScope.categoryMap[category_key]}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="col-lg-12 col-md-12">
                                            <div class="input-block">
                                                <label>Thumbnail<span class="text-danger">*</span></label>
                                                <input class="form-control" type="file" id="imageUpload"
                                                       name="thumbnail" accept="image/*" required="">
                                            </div>
                                        </div>

                                        <div class="col-lg-12 col-md-12">
                                            <div class="input-block">
                                                <label for="summernote"
                                                       class="col-form-label col-md-2 fw-bold">Content</label>
                                                <div class="card-body" style="padding: 0">
                                                    <textarea class="form-control" name="content" rows="3"
                                                              id="summernote">${requestScope.post != null ? requestScope.post.getContent() :""}</textarea>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="blog-categories-btn pt-0 text-center">
                                <div class="bank-details-btn">
                                    <button type="submit" class="btn bank-cancel-btn me-2 text-center">Edit Post</button>
                                </div>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </div>

    </div>
    <!-- /Page Wrapper -->
</div>
<!-- /Main Wrapper -->

<%@include file="/view/dashboard/parts/footer.jsp" %>