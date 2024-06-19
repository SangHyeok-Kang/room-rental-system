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
	String u_id = (String)session.getAttribute("MEMBERID");
	String query=null;



		String jdbcDriver ="jdbc:mysql://211.213.95.123:33060/cloud?serverTimezone=UTC"; 
		String dbUser ="20183109"; //mysql id
		String dbPass ="1q2w3e4r"; //mysql password
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		stb.append("select * from inquiry where user_id = \"").append (u_id).append("\""); 
		query = stb.toString();
		stmt = conn.createStatement();	
		rs = stmt.executeQuery(query);

	
%> 


<!DOCTYPE html>
<html>
<head>
<title>내방어때?</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
		<script src="dist/timepicker-ui.umd.js"></script>
<!-- //for-mobile-apps -->
<link href="/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="/css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
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
<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
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
				<div class="logoutContainer_logout">
					<form action="/jsp/logout.jsp">
						<input type="submit" id="logoutButton" value="Logout">
					</form>
				</div>
			</div>
			<div class="clearfix"> </div>
		</div>
		<div class="header-top-right">
		
			<div class="dropdown">
				
				<button class="dropbtn">개인정보 관리</button>
				
				<div class="dropdown-content">
				
					<a href="modInfo.jsp">개인정보 변경</a>
					
					<a href="check_reser.jsp">예약 내역확인</a>
					<a href="room_regis_check.jsp">내방 관리</a>
					<a href="af_report.jsp">신고 내역</a> 
				</div>
			</div>
		
		</div>
	</div>
</div>
	<div class="header-nav">
		<div class="container">
			<nav class="navbar navbar-default">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
				  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
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
						<li><a href="/user/Home/af_Logout.jsp">Home</a></li>
						<li><a href="/user/Home/af_about.jsp">방 등록</a></li>
						<li><a href="/user/Home/af_codes.jsp">방 검색 및 예약</a></li>
						<li><a href="/user/Home/af_blog.jsp">공지사항</a></li>
						<li class="active"><a href="/user/Home/af_contact.jsp">1:1문의 내역</a></li>
					</ul>
					
				</div><!-- /.navbar-collapse -->	
				
			</nav>
		</div>
	</div>
<!-- //header -->

<!-- contact -->
<div class="contact">
	<div class="tabs">
    	<input id="all" type="radio" name="tab_item" checked>
    	<label class="tab_item" for="all">나의 문의 내역 </label>
    	<input id="programming" type="radio" name="tab_item">
    	<label class="tab_item" for="programming">새 문의 작성 </label>
    	<div class="tab_content" id="all_content">
      		<div class ="list_none" style="display:block;">
				<table class="board-table">
					<thead>
					<tr>
					   <th scope="col" class="th-num">문의번호</th>
					   <th scope="col" class="th-title">제목</th>
					   <th scope="col" class="th-date">등록일</th>
					   <th scope="col" class="th-ans">답변 여부</th>
					</tr>
					</thead>
					<tbody>
					 	<% while(rs.next()){%>
								 
						 <tr>
							<td><%=rs.getInt("ask_num")%></td>
							<td class="title indent text-align-left"><a href="../contact/af_contact_check.jsp?inq_number=<%=rs.getInt("ask_num")%>"><%=rs.getString("title") %></a></td>
							<td><%=rs.getDate("date")%> </td>
							<%
								if(rs.getString("answer")!= null){%>
									<td>답변 완료</td>
								<%}
								else{%>
									<td>답변 전</td>
								<%}%>
							<%}%>
							
						  </tr>
					</tbody>
				 </table>
			</div>
    	</div>
    	<div class="tab_content" id="programming_content">
			<div class="fcf-body">
    			<div id="fcf-form">
    				<h3 class="fcf-h3">1:1 문의 게시판 </h3><br>
    				<form id="fcf-form-id" class="fcf-form-class" action="/user/contact/set_inquiry.jsp">
        			<div class="fcf-form-group">
            			<label for="Name" class="fcf-label">아이디 </label>
            			<div class="fcf-input-group">
                			<input type="text" id="id" name="id" class="fcf-form-control" required
            				value placeholder="아이디를 입력해 주세요.">
            			</div>
        			</div>
        			<div class="fcf-form-group">
            			<label for="Email" class="fcf-label">제목 </label>
            			<div class="fcf-input-group">
                			<input type="id" id="title" name="title" class="fcf-form-control" required
            				value placeholder="제목을 입력해 주세요.">
            			</div>
        			</div>
        			<div class="fcf-form-group">
            			<label for="Message" class="fcf-label"> 문의내용 </label>
            			<div class="fcf-input-group">
                			<textarea id="Message" name="Message" class="fcf-form-control" rows="6" maxlength="3000" style="resize:none;" required
            				value placeholder="문의하실 내용을 작성해 주세요."></textarea>
            			</div>
        			</div>
        			<div class="fcf-form-group">
            			<button type="submit" id="fcf-button" class="fcf-btn fcf-btn-primary fcf-btn-lg fcf-btn-block">작성 완료</button>
        			</div>
    				</form>
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
				<img src="/images/ksh.jpg" alt=" " class="img-responsive" />
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
				<img src="/images/sjs.jpg" alt=" " class="img-responsive" />
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
				<img src="/images/kms.jpg" alt=" " class="img-responsive" />
				<h4>MinSeung Kim</h4>
				<p>H.P 010-4503-2737</p>
				<p>
					18. 동의대학교 ICT공과대학 창의소프트웨어공학부 입학 <br>
					20. 대한민국 해병대 병장 만기전역 <br>
				</p>
			</div>
			<div class="dealer-grid-fourth">
				<img src="/images/ksc.jpg" alt=" " class="img-responsive" />
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
