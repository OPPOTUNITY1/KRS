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
                    <div class="col-sm-12">
                        <div class="page-sub-header">
                            <h3 class="page-title">Welcome Admin!</h3>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item">
                                    <a href="${pageContext.request.contextPath}/admin">Home</a>
                                </li>
                                <li class="breadcrumb-item active">Admin</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /Page Header -->

            <!-- Overview Section -->
            <div class="row">
                <div class="col-xl-3 col-sm-6 col-12 d-flex">
                    <div class="card bg-comman w-100">
                        <div class="card-body">
                            <div
                                    class="db-widgets d-flex justify-content-between align-items-center"
                            >
                                <div class="db-info">
                                    <h6>Students</h6>
                                    <h3>${requestScope.totalStudent}</h3>
                                </div>
                                <div class="db-icon">
                                    <img
                                            src="${pageContext.request.contextPath}/view/dashboard/assets/img/icons/dash-icon-01.svg"
                                            alt="Dashboard Icon"
                                    />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-xl-3 col-sm-6 col-12 d-flex">
                    <div class="card bg-comman w-100">
                        <div class="card-body">
                            <div
                                    class="db-widgets d-flex justify-content-between align-items-center"
                            >
                                <div class="db-info">
                                    <h6>Teacher</h6>
                                    <h3>${requestScope.totalTeacher}</h3>
                                </div>
                                <div class="db-icon">
                                    <img
                                            src="${pageContext.request.contextPath}/view/dashboard/assets/img/icons/student-icon-01.svg"
                                            alt="Dashboard Icon"
                                    />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-xl-3 col-sm-6 col-12 d-flex">
                    <div class="card bg-comman w-100">
                        <div class="card-body">
                            <div
                                    class="db-widgets d-flex justify-content-between align-items-center"
                            >
                                <div class="db-info">
                                    <h6>Class</h6>
                                    <h3>0</h3>
                                </div>
                                <div class="db-icon">
                                    <img
                                            src="${pageContext.request.contextPath}/view/dashboard/assets/img/icons/dash-icon-03.svg"
                                            alt="Dashboard Icon"
                                    />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-xl-3 col-sm-6 col-12 d-flex">
                    <div class="card bg-comman w-100">
                        <div class="card-body">
                            <div
                                    class="db-widgets d-flex justify-content-between align-items-center"
                            >
                                <div class="db-info">
                                    <h6>Subject</h6>
                                    <h3>${requestScope.totalSubject}</h3>
                                </div>
                                <div class="db-icon">
                                    <img
                                            src="${pageContext.request.contextPath}/view/dashboard/assets/img/icons/teacher-icon-02.svg"
                                            alt="Dashboard Icon"
                                    />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /Overview Section -->

            <script>
                'use strict';
                // Retrieve data from JSP
                let teacherData = ${requestScope.teacherDataJson};
                let studentData = ${requestScope.studentDataJson};
                let listMonth = ${requestScope.listMonthJson};
                // let listMonth = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul"];

                let boysData = ${requestScope.boysDataJson};
                let girlsData = ${requestScope.girlsDataJson};
                let years = ${requestScope.yearsDataJson};

                console.log(teacherData);
                console.log(studentData);
                console.log(listMonth);
                console.log(boysData);
                console.log(girlsData);
                console.log(years);

                $(document).ready(function() {

                    // Line chart

                    if ($('#apexcharts-area-custom').length > 0) {
                        var options = {
                            chart: {
                                height: 350,
                                type: "line",
                                toolbar: {
                                    show: false
                                },
                            },
                            dataLabels: {
                                enabled: false
                            },
                            stroke: {
                                curve: "smooth"
                            },
                            series: [{
                                name: "Teachers",
                                color: '#3D5EE1',
                                data: teacherData
                            }, {
                                name: "Students",
                                color: '#70C4CF',
                                data: studentData
                            }],
                            xaxis: {
                                categories: listMonth,
                            }
                        }
                        var chart = new ApexCharts(
                            document.querySelector("#apexcharts-area-custom"),
                            options
                        );
                        chart.render();
                    }

                    // Bar chart options
                    var optionsBar = {
                        chart: {
                            type: 'bar',
                            height: 350,
                            width: '100%',
                            stacked: false,
                            toolbar: {
                                show: false
                            },
                        },
                        dataLabels: {
                            enabled: false
                        },
                        plotOptions: {
                            bar: {
                                columnWidth: '55%',
                                endingShape: 'rounded'
                            },
                        },
                        stroke: {
                            show: true,
                            width: 2,
                            colors: ['transparent']
                        },
                        series: [{
                            name: "Boys",
                            color: '#70C4CF',
                            data: boysData
                        }, {
                            name: "Girls",
                            color: '#3D5EE1',
                            data: girlsData
                        }],
                        labels: years,
                        xaxis: {
                            labels: {
                                show: false
                            },
                            axisBorder: {
                                show: false
                            },
                            axisTicks: {
                                show: false
                            },
                        },
                        yaxis: {
                            axisBorder: {
                                show: false
                            },
                            axisTicks: {
                                show: false
                            },
                            labels: {
                                style: {
                                    colors: '#777'
                                }
                            }
                        },
                        title: {
                            text: '',
                            align: 'left',
                            style: {
                                fontSize: '18px'
                            }
                        }
                    };

                    var chartBar = new ApexCharts(document.querySelector('#bar-custom'), optionsBar);
                    chartBar.render();
                });
            </script>


            <div class="row">
                <div class="col-md-12 col-lg-6">
                    <!-- Revenue Chart -->
                    <div class="card card-chart">
                        <div class="card-header">
                            <div class="row align-items-center">
                                <div class="col-6">
                                    <h5 class="card-title">Overview</h5>
                                </div>
                                <div class="col-6">
                                    <ul class="chart-list-out">
                                        <li><span class="circle-blue"></span>Teacher</li>
                                        <li><span class="circle-green"></span>Student</li>
                                        <li class="star-menus">
                                            <a href="#"><i class="fas fa-ellipsis-v"></i></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <div id="apexcharts-area-custom"></div>
                        </div>
                    </div>
                    <!-- /Revenue Chart -->
                </div>

                <div class="col-md-12 col-lg-6">
                    <!-- Student Chart -->
                    <div class="card card-chart">
                        <div class="card-header">
                            <div class="row align-items-center">
                                <div class="col-6">
                                    <h5 class="card-title">Number of Students</h5>
                                </div>
                                <div class="col-6">
                                    <ul class="chart-list-out">
                                        <li><span class="circle-blue"></span>Girls</li>
                                        <li><span class="circle-green"></span>Boys</li>
                                        <li class="star-menus">
                                            <a href="#"><i class="fas fa-ellipsis-v"></i></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <div id="bar-custom"></div>
                        </div>
                    </div>
                    <!-- /Student Chart -->
                </div>
            </div>

