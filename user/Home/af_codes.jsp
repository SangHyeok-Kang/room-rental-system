<%@ page language="java" contentType ="text/html" pageEncoding="utf-8" %>
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
<meta name="keywords" content="Sea King Restaurant Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
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

<iframe width=0 height=0 name="hiddenframe1" style="display:none;"></iframe>
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
						<li class="active"><a href="/user/Home/af_codes.jsp">방 검색 및 예약</a></li>
						<li><a href="/user/Home/af_blog.jsp">공지사항</a></li>
						<li><a href="/user/Home/af_contact.jsp">1:1문의 내역</a></li>
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
								<input type="checkbox" value="com" name="b_type" >컴퓨터
   								<input type="checkbox" value="micro" name="b_type" >전자레인지	
   								<input type="checkbox" value="airfy" name="b_type" >에어프라이기						
   								<input type="checkbox" value="tv" name="b_type" >TV
      							<input type="checkbox" value="laund" name="b_type" >세탁기
   								<input type="checkbox" value="aircon" name="b_type" >에어컨
    							<input type="checkbox" value="refri" name="b_type" >냉장고
   								<input type="checkbox" value="wifi" name="b_type" >wi-fi
   								<input type="checkbox" value="tableware" name="b_type" >식기
   								<input type="checkbox" value="kitchen" name="b_type" >주방도구
    							<input type="checkbox" value="tow" name="b_type" >수건
   								<input type="checkbox" value="bed" name="b_type" >침대
   								<input type="checkbox" value="desk" name="b_type" >책상
   								<input type="checkbox" value="drawer" name="b_type" >서랍장
								<input type="hidden" id ="entX" name="entX" value="none">
                                <input type="hidden"  id ="entY"name="entY" value="none">
								<input type="button" value="조건 검색" onclick="searchdatabase()">
						</div>
						</ul>
					</div>
				</div>
			</div>
			<input type="button" value="초기위치 설정" ONCliCK="goPopup()">
			<input type="text" id="roadAddrPart1" style="width: 150px; text-align: center;float: right; color:black;" readonly>
		</div>
		<div id="map"></div>
		<div class="move_location">
			<input type="button" value="설정한 위치로 이동" class="control-btn" ONCLICK="gotoMylocation()" >
			<!--지금은 동의대학교 정보관으러 설정해놓음-->
		</div>
		<script>
			var markers = [],
			 infoWindows = [];
			 let  appendAddress=[];
			var valueofx;
			var valueofy;
			var HOME_PATH = window.HOME_PATH || '.';
			var map = new naver.maps.Map("map", {
				center: new naver.maps.LatLng(35.1459, 129.0367), //동의대학교 정보관 좌표
				zoom: 15, // 초기 확대비율
				disableDoubleClickZoom: false, //더블클릭으로 지도 확대
				tileDuration: 1200, // 줌 인/아웃시 hobor되는 시간, 클수록 느림
				mapTypeControl: true // 맵 건드리기 on
			});
			var p= new naver.maps.LatLng(35.1459, 129.0367);
			   var locationmakrer = new naver.maps.Marker({
						map: map,
						position:p
					});	
			/////////////////////////////////////////위치이동설정///////////////////////////////////////////////////////////////////////////////
			//var deu = new naver.maps.LatLng(35.1459, 129.0367) // 동의대 좌표번호
			function gotoMylocation() {
				//  map.panTo(deu);//이동 부드럽게
				// map.setZoom(17, true); //줌레벨설정
				var juso = document.getElementById("roadAddrPart1").value;
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
			function searchdatabase() {
				const query = 'input[name="b_type"]:checked';
				const selectedEls = document.querySelectorAll(query);
				let result = '';
				var a=[];
				  selectedEls.forEach((el) => {
					result += el.value + ' ';
				  });
				  
				var rt = window.open("../room/Reservation/searchdb.jsp?y="+document.getElementById("entY").value+"&x="+document.getElementById("entX").value+"&option="+result,"hiddenframe1","width=100px,height=100px, scrollbars=yes, resizable=yes"); //db검색
				a=result.split(" ");
			}
			map.setCursor('pointer');
			function goPopup() {
				var pop = window.open("jusoPopup.jsp", "pop", "width=570,height=420, scrollbars=yes, resizable=yes");
			}
			
			function dbCallBack(juso_list,juso_x,juso_y,money,start_time,end_time,city,gu,ro,d_address,room_num){
				
				markers.length = 0; //마커초기화
				infoWindows.length = 0; //infowindow 출력 초기화
				appendAddress.length=0;
				juso_list = juso_list.replace("[","");
				juso_list = juso_list.replace("]","");
				//alert(juso_list);
				juso_x = juso_x.replace("[","");
				juso_x = juso_x.replace("]","");
				juso_y = juso_y.replace("[","");
				juso_y = juso_y.replace("]","");
				money = money.replace("[","");
				money = money.replace("]","");
				end_time = end_time.replace("[","");
				end_time = end_time.replace("]","");
				start_time = start_time.replace("[","");
				start_time = start_time.replace("]","");
				city = city.replace("[","");
				city = city.replace("]","");
				gu = gu.replace("[","");
				gu = gu.replace("]","");
				ro = ro.replace("[","");
				ro = ro.replace("]","");
				d_address = d_address.replace("[","");
				d_address = d_address.replace("]","");
				room_num = room_num.replace("[","");
				room_num = room_num.replace("]","");
				var list_x = juso_x.split(",");
				var list_y = juso_y.split(",");
				var list_money = money.split(",");
				var list_end_time = end_time.split(",");
				var list_start_time = start_time.split(",");
				var list_city = city.split(",");
				var list_gu = gu.split(",");
				var list_ro = ro.split(",");
				var list_d_address = d_address.split(",");
				var list_room_num = room_num.split(",");
				for (let index = 0; index < list_x.length; index++) {
					appendAddress[index] = list_city[index]+' '+ list_gu[index] + ' '+ list_ro[index] +' '+list_d_address[index];
					list_room_num[index].trim();
					var position = new naver.maps.LatLng(list_x[index], list_y[index]);
					var newmarker = new naver.maps.Marker({
						map: map,
						position: position
					});	
					var infoWindow = new naver.maps.InfoWindow({
						content: '<div style="width:100%; height: 50%;text-align:center;padding:5%font-size: 15px"><a href="http://cloud2022.kro.kr/user/room/Reservation/reservation.jsp?room_num='+list_room_num[index].trim()+'" target="_self">주소 : '+ appendAddress[index]+'<br>가격 :'+list_money[index]+'<br>체크 인 시간 :'+list_start_time[index]+'<br>체크 아웃 시간 :'+list_end_time[index]+'</a></div>'
					});
					markers.push(newmarker);
					
					infoWindows.push(infoWindow);
					naver.maps.Event.addListener(newmarker, 'click', getClickHandler(markers.length-1));
					
				}				
				
				
			}
			function searchdbCallBack(juso_list,juso_x,juso_y,money,start_time,end_time,city,gu,ro,d_address,room_num,run){
					//alert(run);
						
				for(let index = 0; index < markers.length; index++){
						markers[index].setMap(null);
				}
				markers.length = 0; //마커초기화
				//alert(juso_x);
				infoWindows.length = 0; //infowindow 출력 초기화
				appendAddress.length=0;
				juso_x = juso_x.replace("[","");
				juso_x = juso_x.replace("]","");
				juso_y = juso_y.replace("[","");
				juso_y = juso_y.replace("]","");
				money = money.replace("[","");
				money = money.replace("]","");
				end_time = end_time.replace("[","");
				end_time = end_time.replace("]","");
				start_time = start_time.replace("[","");
				start_time = start_time.replace("]","");
				city = city.replace("[","");
				city = city.replace("]","");
				gu = gu.replace("[","");
				gu = gu.replace("]","");
				ro = ro.replace("[","");
				ro = ro.replace("]","");
				d_address = d_address.replace("[","");
				d_address = d_address.replace("]","");
				room_num = room_num.replace("[","");
				room_num = room_num.replace("]","");
				
				var list_x = juso_x.split(",");
				var list_y = juso_y.split(",");
				var list_money = money.split(",");
				var list_end_time = end_time.split(",");
				var list_start_time = start_time.split(",");
				var list_city = city.split(",");
				var list_gu = gu.split(",");
				var list_ro = ro.split(",");
				var list_d_address = d_address.split(",");
				var list_room_num = room_num.split(",");
				//var a = list[0].split(" ");
				for (let index = 0; index < list_x.length; index++) {
					appendAddress[index] = list_city[index]+' '+ list_gu[index] + ' '+ list_ro[index] +' '+list_d_address[index];
					list_room_num[index].trim();//공백제거
					//alert(list[1]);	
						//var point = new naver.maps.Point(list_x,list_y);
						//var latlng = new naver.maps.LatLng(item.y, item.x); // 서울시청 위/경도 좌표
						//var utmk = naver.maps.UTMKCoord.fromLatLngToUTMK(latlng); // 위/경도 -> UTMK								
					//var address_x = item.y;//xy좌표 반대로 입력해야함
					//var address_y = item.x;//xy좌표 반대로 입력해야함
					//var position = new naver.maps.Point(latlng);
					//var set = naver.maps.UTMKCoord.fromCoordToLatLng(utmk);	// UTMK -> 위/경도
					var position = new naver.maps.LatLng(list_x[index], list_y[index]);
					var newmarker = new naver.maps.Marker({
						map: map,
						position: position
					});	
					var infoWindow = new naver.maps.InfoWindow({
						content: '<div style="width:100%; height: 50%;text-align:center;padding:5%font-size: 15px"><a href="http://cloud2022.kro.kr/user/room/Reservation/reservation.jsp?room_num='+list_room_num[index]+'" target="_self">주소 : '+ appendAddress[index]+'<br>가격 :'+list_money[index]+'<br>체크 인 시간 :'+list_start_time[index]+'<br>체크 아웃 시간 :'+list_end_time[index]+'</a></div>'
					});
					markers.push(newmarker);
					
					infoWindows.push(infoWindow);
					naver.maps.Event.addListener(newmarker, 'click', getClickHandler(markers.length-1));
					
				}		
			}
			function getClickHandler(i) {
					return function(e) {
					var marker = markers[i],
					infoWindow = infoWindows[i];
					//infoWindow = infoWindows[i];
					if (infoWindow.getMap()) {
					infoWindow.close();
					} else {
					infoWindow.open(map, marker);
							}
						}
					}
			function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail, roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn
				, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo,entX,entY,juso_list) {
					markers.length = 0; //마커초기화
				
				// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
				locationmakrer.setMap(null);
				document.getElementById("roadAddrPart1").value = roadAddrPart1;
				naver.maps.Service.geocode({
						query: roadAddrPart1
					}, function (status, response) {
				  if (status === naver.maps.Service.Status.ERROR) {
				if (!address) {
					return alert('Geocode Error, Please check address');
					   }
				return alert('Geocode Error, address:' + address);
					}
				if (response.v2.meta.totalCount === 0) {
						return alert('주소를 다시 입력해주세요');
				}
				});			
					var juso = document.getElementById("roadAddrPart1").value;
					naver.maps.Service.geocode({
					query: juso,
					}, function (status, response) {
					if (status !== naver.maps.Service.Status.OK) {
						return alert('Something wrong!');
					}							
					var htmlAddresses = [],
						item = response.v2.addresses[0],
						point = new naver.maps.Point(item.x, item.y);
					
						var latlng = new naver.maps.LatLng(item.y, item.x); 
					var dksehla = new naver.maps.Point(entY, entX);
					
					var test = 	naver.maps.UTMKCoord.fromCoordToLatLng(dksehla);
					var utmk = new naver.maps.Point(entX,entY);
					var utmktocooord = 	naver.maps.UTMKCoord.fromCoordToLatLng(utmk);
					var address_x = item.y;//xy좌표 반대로 입력해야함
					var address_y = item.x;//xy좌표 반대로 입력해야함
					document.getElementById("entX").value = item.y;
					document.getElementById("entY").value = item.x;
					valueofx=item.y;
					valueofy=item.x;
					var position = new naver.maps.LatLng(latlng);
					locationmakrer = new naver.maps.Marker({
						map: map,
						position: position
					});			
					map.setCenter(point);
					var infoWindow = new naver.maps.InfoWindow({
						content: '<div style="color:black; width:100%;text-align:center;padding:5%font-size: 15px ">'+roadAddrPart1+'</div>'
					});
					var rt = window.open("usedb.jsp?y="+item.x+"&x="+item.y,"hiddenframe1","width=0,height=0, scrollbars=yes, resizable=yes"); //db검색	
					naver.maps.Event.addListener(locationmakrer, 'click', getlocationClickHandler());
					function getlocationClickHandler() {
					return function(e) {
					var marker = locationmakrer;
					//infoWindow = infoWindows[i];
					if (infoWindow.getMap()) {
					infoWindow.close();
					} else {
					infoWindow.open(map, marker);
							}
						}
					}
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