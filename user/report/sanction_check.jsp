<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>

<!-- 데이터 베이스를 읽어오는 코드블록 -->
<%
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    StringBuilder stb = new StringBuilder();
    int san_num = Integer.parseInt(request.getParameter("san_number"));
    String jdbcDriver = "jdbc:mysql://211.213.95.123:33060/cloud?serverTimezone=UTC";
    String dbUser = "20183109"; //mysql id
    String dbPass = "1q2w3e4r"; //mysql password
    conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);

    String sql = "SELECT * FROM waiting_sanction where sanction_num=" + san_num;
    stmt = conn.createStatement();
    rs = stmt.executeQuery(sql);
%>
<!DOCTYPE html>
<html>
<head>
    <title>내방어때?</title>
    <!-- for-mobile-apps -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content="Sea King Restaurant Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design"/>
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);

    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>
    <!-- //for-mobile-apps -->
    <link href="/css/manager-bootstrap.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="/css/style1.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"/>
    <!-- js -->
    <script src="/js/jquery-1.11.1.min.js"></script>
    <!-- //js -->
    <!-- login-pop-up -->
    <script src="/js/menu_jquery.js"></script>
    <!-- //login-pop-up -->
    <!-- animation-effect -->
    <link href="/css/animate.min.css" rel="stylesheet">
    <script src="/js/wow.min.js"></script>
    <script>
        new WOW().init();
    </script>
    <!-- //animation-effect -->
    <link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic'
          rel='stylesheet' type='text/css'>
    <link href='//fonts.googleapis.com/css?family=Oswald:400,300,700' rel='stylesheet' type='text/css'>
</head>

<body>
<!-- header -->
<div class="header-top">
    <div class="header-container">
        <div class="header-top-left animated wow slideInLeft" data-wow-delay=".5s">
            <p>자취방 대여 필요할 때 내방어때?</p>
        </div>
        <div class="header-top-right">
            <div class="logoutContainer_logout">
                <form action="/jsp/logout.jsp">
                    <input type="submit" id="logoutButton" value="Logout">
                </form>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
</div>
<div class="header-nav">
    <div class="container">
        <nav class="navbar navbar-default">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                        data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <div class="logo animated wow slideInLeft" data-wow-delay=".5s">
                    <a class="navbar-brand" href="/user/Home/af_Logout.jsp">내방어때? <span>자취방대여플랫폼</span></a>
                </div>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse nav-wil" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="/user//Home/af_Logout.jsp">Home</a></li>
                    <li><a href="/user//Home/af_about.jsp">방 등록</a></li>
                    <li><a href="/user/Home/af_codes.jsp">방 검색 및 예약</a></li>
                    <li><a href="/user/Home/af_blog.jsp">공지사항</a></li>
                    <li><a href="/user/Home/af_contact.jsp">1:1문의 내역</a></li>
                </ul>

            </div><!-- /.navbar-collapse -->

        </nav>
    </div>
</div>
<!-- //header -->
<!-- banner -->
 
