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
                        <h3 class="page-title">Add Lesson</h3>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="lessons">Lesson</a></li>
                            <li class="breadcrumb-item active">Add Lesson</li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- /Page Header -->

            <div class="row">
                <div class="col-sm-12">
                    <div class="card">
                        <div class="card-body">
                            <form action="insert" method="post">
                                <div class="row">
                                    <div class="col-12">
                                        <h5 class="form-title"><span>Lesson Information</span></h5>
                                    </div>

                                    <div class="col-12 col-sm-12">
                                        <div class="input-block local-forms">
                                            <label for="lesson_title">Title <span class="login-danger">*</span></label>
                                            <input name="lesson_title" id="lesson_title" type="text" class="form-control"/>
                                        </div>
                                    </div>

                                    <div class="col-12 col-sm-12">
                                        <div class="input-block local-forms">
                                            <label for="video_url">Video URL<span class="login-danger"></span></label>
                                            <input id="video_url" name="video_url" type="text" value="" class="form-control"/>
                                        </div>
                                    </div>

                                    <div class="col-12 col-sm-12">
                                        <div class="input-block local-forms">
                                            <label for="description">Description<span class="login-danger"></span></label>
                                            <input id="description" name="description" type="text" value="" class="form-control"/>
                                        </div>
                                    </div>

                                    <div class="col-12 col-sm-12">
                                        <div class="input-block local-forms">
                                            <label for="subject">Subject<span class="login-danger">*</span></label>
                                            <select id="subject" name="subject" class="form-control">
                                                <c:forEach items="${requestScope.subjects}" var="subject">
                                                    <option value="${subject.getSubject_id()}">${subject.getSubject_name()}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-12 col-sm-12">
                                        <label for="isPartTitle">Is Part Title</label>
                                        <input type="checkbox" id="isPartTitle" value="on" name="isPartTitle" class="form-check-input">
                                    </div>


                                    <div class="col-12 col-sm-12">
                                        <div class="input-block local-forms">
                                            <label for="part_title">Part Title<span class="login-danger">*</span></label>
                                            <select id="part_title" name="part_title" class="form-control">
                                                <c:forEach items="${requestScope.lessons}" var="lesson">
                                                    <c:if test="${lesson.parent_id == 0}">
                                                        <option value="${lesson.lesson_id}">${lesson.title}</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>


                                    <hr>

                                    <div class="col-12 col-sm-12">
                                        <div class="col-md-12">
                                            <div class="card">
                                                <label for="summernote" class="col-form-label col-md-2 fw-bold">Content</label>
                                                <div class="card-body" style="padding: 0">
                                                    <textarea name="content" id="summernote"></textarea>
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
</div>

<script>
    function readURL(input) {
        if (input.files && input.files[0]) {
            let reader = new FileReader();
            reader.onload = function (e) {
                let imgElement = document.getElementById('blah');
                imgElement.setAttribute('src', e.target.result);
                imgElement.style.height = '350px';
                imgElement.removeAttribute('hidden'); // Remove the hidden attribute to make the image visible
            };
            reader.readAsDataURL(input.files[0]);
        }
    }
</script>
<%@include file="/view/dashboard/parts/footer.jsp" %>
