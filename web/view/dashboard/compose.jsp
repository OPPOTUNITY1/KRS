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
                <div class="row">
                    <div class="col">
                        <h3 class="page-title">Compose</h3>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index">Dashboard</a></li>
                            <li class="breadcrumb-item active">Compose</li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- /Page Header -->

            <div class="row">
                <div class="col-lg-3 col-md-4">
                    <ul class="inbox-menu">
                        <li class="active">
                            <a href="#"
                            ><i class="fas fa-download"></i> Inbox
                                <span class="mail-count">(5)</span></a
                            >
                        </li>
                        <li>
                            <a href="#"><i class="far fa-star"></i> Important</a>
                        </li>
                        <li>
                            <a href="#"><i class="far fa-paper-plane"></i> Sent Mail</a>
                        </li>
                        <li>
                            <a href="#"
                            ><i class="far fa-file-alt"></i> Drafts
                                <span class="mail-count">(13)</span></a
                            >
                        </li>
                        <li>
                            <a href="#"><i class="far fa-trash-alt"></i> Trash</a>
                        </li>
                    </ul>
                </div>
                <div class="col-lg-9 col-md-8">
                    <div class="card">
                        <div class="card-body">
                            <form action="inbox">
                                <div class="input-block">
                                    <input type="email" placeholder="To" class="form-control" />
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="input-block">
                                            <input type="email" placeholder="Cc" class="form-control" />
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="input-block">
                                            <input type="email" placeholder="Bcc" class="form-control" />
                                        </div>
                                    </div>
                                </div>
                                <div class="input-block">
                                    <input type="text" placeholder="Subject" class="form-control" />
                                </div>
                                <div class="input-block">
              <textarea
                      rows="4"
                      class="form-control summernote"
                      placeholder="Enter your message here"
              ></textarea>
                                </div>
                                <div class="input-block mb-0">
                                    <div class="text-center">
                                        <button class="btn btn-primary">
                                            <i class="fas fa-paper-plane m-r-5"></i> <span>Send</span>
                                        </button>
                                        <button class="btn btn-success m-l-5" type="button">
                                            <i class="far fa-save m-r-5"></i> <span>Draft</span>
                                        </button>
                                        <button class="btn btn-danger m-l-5" type="button">
                                            <i class="far fa-trash-alt m-r-5"></i><span>Delete</span>
                                        </button>
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