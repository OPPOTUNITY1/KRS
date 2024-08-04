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
                        <h3 class="page-title">Edit Subject</h3>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="subjects">Subject</a></li>
                            <li class="breadcrumb-item active">Edit Subject</li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- /Page Header -->

            <div class="row">
                <div class="col-sm-12">
                    <div class="card">
                        <div class="card-body">
                            <form action="update?subject_id=${requestScope.subjectId}" method="post">
                                <div class="row">
                                    <div class="col-12">
                                        <h5 class="form-title"><span>Subject Information</span></h5>
                                    </div>

                                    <div class="col-12 col-sm-12">
                                        <div class="input-block local-forms">
                                            <label for="subject_name">Subject Name <span class="login-danger">*</span></label>
                                            <input name="subject_name" value="${requestScope.subject.getSubject_name()}" id="subject_name" type="text" class="form-control"/>
                                        </div>
                                    </div>

                                    <div class="col-12 col-sm-12">
                                        <div class="input-block local-forms">
                                            <label for="rating">Rating<span class="login-danger"></span></label>
                                            <input id="rating" name="rating" type="text" value="${requestScope.subject.getRating()}" class="form-control"/>
                                        </div>
                                    </div>

                                    <div class="col-12 col-sm-12">
                                        <div class="input-block local-forms">
                                            <label for="category">Category <span class="login-danger">*</span></label>
                                            <select id="category" name="category" class="form-control">
                                                <c:forEach items="${requestScope.categoryMap.keySet()}" var="category_key">
                                                    <option ${requestScope.subject.getCategoryName().equalsIgnoreCase(requestScope.categoryMap[category_key]) ? 'selected="selected"' : ''} value="${category_key}">
                                                            ${requestScope.categoryMap[category_key]}
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>


                                    <hr>

                                    <div class="col-12 col-sm-12">
                                        <div class="input-block">
                                            <label class="col-form-label col-md-2 fw-bold">Thumbnails</label>
                                            <div class="col-md-10" style="width: 100% !important;">
                                                <input  type="file" class="form-control" name="fileImage" accept=".jpg, .png"  style="width: 100% !important;" onchange="readURL(this);" />
                                                <br>
                                                <c:if test="${!requestScope.requestScope.subject.getThumbail().isEmpty()}">
                                                    <c:url value="/view/user/assets/img/courses/${requestScope.subject.getThumbail()}" var="urlImg"/>
                                                    <img class="text-center" id="display_image" src="${urlImg}" alt="your image" />
                                                </c:if>

                                                <div class="text-center" style="width: 400px !important;">
                                                    <img class="text-center" id="blah" hidden="" src="" alt="your image" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-12 col-sm-12">
                                        <div class="col-md-12">
                                            <div class="card">
                                                <label  for="summernote"  class="col-form-label col-md-2 fw-bold">Description</label>
                                                <div class="card-body" style="padding: 0; width: 100% !important;">
                                                    <textarea name="description" style="width: 100% !important;" id="summernote">${requestScope.subject.getDescription()}</textarea>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="student-submit text-center">
                                            <button type="submit" style="width: 100%" class="btn btn-primary">Submit</button>
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
    <!-- /Page Wrapper -->
</div>
<!-- /Main Wrapper -->
<script>
    function readURL(input) {
        if (input.files && input.files[0]) {
            let reader = new FileReader();
            reader.onload = function (e) {
                let imgElement = document.getElementById('blah');
                let display_image = document.getElementById('display_image');

                if (display_image) {
                    display_image.hidden = true; // Hide the existing image
                }

                imgElement.setAttribute('src', e.target.result);
                imgElement.style.height = '350px';
                imgElement.removeAttribute('hidden'); // Remove the hidden attribute to make the new image visible
            };
            reader.readAsDataURL(input.files[0]);
        }
    }

</script>



<%@include file="/view/dashboard/parts/footer.jsp" %>