<div class="container">
    <div class="contact">
        <div class="tabs">
            <div id="subtitleCon">
                <div class="subTitle" style="padding-top: 10px; height: 45px; width:100%;">
                    <ul>
                        <li style="float: left; width: 10%; white-space: nowrap; overflow: hidden; 
						text-overflow: ellipsis; font-size: 25px ;background-color:#ff7609; border-radius:10px;
						 color:#f5f5f5; margin-left:5%; margin-top:1%;margin-bottom:2%" id="CurrentMenuTitle">신고내역
                        </li> <!--여기부터 작업-->

                    </ul>


                </div>
            </div>
            <div class="form_table" style="margin-top: 0px; float: left; width: 100%; position: relative;">
                <table class="tbl_type" border="1" cellspacing="0" style="width:100%">
                    <colgroup>
                        <col style="width:15%">
                        <col style="width:20%">
                        <col style="width:15%">
                        <col style="width:20%">
                        <col style="width:15%">


                    </colgroup>
                    <tbody>
                    <% while (rs.next()) {%>
                    <tr>
                        <th style="text-align: left;color:#333;text-align: center;background-color:#fef5ef;"
                            scope="col">신고번호
                        </th>
                        <td colspan="5" style="text-align: left;padding:1% "><%=rs.getInt("sanction_num")%>
                        </td>
                    </tr>
                    <tr>
                        <th style="text-align: left;color:#333;text-align: center;background-color:#fef5ef;"
                            scope="col">부적절한 사용자 번호
                        </th>
                        <td style="text-align: left;padding:1%"><%=rs.getInt("user_num")%>
                        </td>
                        <th style="text-align: left;color:#333;text-align: center;background-color:#fef5ef;">신고한 사용자 아이디</th>
                        <td style="text-align: left;padding:1%"><%=rs.getString("user_id")%></td>
                        <th style="text-align: left;color:#333;text-align: center;background-color:#fef5ef;">등록일</th>
                        <td style="text-align: left;padding:1%"><%=rs.getDate("date")%>
                        </td>

                    </tr>

                    <tr style="height:400px">
                        <th style="text-align: left;color:#333;text-align: center; background-color:#fef5ef ;"
                            scope="col">사유
                        </th>
                        <td height="200" colspan="5" style="text-align: left;padding:1%"><%=rs.getString("reason")%>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div style="float: left; width: 100%; text-align: center; margin-top: 3%; margin-bottom:15px;">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tbody>
                    <tr>
                        <td width="15%" align="left"><span class="btn_pack medium"><a href='#'
                                                                                      onclick='history.back();'>목록</a></span>
                        </td>
                        <td width="35%" align="right">
                            <table border="0" cellspacing="0" cellpadding="0">
                                <tbody>
                                <tr>
                                    <td style="width: 119px">&nbsp;</td>
                                </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    <%}%>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>


<!-- //popular -->
<!-- footer -->
<div class="footer">
    <h3 style="color:'white'">Our Manager</h3>
    <div class="dealer-grid">
        <div class="dealer-grid-first">
            <img src="/images/ksh.jpg" alt=" " class="img-responsive"/>
            <div class="f_info">
                <h4>SangHyeok Kang</h4>
                <div class="f_detail">
                    <p>H.P 010-4072-6238</p>
                    <p>
                        18. 동의대학교 ICT공과대학 창의소프트웨어공학부 입학 <br>
                        19. 제 21대 컴퓨터소프트웨어공학과 학생회 홍보부장 <br>
                        21. 대한민국 육군 병장 만기전역 <br>
                    </p>
                </div>
            </div>
        </div>
        <div class="dealer-grid-second">
            <img src="/images/sjs.jpg" alt=" " class="img-responsive"/>
            <div class="s_info">
                <h4>JunSeop Song</h4>
                <p>H.P 010-2358-1817</p>
                <p>
                    18. 동의대학교 ICT공과대학 창의소프트웨어공학부 입학 <br>
                    20. 대한민국 육군 병장 만기전역 <br>
                    21. 제 23대 컴퓨터소프트웨어공학과 학생회 홍보부장 <br>
                    22. 제 24대 컴퓨터소프트웨어공학과 학생회 부학회장 <br>
                </p>
            </div>
        </div>
        <div class="dealer-grid-third">
            <img src="/images/kms.jpg" alt=" " class="img-responsive"/>
            <div class="t_info">
                <h4>MinSeung Kim</h4>
                <p>H.P 010-4503-2737</p>
                <p>
                    18. 동의대학교 ICT공과대학 창의소프트웨어공학부 입학 <br>
                    20. 대한민국 해병대 병장 만기전역 <br>
                </p>
            </div>
        </div>
        <div class="dealer-grid-fourth">
            <img src="/images/ksc.jpg" alt=" " class="img-responsive"/>
            <div class="f_info">
                <h4>SungChan Kim</h4>
                <p>H.P 010-9440-7438</p>
                <p>
                    18. 동의대학교 ICT공과대학 창의소프트웨어공학부 입학 <br>
                    19. 제 21대 컴퓨터소프트웨어공학과 학생회 기획부장 <br>
                    21. 대한민국 해군 병장 만기전역
                </p>
            </div>
        </div>
    </div>
</div>
<!-- //footer -->
<!-- for bootstrap working -->
<script src="js/bootstrap.js"></script>
<!-- //for bootstrap working -->
</body>
</html>
<%
    rs.close();
    stmt.close();
    conn.close();
%>