<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %> 
<!DOCTYPE html>
<html>
<head>
<title>내방어때?</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>지도보기</title>
	<script type="text/javascript"
		src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=62krrn2cvz&submodules=geocoder"></script>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
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
									<label for="radio"><input type="radio" name="division" value="Guest" required> <i>Guest</i></label>
									<label for="radio"><input type="radio" name="division" value="Manager"> <i>Manager</i></label>
								</div>
							</fieldset>
							<span><a href="searchPass.jsp">Forgot your password?</a></span>
						</form>
					</div>
				</div>
			</div>
			<div class="clearfix"> </div>
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
						<a class="navbar-brand" href="/user/Home/index.jsp">내방어때? <span>자취방대여플랫폼</span></a>
					</div>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse nav-wil" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li><a href="/user/Home/index.jsp">Home</a></li>
						<li><a href="/jsp/error.jsp">방 등록</a></li>
						<li class="active"><a href="/user/Home/codes.jsp">방 검색 및 예약</a></li>
						<li><a href="/user/Home/blog.jsp">공지사항</a></li>
						<li><a href="/jsp/error.jsp">1:1문의 내역</a></li>
					</ul>
				
				</div><!-- /.navbar-collapse -->	
				
			</nav>
		</div>
	</div>
	<!-- //header -->
	<!--typography-page -->
	<div class="codes">	
		<div class="map_size">
			<div class="contact_title">
			
			</div>
			<div class="set_location">
				<div class="search_option_title" data="CPU">
					Option
				</div>
				<div class="search_option_list">
					<div class="search_option_item">
						<div class=".search_cate_contents">
							<ul class="search_cate_item">
								<div class="select_box">
								<input type="checkbox" value="1" name="b_type[]" >컴퓨터
								<input type="checkbox" value="2" name="b_type[]" >전자레인지	
								<input type="checkbox" value="3" name="b_type[]" >에어프라이기						
								<input type="checkbox" value="4" name="b_type[]" >TV
								<input type="checkbox" value="5" name="b_type[]" >세탁기
								<input type="checkbox" value="6" name="b_type[]" >에어컨
								<input type="checkbox" value="7" name="b_type[]" >냉장고
								<input type="checkbox" value="8" name="b_type[]" >wi-fi
								<input type="checkbox" value="9" name="b_type[]" >식기
								<input type="checkbox" value="10" name="b_type[]" >주방도구
								<input type="checkbox" value="11" name="b_type[]" >수건
								<input type="checkbox" value="12" name="b_type[]" >침대
								<input type="checkbox" value="13" name="b_type[]" >책상
								<input type="checkbox" value="14" name="b_type[]" >서랍장
							</div>
							</ul>
						</div>
					</div>
				</div>
				<input type="button" value="초기위치 설정" ONCliCK="search()">
				<input type="text" id="juso" style="width: 150px; text-align: center;float: right;">
			</div>
			<div id="map"></div>
			<div class="move_location">
				<input type="button" value="설정한 위치로 이동" class="control-btn" ONCLICK="gotoMylocation()" >
				<!--지금은 동의대학교 정보관으러 설정해놓음-->
			</div>
			<script>
				var HOME_PATH = window.HOME_PATH || '.';
				var map = new naver.maps.Map("map", {
					center: new naver.maps.LatLng(35.1459, 129.0367), //동의대학교 정보관 좌표
					zoom: 15, // 초기 확대비율
					///maxBounds : 35.1459, 뭔지 모르겠다.
					disableDoubleClickZoom: false, //더블클릭으로 지도 확대
					tileDuration: 1200, // 줌 인/아웃시 hobor되는 시간, 클수록 느림
					mapTypeControl: true // 맵 건드리기 on
				});
				// 마커표시///////////////////////////////////////////////////////////////////////////////
				var markers = [];
				var A = 35.1459;
				var B = 129.0367;
				var q = 129.0936;
				var w = 35.2644;
				var position = new naver.maps.LatLng(A, B);
				var position2 = new naver.maps.LatLng(w, q);
				var marker = new naver.maps.Marker({
					map: map,
					position: position
				});
				var m1arker = new naver.maps.Marker({
					map: map,
					position: position2
				});
				markers.push(marker);
				/////////////////////////////////////////위치이동설정///////////////////////////////////////////////////////////////////////////////
				//var deu = new naver.maps.LatLng(35.1459, 129.0367) // 동의대 좌표번호
				function gotoMylocation() {
					//  map.panTo(deu);//이동 부드럽게
					// map.setZoom(17, true); //줌레벨설정
					var juso = document.getElementById("juso").value;
					naver.maps.Service.geocode({
							query: juso
					}, function (status, response) {
							if (status !== naver.maps.Service.Status.OK) {
								return alert('Something wrong!');
							}
							var htmlAddresses = [],
							item = response.v2.addresses[0],
							point = new naver.maps.Point(item.x, item.y);
							var address_x = item.y;//xy좌표 반대로 입력해야함
							var address_y = item.x;//xy좌표 반대로 입력해야함
							var position = new naver.maps.LatLng(address_x, address_y);
							map.morph(position, 15); //설정한위치로 줌+이동
					});
							
				}
				/////////////////////////////////////////////////////////////////////////////////////////
				//////////////////////////////////클릭으로검색////////////////////////////////////////////
				var infoWindow = new naver.maps.InfoWindow({
					anchorSkew: true
				});
	
				map.setCursor('pointer');
	
					//*///검색기능
				function search() {
					var juso = document.getElementById("juso").value;
					naver.maps.Service.geocode({
					query: juso
					}, function (status, response) {
							if (status !== naver.maps.Service.Status.OK) {
								return alert('Something wrong!');
							}
							var htmlAddresses = [],
							item = response.v2.addresses[0],
							point = new naver.maps.Point(item.x, item.y);
							var address_x = item.y;//xy좌표 반대로 입력해야함
							var address_y = item.x;//xy좌표 반대로 입력해야함
							var position = new naver.maps.LatLng(address_x, address_y);
							var newmarker = new naver.maps.Marker({
								map: map,
								position: position
							});
							map.setCenter(point);
							markers.push(newmarker);
						});
				}
			</script>		
		</div>
		
	</div>
	
	<!-- //typography-page -->
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