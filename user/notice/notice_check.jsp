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
    int announce_num = Integer.parseInt(request.getParameter("an_number"));
    String jdbcDriver = "jdbc:mysql://211.213.95.123:33060/cloud?serverTimezone=UTC";
    String dbUser = "20183109"; //mysql id
    String dbPass = "1q2w3e4r"; //mysql password
    conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);

    String sql = "SELECT * FROM announcement where an_num=" + announce_num;
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
    <link href="/css/bootstrap.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="/css/style.css" rel="stylesheet" type="text/css" media="all"/>
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
    <div class="container">
        <div class="header-top-left animated wow slideInLeft" data-wow-delay=".5s">
            <p>자취방 대여 필요할 때 내방어때?</p>
        </div>
        <div class="header-top-left1 animated wow slideInLeft" data-wow-delay=".7s">
            <h1>담당자 연락처 010-4072-6238 <span class="glyphicon glyphicon-earphone" aria-hidden="true"></span></h1>
        </div>
        <div class="header-top-right">
            <div id="loginContainer login"><a href="/jsp/login.jsp" id="loginButton"><span>Login</span></a>
                <div id="loginBox">
                    <form id="loginForm" action="/jsp/login.jsp">
                        <fieldset id="body">
                            <fieldset>
                                <label for="email">Email Address</label>
                                <input type="text" name="id" id="id">
                            </fieldset>
                            <fieldset>
                                <label for="password">Password</label>
                                <input type="password" name="ps" id="password">
                            </fieldset>
                            <input type="submit" id="login" value="로그인">
                            <div class=GuestorManager>
                                <label for="radio"><input type="radio" name="division" value="Guest" required>
                                    <i>Guest</i></label>
                                <label for="radio"><input type="radio" name="division" value="Manager">
                                    <i>Manager</i></label>
                            </div>
                        </fieldset>
                        <span><a href="../Home/searchPass.jsp">Forgot your password?</a></span>
                    </form>
                </div>
            </div>
        </div>

        <div class="clearfix"></div>
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
                    <a class="navbar-brand" href="../Home/index.jsp">내방어때? <span>자취방대여플랫폼</span></a>
                </div>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse nav-wil" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="../Home/index.jsp">Home</a></li>
                    <li><a href="/jsp/error.jsp">방 등록</a></li>
                    <li><a href="../Home/codes.jsp">방 검색 및 예약</a></li>
                    <li class="active"><a href="../Home/blog.jsp">공지사항</a></li>
                    <li><a href="/jsp/error.jsp">1:1문의 내역</a></li>
                </ul>

            </div><!-- /.navbar-collapse -->

        </nav>
    </div>
</div>
<!-- //header -->
<!-- banner -->
<div class="container">
    <div class="tabs">
        <div id="subtitleCon">
            <div class="subTitle" style="padding-top: 10px; height: 45px; width:100%;">
                <ul>
                    <li style="float: left; width: 12%; white-space: nowrap; overflow: hidden;
						text-overflow: ellipsis; font-size: 25px ;background-color:#ff7609; border-radius:10px;
						 color:#f5f5f5; margin-left:5%; margin-top:1%;margin-bottom:2%" id="CurrentMenuTitle">공지사항
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
                    <th style="text-align: left;color:#333;text-align: center;background-color:#fef5ef;" scope="col">
                        제목
                    </th>
                    <td colspan="5" style="text-align: left;padding:1% "><%=rs.getString("title")%>
                    </td>
                </tr>
                <tr>
                    <th style="text-align: left;color:#333;text-align: center;background-color:#fef5ef;" scope="col">
                        공지번호
                    </th>
                    <td style="text-align: left;padding:1%"><%=rs.getInt("an_num")%>
                    </td>
                    <th style="text-align: left;color:#333;text-align: center;background-color:#fef5ef;">작성자</th>
                    <td style="text-align: left;padding:1%">관리자</td>
                    <th style="text-align: left;color:#333;text-align: center;background-color:#fef5ef;">등록일</th>
                    <td style="text-align: left;padding:1%"><%=rs.getDate("date")%>
                    </td>

                </tr>

                <tr style="height:400px">
                    <th style="text-align: left;color:#333;text-align: center; background-color:#fef5ef ;" scope="col">
                        내용
                    </th>
                    <td height="200" colspan="5" style="text-align: left;padding:1%"><%=rs.getString("contents")%>
                    </td>
                </tr>
                <%}%>
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
                </tbody>
            </table>
        </div>
    </div>
</div>

</div>

<!-- //banner -->
<!-- banner-bottom -->
<!-- //banner-bottom -->


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