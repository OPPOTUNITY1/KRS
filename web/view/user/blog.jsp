<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/view/user/parts/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- main-area -->
<main class="main-area fix">
    <!-- breadcrumb-area -->
    <section class="breadcrumb__area breadcrumb__bg" data-background="${pageContext.request.contextPath}/view/user/assets/img/bg/breadcrumb_bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="breadcrumb__content">
                        <h3 class="title">Blogs</h3>
                        <nav class="breadcrumb">
                                <span property="itemListElement" typeof="ListItem">
                                    <a href="${pageContext.request.contextPath}/home">Home</a>
                                </span>
                            <span class="breadcrumb-separator"><i class="fas fa-angle-right"></i></span>
                            <span property="itemListElement" typeof="ListItem">Blogs</span>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <div class="breadcrumb__shape-wrap">
            <img src="${pageContext.request.contextPath}/view/user/assets/img/others/breadcrumb_shape01.svg" alt="img" class="alltuchtopdown">
            <img src="${pageContext.request.contextPath}/view/user/assets/img/others/breadcrumb_shape02.svg" alt="img" data-aos="fade-right" data-aos-delay="300">
            <img src="${pageContext.request.contextPath}/view/user/assets/img/others/breadcrumb_shape03.svg" alt="img" data-aos="fade-up" data-aos-delay="400">
            <img src="${pageContext.request.contextPath}/view/user/assets/img/others/breadcrumb_shape04.svg" alt="img" data-aos="fade-down-left" data-aos-delay="400">
            <img src="${pageContext.request.contextPath}/view/user/assets/img/others/breadcrumb_shape05.svg" alt="img" data-aos="fade-left" data-aos-delay="400">
        </div>
    </section>
    <!-- breadcrumb-area-end -->

    <!-- blog-area -->
    <section class="blog-area section-py-120">
        <div class="container">
            <div class="row">
                <div class="col-xl-9 col-lg-8">
                    <div class="row gutter-20">
                        <h3 class="text-center">${requestScope.postList.isEmpty() ? "Blog List Is Empty!" :""}</h3>

                        <c:forEach items="${requestScope.postList}" var="post">

                            <div class="col-xl-4 col-md-6">
                                <div class="blog__post-item shine__animate-item">

                                    <div class="blog__post-thumb">

                                        <a href="${pageContext.request.contextPath}/blog-detail?post_id=${post.getPost_id()}" class="shine__animate-link">
                                            <img src="${post.getThumbnail()}" alt="img">
                                        </a>

                                        <a href="#" class="post-tag">${requestScope.categoriesMap.get(post.getSetting_id())}</a>
                                    </div>

                                    <div class="blog__post-content">
                                        <div class="blog__post-meta">
                                            <ul class="list-wrap">
                                                <li><i class="flaticon-calendar"></i>${post.getCreated_at()}</li>
                                                <li><i class="flaticon-user-1"></i>by <a href="#">${requestScope.usersMap.get(post.getCreated_by())}</a></li>
                                            </ul>
                                        </div>
                                        <h4 class="title"><a href="${pageContext.request.contextPath}/blog-detail?post_id=${post.getPost_id()}">${post.getTitle()}</a></h4>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                    <c:set var="page" value="${requestScope.page}"/>
                    <nav class="pagination__wrap mt-30">
                        <ul class="list-wrap">
                            <li class="">
                                <a href="${pageContext.request.contextPath}/blog?page=${page - 1 == 0 ? 1 : page - 1}"><<</a>
                            </li>
                            <c:forEach var="i" begin="1" end="${requestScope.numPage}" varStatus="loop">
                                <c:if test="${loop.index >= page - 1 && loop.index <= page + 1}">
                                    <li class="${i == page ? 'active' : ''}">
                                        <a href="${pageContext.request.contextPath}/blog?page=${i}">${i}</a>
                                    </li>
                                </c:if>
                            </c:forEach>
                            <li class="">
                                <a href="${pageContext.request.contextPath}/blog?page=${page == requestScope.numPage ? requestScope.numPage  : page + 1}">>></a>
                            </li>
                        </ul>
                    </nav>



                </div>

                <div class="col-xl-3 col-lg-4">
                    <aside class="blog-sidebar">
                        <div class="blog-widget widget_search">
                            <div class="sidebar-search-form">

                                <form action="${pageContext.request.contextPath}/blog">
                                    <label>
                                        <input name="title" type="text" placeholder="Search here">
                                    </label>
                                    <button><i class="flaticon-search"></i></button>
                                </form>

                            </div>
                        </div>
                        <div class="blog-widget">
                            <h4 class="widget-title">Categories</h4>
                            <div class="shop-cat-list">
                                <ul class="list-wrap">
                                    <c:forEach items="${requestScope.categoriesMap.keySet()}" var="cate_id">
                                        <li>
                                            <a href="${pageContext.request.contextPath}/blog?cate_id=${cate_id}"><i class="flaticon-angle-right"></i>${requestScope.categoriesMap.get(cate_id)}</a>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                        <div class="blog-widget">
                            <h4 class="widget-title">Latest Post</h4>


                            <c:forEach items="${requestScope.listFourLatestPost}" var="post">

                                <div class="rc-post-item">
                                    <div class="rc-post-thumb">
                                        <a href="${pageContext.request.contextPath}/blog-detail?post_id=${post.getPost_id()}">
                                            <img style="object-fit: cover !important; object-position: center; width: 70px !important; height: 70px !important;"  class="img-fluid" src="${post.getThumbnail()}" alt="img">
                                        </a>
                                    </div>
                                    <div class="rc-post-content">
                                        <span class="date"><i class="flaticon-calendar"></i> ${post.getCreated_at()}</span>
                                        <h4 class="title"><a href="${pageContext.request.contextPath}/blog-detail?post_id=${post.getPost_id()}">${post.getTitle()}</a></h4>
                                    </div>
                                </div>

                            </c:forEach>

                        </div>
                    </aside>
                </div>
            </div>
        </div>
    </section>
    <!-- blog-area-end -->

</main>
<!-- main-area-end -->

<%@include file="/view/user/parts/footer.jsp" %>