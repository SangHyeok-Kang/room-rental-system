<%@ page language="java" contentType ="text/html" pageEncoding="utf-8" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page import ="java.sql.SQLException" %>

<!-- 데이터 베이스를 읽어오는 코드블록 --> 
<%
    Class.forName("com.mysql.cj.jdbc.Driver"); 
    Connection conn =null;
    Statement stmt =null;
    ResultSet rs =null;
    StringBuilder stb = new StringBuilder();
    String search=null;

    String jdbcDriver ="jdbc:mysql://211.213.95.123:33060/cloud?serverTimezone=UTC"; 
    String dbUser ="20183109"; //mysql id
    String dbPass ="1q2w3e4r"; //mysql password
    conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);

    String sql = "SELECT * FROM waiting_sanction";
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
                <form action="/jsp/m_logout.jsp">
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
                    <a class="navbar-brand" href="manager.jsp">내방어때? <span>자취방대여플랫폼</span></a>
                </div>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse nav-wil" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="manager.jsp">Home</a></li>
                    <li><a href="m_notice.jsp">공지사항 관리</a></li>
                    <li><a href="m_contact.jsp">문의내역 관리</a></li>
                    </strong>
                    <li class="active"><a href="m_users.jsp">사용자 관리</a></li>
                    <li><a href="m_refund.jsp">환불내역 관리</a></li>
                </ul>

            </div><!-- /.navbar-collapse -->

        </nav>
    </div>
</div>
<!-- //header -->

<!-- contact -->
<div class="container">
    <div class="contact">
        <div class="tabs">
            <input id="all" type="radio" name="tab_item" checked>
            <label class="tab_item" for="all" style="width: 100%;">신고내역 </label>
            <div class="tab_content" id="all_content">
                <div class="list_none" style="display:block;">
                    <section class="notice">
                        <div class="page-title">
                            <div class="container">
                                <h3 class="animated wow zoomIn" data-wow-delay=".5s">신고내역</h3>
                            </div>
                        </div>

                        <!-- board list area -->
                        <th id="board-list">
                            <div class="container">
                                <table class="board-table">
                                    <thead>
										<tr>
											<th scope="col" class="th-num">신고 번호</th>
											<th scope="col" class="th-title">부적절한 사용자 아이디</th>
											<th scope="col" class="th-date">등록일</th>
                                            <th scope="col" class="th-confirm">승인여부</th>
										 </tr>
										 </thead>
										 <tbody>
										  <% while(rs.next()){ %>
											<tr>
												  <td><%=rs.getInt("sanction_num")%></td>
												  <td class="title indent text-align-left"><a href="../User_Manage/m_sanction_check.jsp?san_number=<%=rs.getInt("sanction_num")%>"><%=rs.getString("appro_user_id") %></a></td>
												  <td><%=rs.getDate("date")%> </td>
                                                   <%if(rs.getString("state").equals("y")){ %>
                                                       <td>승인완료</td>
                                                   <%}else if(rs.getString("state").equals("n")){%>
                                                       <td>승인거절</td>
                                                   <%}else if(rs.getString("state").equals("x")){%>
                                                       <td>승인대기</td>
                                                   <%}%>
                                            <%}%>
											</tr>
                                    </thead>
                                </table>
                            </div>
                        </th>
                    </section>
                </div>
            </div>
        </div>
    </div>
</div>

                                    

<!-- //contact -->
<!-- footer -->
<div class="footer">
    <h3 style="color:'white'">Our Manager</h3>
    <div class="dealer-grid">
        <div class="dealer-grid-first">
            <img src="/images/ksh.jpg" alt=" " class="img-responsive"/>
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
        <div class="dealer-grid-second">
            <img src="/images/sjs.jpg" alt=" " class="img-responsive"/>
            <h4>JunSeop Song</h4>
            <div class="s_detail">
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
            <h4>MinSeung Kim</h4>
            <p>H.P 010-4503-2737</p>
            <p>
                18. 동의대학교 ICT공과대학 창의소프트웨어공학부 입학 <br>
                20. 대한민국 해병대 병장 만기전역 <br>
            </p>
        </div>
        <div class="dealer-grid-fourth">
            <img src="/images/ksc.jpg" alt=" " class="img-responsive"/>
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