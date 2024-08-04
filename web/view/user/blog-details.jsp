<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@include file="/view/user/parts/header.jsp" %>

<!-- main-area -->
<main class="main-area fix">

    <!-- breadcrumb-area -->
    <section class="breadcrumb__area breadcrumb__bg" data-background="assets/img/bg/breadcrumb_bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="breadcrumb__content">
                        <h3 class="title">Blog Details</h3>
                        <nav class="breadcrumb">
                                <span property="itemListElement" typeof="ListItem">
                                    <a href="${pageContext.request.contextPath}/home">Home</a>
                                </span>
                            <span class="breadcrumb-separator"><i class="fas fa-angle-right"></i></span>
                            <span property="itemListElement" typeof="ListItem">
                                    <a href="${pageContext.request.contextPath}/blog">Blogs</a>
                                </span>
                            <span class="breadcrumb-separator"><i class="fas fa-angle-right"></i></span>
                            <span property="itemListElement" typeof="ListItem">${requestScope.post.getTitle()}</span>
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

    <!-- blog-details-area -->
    <section class="blog-details-area section-py-120">
        <div class="container">
            <div class="row">
                <div class="col-xl-9 col-lg-8">
                    <div class="blog__details-wrapper">
                        <div class="blog__details-content">
                            <div class="blog__post-meta">
                                <ul class="list-wrap">
                                    <li><i class="flaticon-calendar"></i> ${requestScope.post.getCreated_at()}</li>
                                    <li><i class="flaticon-user-1"></i> by <a href="#">${requestScope.usersMap.get(requestScope.post.getCreated_by())}</a></li>
                                </ul>
                            </div>
                            <h3 class="title">${requestScope.post.getTitle()}</h3>
                            <span>
                                ${requestScope.post.getContent()}
                            </span>
                            </div>
                            <p>Maximus ligula eleifend id nisl quis interdum. Sed malesuada tortor non turpis semper bibendum. Ut ac nisi porta, malesuada risus nonrra dolo areay Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae in tristique libero, quis ultrices diamraesent varius diam dui. Class aptent taciti sociosqu ad litora torquent per conubia nostra.Maximus ligula eleifend id nisl quis interdum. Sed malesuada tortor non turpis semper bibendum. Ut ac nisi porta, malesuada risus nonVestibulum ante ipsum primis</p>
                        </div>
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

                <br>
                <hr>
                <br>
                <div class="blog-post-comment">
                    <div class="comment-wrap">
                        <div class="comment-wrap-title">
                            <h4 class="title">Comments </h4>
                        </div>
                        <div class="latest-comments">
                            <ul class="list-wrap">
                                <li>

                                    <c:forEach items="${requestScope.postComments}" var="postComment">
                                        <div class="comments-box">
                                            <div class="comments-avatar">
                                                <c:url value="/view/user/assets/img/users/${requestScope.usersList.get(postComment.getUser_id()).getAvatar()}" var="urlImg"/>
                                                <c:if test="${requestScope.usersList.get(postComment.getUser_id()).getAvatar() == null}">
                                                    <c:set value="${pageContext.request.contextPath}/view/user/assets/img/users/default_img.png" var="urlImg"/>
                                                </c:if>
                                                <img style="object-fit: cover !important; object-position: center; width: 80px !important; height: 80px !important;" src="${urlImg}" alt="img">
                                            </div>

                                            <div class="comments-text">
                                                <div class="avatar-name">
                                                    <h6 class="name">${requestScope.usersMap.get(postComment.getUser_id())}</h6>
                                                    <span class="date">${postComment.getCreated_at()}</span>
                                                </div>
                                                <p>${postComment.getComment()}</p>
                                            </div>
                                        </div>
                                        <hr>
                                    </c:forEach>



                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="comment-respond">
                        <h4 class="comment-reply-title">Post a comment</h4>
                        <form action="${pageContext.request.contextPath}/blog-detail" method="GET" class="comment-form">
                            <div class="comment-field">
                                <label for="comment"></label>
                                <textarea id="comment" name="comment" placeholder="Comment"></textarea>
                                <label>
                                    <input type="text" hidden="" name="post_id" value="${requestScope.post.getPost_id()}"/>
                                </label>
                            </div>
                            <p class="form-submit"></p>
                            <button class="btn btn-two arrow-btn">Post Comment <img src="${pageContext.request.contextPath}/view/user/assets/img/icons/right_arrow.svg" alt="img" class="injectable"></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- blog-details-area-end -->

</main>
<!-- main-area-end -->


<%@include file="/view/user/parts/footer.jsp" %>