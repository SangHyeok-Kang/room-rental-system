<%@ page language="java" contentType ="text/html" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>

<head>
   <title>내방어때?</title>
   <!-- for-mobile-apps -->
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   <meta name="keywords" content="Sea King Restaurant Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
   <script
      type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);</script>

   <!-- //for-mobile-apps -->
   <link href="/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
   <link href="/css/style.css" rel="stylesheet" type="text/css" media="all" />
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
   <link
      href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic'
      rel='stylesheet' type='text/css'>
   <link href='//fonts.googleapis.com/css?family=Oswald:400,300,700' rel='stylesheet' type='text/css'>
   <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
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
                  <a class="navbar-brand" href="af_Logout.jsp">내방어때? <span>자취방대여플랫폼</span></a>
               </div>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse nav-wil" id="bs-example-navbar-collapse-1">
               <ul class="nav navbar-nav">
                  <li><a href="af_Logout.jsp">Home</a></li>
                  <li><a href="af_about.jsp">방 등록</a></li>
                  <li><a href="af_codes.jsp">방 검색 및 예약</a></li>
                  <li><a href="af_blog.jsp">공지사항</a></li>
                  <li><a href="af_contact.jsp">1:1문의 내역</a></li>
               </ul>

               
            </div><!-- /.navbar-collapse -->

         </nav>
      </div>
   </div>
   <!-- //header -->
   <!-- banner -->
   <script>
        function btninfo()
        { return true; }
        function btninfo(frm)
        { frm.action='/jsp/withdrawal.jsp'; frm.submit(); return true; } 
    </script> 
   <div class="about_banner-bottom">
		<div class="about_banner-bottom-grids">
            <div class="container">
                <div class="list-layer">
                    <form class="form-horizontal" id="my-form" action="/jsp/changeInfo.jsp" name="my" enctype="multipart/form-data">
                        <table class="table table-bordered">
				            <colgroup>
				                <col width="136px" />
				                <col width="778px" />
				            </colgroup>
                            <thead></thead>
                            <tbody>
                                <tr>
                                    <th>비밀번호 변경</th>
                                    <td>
                                        <div class="form-layer mb_24">
                                            <span class="form-title">현재 비밀번호</span>
                                            <span class="form-body">
                                                <input class="form-control normal-size" type="password" name="NowPass" placeholder="비밀번호를 입력하세요." required minlenght=6 maxlength=8/> </span>
                                        </div>
                                        <div class="form-layer mb_24">
                                            <span class="form-title">변경된 비밀번호</span>
                                            <span class="form-body">
                                                <input class="form-control normal-size" type="password" name="ModPass" placeholder="비밀번호를 입력하세요." value="" minlenght=6 maxlength=8/> </span>
                                        </div>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th>전화번호 변경</th>
                                    <td>
                                        <div class="form-layer mb_24">
                                            <div>
                                                <span class="form-title">변경된 전화번호</span>
                                                <span class="form-body">
                                                    <div class="select-style small-size">
                                                        <select name="phone1">
                                                            <option value="010" >010</option>
                                                            <option value="011" >011</option>
                                                            <option value="016" >016</option>
                                                            <option value="017" >017</option>
                                                            <option value="018" >018</option>
                                                            <option value="019" >019</option>
                                                        </select>
                                                    </div>
                                                    <input class="form-control small-size"type="text" name="phone2" minlenght=4 maxlength=4>
                                                    <input class="form-control small-size"type="text" name="phone3" minlenght=4 maxlength=4>
                                                </span>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="submit-layer">
                            <input class="btn btn-yeogi btn-submit" type="submit" value="저장 후 수정">
                            <input class="btn btn-yeogi btn-submit" type="submit" value="회원 탈퇴"  onclick=" return btninfo(this.form)">
                        </div>
                    </form>
                </div>
            </div>
	    </div>
    </div>
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