<%--            <div class="row">--%>
<%--                <div class="col-xl-6 d-flex">--%>
<%--                    <!-- Star Students -->--%>
<%--                    <div class="card flex-fill student-space comman-shadow">--%>
<%--                        <div class="card-header d-flex align-items-center">--%>
<%--                            <h5 class="card-title">Star Students</h5>--%>
<%--                            <ul class="chart-list-out student-ellips">--%>
<%--                                <li class="star-menus">--%>
<%--                                    <a href="javascript:;"><i class="fas fa-ellipsis-v"></i></a>--%>
<%--                                </li>--%>
<%--                            </ul>--%>
<%--                        </div>--%>
<%--                        <div class="card-body">--%>
<%--                            <div class="table-responsive">--%>
<%--                                <table--%>
<%--                                        class="table star-student table-hover table-center table-borderless table-striped"--%>
<%--                                >--%>
<%--                                    <thead class="thead-light">--%>
<%--                                    <tr>--%>
<%--                                        <th>ID</th>--%>
<%--                                        <th>Name</th>--%>
<%--                                        <th class="text-center">Marks</th>--%>
<%--                                        <th class="text-center">Percentage</th>--%>
<%--                                        <th class="text-end">Year</th>--%>
<%--                                    </tr>--%>
<%--                                    </thead>--%>
<%--                                    <tbody>--%>
<%--                                    <tr>--%>
<%--                                        <td class="text-nowrap">--%>
<%--                                            <div>PRE2209</div>--%>
<%--                                        </td>--%>
<%--                                        <td class="text-nowrap">--%>
<%--                                            <a href="profile.html">--%>
<%--                                                <img--%>
<%--                                                        class="rounded-circle"--%>
<%--                                                        src="${pageContext.request.contextPath}/view/dashboard/assets/img/profiles/avatar-02.jpg"--%>
<%--                                                        width="25"--%>
<%--                                                        alt="Star Students"--%>
<%--                                                />--%>
<%--                                                John Smith--%>
<%--                                            </a>--%>
<%--                                        </td>--%>
<%--                                        <td class="text-center">1185</td>--%>
<%--                                        <td class="text-center">98%</td>--%>
<%--                                        <td class="text-end">--%>
<%--                                            <div>2019</div>--%>
<%--                                        </td>--%>
<%--                                    </tr>--%>
<%--                                    </tbody>--%>
<%--                                </table>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <!-- /Star Students -->--%>
<%--                </div>--%>

