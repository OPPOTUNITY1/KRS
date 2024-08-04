<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>


<c:set value="${sessionScope.role}" var="role"/>

<!-- Sidebar -->
<div class="sidebar" id="sidebar">
    <div class="sidebar-inner slimscroll">
        <div id="sidebar-menu" class="sidebar-menu">
            <ul>
                <li class="menu-title">
                    <span>Main Menu</span>
                </li>

                <li class="false">
                    <a href="${pageContext.request.contextPath}/dashboard">
                        <i class="feather-grid"></i>
                        <span> Dashboard</span>
                    </a>
                </li>

                <c:if test="${sessionScope.role.equalsIgnoreCase('admin')  || sessionScope.role.equalsIgnoreCase('teacher') || sessionScope.role.equalsIgnoreCase('manager')}">
                    <li class="false">
                        <a href="${pageContext.request.contextPath}/manager-user">
                            <i class="fas fa-graduation-cap"></i>
                            <span> Users</span>
                        </a>
                    </li>
                </c:if>


                <c:if test="${sessionScope.role.equalsIgnoreCase('admin') || sessionScope.role.equalsIgnoreCase('manager')}">
                    <li class="false">
                        <a href="${pageContext.request.contextPath}/manager-question">
                            <i class="fas fa-chalkboard-teacher"></i>
                            <span> Question</span>
                        </a>
                    </li>
                </c:if>

<%--                <c:if test="${role.equalsIgnoreCase('admin') || role.equalsIgnoreCase('manager') || role.equalsIgnoreCase('teacher') }">--%>
<%--                    <li class="false">--%>
<%--                        <a href="${pageContext.request.contextPath}/class-manager"--%>
<%--                        ><i class="fas fa-building"></i> <span> Class</span>--%>
<%--                        </a>--%>
<%--                    </li>--%>
<%--                </c:if>--%>

                <c:if test="${sessionScope.role.equalsIgnoreCase('admin')}">
                    <li class="false">
                        <a href="${pageContext.request.contextPath}/manager-subject"
                        ><i class="fas fa-book-reader"></i> <span> Subjects</span>
                        </a>
                    </li>
                </c:if>

                <c:if test="${sessionScope.role.equalsIgnoreCase('admin') || sessionScope.role.equalsIgnoreCase('manager')}">
                    <li class="false">
    <%--                    <a href="${pageContext.request.contextPath}/manager-lesson"--%>
                        <a href="${pageContext.request.contextPath}/manager-lesson"
                        ><i class="fas fa-book-reader"></i> <span> Lessons</span>
                        </a>
                    </li>
                </c:if>

                <li class="menu-title">
                    <span>Management</span>
                </li>

<%--                <c:if test="${role.equalsIgnoreCase('admin') || role.equalsIgnoreCase('teacher') || role.equalsIgnoreCase('manager')}">--%>
<%--                    <li class="">--%>
<%--                        <a href="${pageContext.request.contextPath}/manager-exam">--%>
<%--                            <i class="fas fa-clipboard-list"></i> <span>Exam list</span></a--%>
<%--                        >--%>
<%--                    </li>--%>
<%--                </c:if>--%>

                <c:if test="${sessionScope.role.equalsIgnoreCase('admin') || sessionScope.role.equalsIgnoreCase('manager') || sessionScope.role.equalsIgnoreCase('student') || sessionScope.role.equalsIgnoreCase('teacher')}">
                    <li class="false">
                        <a href="${pageContext.request.contextPath}/manager-post"
                        ><i class="fa fa-newspaper"></i> <span> Post</span>
                        </a>
                    </li>
                </c:if>

                <li class="">
                    <a href="${pageContext.request.contextPath}/material-setting">
                        <i class="fas fa-file-archive"></i> <span>Material</span></a
                    >
                </li>
                <li class="">
                    <a href="${pageContext.request.contextPath}/studyset">
                        <i class="fas fa-square"></i> <span>Studyset</span></a
                    >
                </li>

                <c:if test="${role.equalsIgnoreCase('admin')}">
                    <li class="">
                    <a href="${pageContext.request.contextPath}/system-setting">
                        <i class="fas fa-cog"></i> <span>Settings</span></a>
                    </li>
                </c:if>
            </ul>
        </div>
    </div>
</div>
<!-- /Sidebar -->