<%--                <div class="col-xl-6 d-flex">--%>
<%--                    <!-- Feed Activity -->--%>
<%--                    <div class="card flex-fill comman-shadow">--%>
<%--                        <div class="card-header d-flex align-items-center">--%>
<%--                            <h5 class="card-title">Student Activity</h5>--%>
<%--                            <ul class="chart-list-out student-ellips">--%>
<%--                                <li class="star-menus">--%>
<%--                                    <a href="javascript:;"><i class="fas fa-ellipsis-v"></i></a>--%>
<%--                                </li>--%>
<%--                            </ul>--%>
<%--                        </div>--%>
<%--                        <div class="card-body">--%>
<%--                            <div class="activity-groups">--%>
<%--                                <div class="activity-awards">--%>
<%--                                    <div class="award-boxs">--%>
<%--                                        <img src="${pageContext.request.contextPath}/view/dashboard/assets/img/icons/award-icon-01.svg"--%>
<%--                                             alt="Award"/>--%>
<%--                                    </div>--%>
<%--                                    <div class="award-list-outs">--%>
<%--                                        <h4>1st place in "Chess”</h4>--%>
<%--                                        <h5>John Doe won 1st place in "Chess"</h5>--%>
<%--                                    </div>--%>
<%--                                    <div class="award-time-list">--%>
<%--                                        <span>1 Day ago</span>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="activity-awards">--%>
<%--                                    <div class="award-boxs">--%>
<%--                                        <img src="${pageContext.request.contextPath}/view/dashboard/assets/img/icons/award-icon-02.svg"--%>
<%--                                             alt="Award"/>--%>
<%--                                    </div>--%>
<%--                                    <div class="award-list-outs">--%>
<%--                                        <h4>Participated in "Carrom"</h4>--%>
<%--                                        <h5>Justin Lee participated in "Carrom"</h5>--%>
<%--                                    </div>--%>
<%--                                    <div class="award-time-list">--%>
<%--                                        <span>2 hours ago</span>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="activity-awards">--%>
<%--                                    <div class="award-boxs">--%>
<%--                                        <img src="${pageContext.request.contextPath}/view/dashboard/assets/img/icons/award-icon-03.svg"--%>
<%--                                             alt="Award"/>--%>
<%--                                    </div>--%>
<%--                                    <div class="award-list-outs">--%>
<%--                                        <h4>Internation conference in "St.John School"</h4>--%>
<%--                                        <h5>--%>
<%--                                            Justin Leeattended internation conference in "St.John School"--%>
<%--                                        </h5>--%>
<%--                                    </div>--%>
<%--                                    <div class="award-time-list">--%>
<%--                                        <span>2 Week ago</span>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="activity-awards mb-0">--%>
<%--                                    <div class="award-boxs">--%>
<%--                                        <img src="${pageContext.request.contextPath}/view/dashboard/assets/img/icons/award-icon-04.svg"--%>
<%--                                             alt="Award"/>--%>
<%--                                    </div>--%>
<%--                                    <div class="award-list-outs">--%>
<%--                                        <h4>Won 1st place in "Chess"</h4>--%>
<%--                                        <h5>John Doe won 1st place in "Chess"</h5>--%>
<%--                                    </div>--%>
<%--                                    <div class="award-time-list">--%>
<%--                                        <span>3 Day ago</span>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <!-- /Feed Activity -->--%>
<%--                </div>--%>
<%--            </div>--%>
        </div>
    </div>
</div>
<%@include file="/view/dashboard/parts/footer.jsp" %>


