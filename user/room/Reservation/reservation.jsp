
<%@ page import ="java.sql.DriverManager" %>
<%@ page import ="java.sql.Connection" %>
<%@ page import ="java.sql.Statement" %>

<%@ page import ="java.sql.ResultSet" %>
<%@ page import ="java.sql.SQLException" %>
<%@ page import ="java.util.*" %>
<%@ page import ="java.text.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/proj4js/2.8.0/proj4.js" integrity="sha512-ha3Is9IgbEyIInSb+4S6IlEwpimz00N5J/dVLQFKhePkZ/HywIbxLeEu5w+hRjVBpbujTogNyT311tluwemy9w==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>지도보기</title>
<% 
         request.setCharacterEncoding("UTF-8");
         Class.forName("com.mysql.cj.jdbc.Driver");
         String micro="";
         String airfy="";
         String tv="";
         String laund="";
         String aircon="";
         String refri="";
         String wifi="";
         String kitchen="";
         String tow="";
         String bed="";
         String desk="";
         String com="";
          String table="";
         String drawer="";
         String start_time="";
         String city="";
         String drink="";
         String smoke="";
         String gu="";
         String ro="";
         String notice="";
         String price = "";
          String address="";
         String d_address="";
         String avgggrade="";
         String detail_add="";
         boolean check=true;
         String [] startdata = new String[3];
         String [] enddata = new String[3];
         String room_num = request.getParameter("room_num");
         ArrayList<String> reserStime = new ArrayList<String>(); 
         ArrayList<String> reserLtime = new ArrayList<String>(); 
         //String room_num = request.getParameter("room_num"); 
               Connection conn =null;
               Statement stmt =null; //sql문
                ResultSet rs =null; //select 문에서 가져오는 것
               try {                     
               String jdbcDriver ="jdbc:mysql://211.213.95.123:33060/cloud?serverTimezone=UTC";  
                    String dbUser ="20183207"; //mysql id
                    String dbPass ="1q2w3e4r"; //mysql password
                    StringBuilder stb = new StringBuilder();//보낼 쿼리문 작성을 위한 stb변수 생성  
                    stb.append("select * FROM room where room_num=\"").append(room_num).append("\"");
                    String query = stb.toString();  //StringBuilder를 string으로 변환
                    conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass); // db연결                    
                    stmt = conn.createStatement(); // Create Statement                   
                    rs = stmt.executeQuery(query); // 쿼리 실행
                    rs.next();
                    micro=rs.getString("microwave");
                    airfy=rs.getString("airfryer");
                    tv=rs.getString("tv");
                    laund=rs.getString("laundry");
                    aircon=rs.getString("airconditioner");
                    refri=rs.getString("refrigerator");
                    wifi=rs.getString("wifi");
                    table=rs.getString("tableware");
                    kitchen=rs.getString("kitchentools");
                    tow=rs.getString("towel");
                    bed=rs.getString("bed");
                    drawer=rs.getString("drawer");
                    desk=rs.getString("desk");
                    com=rs.getString("computer");
                    notice =rs.getString("notice");
                    StringBuilder appendjuso=new StringBuilder();
                    start_time = rs.getString("start_time");
                    String end_time = rs.getString("end_time");
                    price = rs.getString("price");
                    enddata=end_time.split(" ");
                    startdata = start_time.split(" ");
                    city = rs.getString("city");
                    gu = rs.getString("gu");
                    ro = rs.getString("ro");
                    drink = rs.getString("drink");
                    smoke = rs.getString("smoke");
                    d_address = rs.getString("d_address");
                    detail_add = rs.getString("detail_add");
                    appendjuso.append(city).append(" ").append(gu).append(" ").append(ro).append(" ").append(d_address).append(" ").append(detail_add);
                    address=appendjuso.toString();
                    StringBuilder getgrade = new StringBuilder();
                    getgrade.append("select avg(grade) FROM room_grade where room_num=\"").append(room_num).append("\"");
                    query = getgrade.toString();
                    conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass); // db연결                    
                    stmt = conn.createStatement(); // Create Statement                      
                    rs = stmt.executeQuery(query); // 쿼리 실행
                   
                    if (!rs.isBeforeFirst()) avgggrade = "6";
                    else {
                        rs.next();
                        avgggrade = rs.getString("avg(grade)");
                    }
                    StringBuilder getreserinfor = new StringBuilder();
                    getreserinfor.append("select * from reservation where room_num=\"").append(room_num).append("\"");
                    String abc=getreserinfor.toString();
                    query = getreserinfor.toString();
                    conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass); // db연결                    
                    stmt = conn.createStatement(); // Create Statement                      
                    rs = stmt.executeQuery(query); // 쿼리 실행
                    check = rs.isBeforeFirst();
                    while( rs.next()){
                    String s = rs.getString("start_time");
                    String l = rs.getString("end_time");
                    String [] ls = new String[3];
                    String [] ll = new String[3];
                    ls=s.split(" ");
                    ll=l.split(" ");
                    reserStime.add(ls[1]);
                    reserLtime.add(ll[1]);
                    }   
            } catch(SQLException ex) {
               // out.println(ex.getMessage());
                ex.printStackTrace();
            } finally {
                // Close Statement
                if (rs !=null) try { rs.close(); } catch(SQLException ex) {}
                if (stmt !=null) try { stmt.close(); } catch(SQLException ex) {}
                // Close Connection
                if (conn !=null) try { conn.close(); } catch(SQLException ex) {}
            }

            %>


   <script type="text/javascript"
      src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=62krrn2cvz&submodules=geocoder"></script>
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
            
                <a href="/user/Home/modInfo.jsp">개인정보 변경</a>
                
                <a href="/user/Home/check_reser.jsp">예약 내역확인</a>
                <a href="/user/Home/room_regis_check.jsp">내방 관리</a>
                <a href="/user/Home/af_report.jsp">신고 내역</a> 
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
                  <li><a href="/user/Home/af_contact.jsp">1:1문의 내역</a></li>
               </ul>

               
            </div><!-- /.navbar-collapse -->

         </nav>
      </div>
   </div>
<!-- //header -->
<!--typography-page -->
<div class="reservation">   
   <div class="res_size">
      <div id   ="content" class="detail motel_room">
         <div class="top">
            <div class="right">
               <div class="info">
                  <p class = "badge"></p>
               </div>
               <p class = "address" id = "address" >roomaddress </p>
            </div>
            <div class="comment">
               <strong>방주인 한마디</strong>
               <details>
                  <summary>더보기</summary>            
               <div class="clamp">
                     <p id = "clamp">누구든지 프리</p> 
               </details>
               </div>
            </div>
         </div>
         <div class="main">
            <input id="tab1" type="radio" name="tabs" checked> <!--디폴트 메뉴-->
            <label for="tab1">예약</label>
         
            <input id="tab2" type="radio" name="tabs">
            <label for="tab2">옵션</label>
         
            <input id="tab3" type="radio" name="tabs">
            <label for="tab3">리뷰</label>

            <section id="content1" style = "height: 1%;">
               <form action = "reservationdb.jsp">
               <!-- 이 안에 내용 -->
               <input type="hidden"  id ="room_num"name="room_num" value="none">
                  <div class="price">
                     <span class="p_body">가 격</span>
                     <span id = "price">원</span>
                  </div>
         
                  <div class="btn_date">   
                     <span class="form-date">날 짜</span>
                        <span class="date-body">
                           <input type = 'hidden' id = 'startdaycheck' value="0"/>
                           <input type = 'date' id = 'startday' name ="startday" onchange="scheck()" /> ~
                           <input type = 'date' id = 'lastday'  name="endday" onchange="lcheck()"/>   
                      </span>
                  </div>
                  <div class="btn_date">   
                     <span class="form-date" id="tlrks" >시간 </span>
                        <span id="showhour">
                           <input class="hour"id="1" type="button" name="hour" value="01:00" onclick="setreservation(1)"/>
                           <input class="hour"id="2" type="button" name="hour" value="02:00"onclick="setreservation(2)"/>
                           <input class="hour"id="3" type="button" name="hour" value="03:00"onclick="setreservation(3)"/>
                           <input class="hour"id="4" type="button" name="hour" value="04:00"onclick="setreservation(4)"/>
                           <input class="hour"id="5" type="button" name="hour" value="05:00"onclick="setreservation(5)"/>
                           <input class="hour"id="6" type="button" name="hour" value="06:00"onclick="setreservation(6)"/>
                           <input class="hour"id="7" type="button" name="hour" value="07:00"onclick="setreservation(7)"/>
                           <input class="hour"id="8" type="button" name="hour" value="08:00"onclick="setreservation(8)"/>
                           <input class="hour"id="9" type="button" name="hour" value="09:00"onclick="setreservation(9)"/>
                           <input class="hour"id="10" type="button" name="hour" value="10:00"onclick="setreservation(10)"/>
                           <input class="hour"id="11" type="button" name="hour" value="11:00"onclick="setreservation(11)"/>
                           <input class="hour"id="12" type="button" name="hour" value="12:00"onclick="setreservation(12)"/>
                           <input class="hour"id="13" type="button" name="hour" value="13:00"onclick="setreservation(13)"/>
                           <input class="hour"id="14" type="button" name="hour" value="14:00"onclick="setreservation(14)"/>
                           <input class="hour"id="15" type="button" name="hour" value="15:00"onclick="setreservation(15)"/>
                           <input class="hour"id="16" type="button" name="hour" value="16:00"onclick="setreservation(16)"/>
                           <input class="hour"id="17" type="button" name="hour" value="17:00"onclick="setreservation(17)"/>
                           <input class="hour"id="18" type="button" name="hour" value="18:00"onclick="setreservation(18)"/>
                           <input class="hour"id="19" type="button" name="hour" value="19:00"onclick="setreservation(19)"/>
                           <input class="hour"id="20" type="button" name="hour" value="20:00"onclick="setreservation(20)"/>
                           <input class="hour"id="21" type="button" name="hour" value="21:00"onclick="setreservation(21)"/>
                           <input class="hour"id="22" type="button" name="hour" value="22:00"onclick="setreservation(22)"/>
                           <input class="hour"id="23" type="button" name="hour" value="23:00"onclick="setreservation(23)"/>
                           <input class="hour"id="24" type="button" name="hour" value="24:00"onclick="setreservation(24)"/>
                           <input class="hour"id="count" type="hidden" name="count" value="0"/>
                           <input class="hour"id="starthour" type="hidden" name="start" value="0"/>
                           <input class="hour"id="endhour" type="hidden" name="end" value="0"/>
                           <input class="hour"id="dayorhour" type="hidden" name="dayorhour" value="0"/>
                           <!--hidden값으로 쿼리 넘겨주기 설정하기-->
                           </span>
                  </div>
                  <div class = "user">
                     <span class="user_id">최종 가격</span>
                     <span class="user-body">
                        <input class="text_id" id="totalprice" type="text" placeholder="시간을 선택하세요." value="" / readonly> </span> 원
                     </div>
                  <div class = "user">
                     <span class="user_id">아이디</span>
                     <span class="user-body">
                        <input class="text_id" type="text" name ="id"placeholder="아이디를 입력하세요." value="" / required> </span>
                     </div>
                     <div class="user_phone">
                     
                        <span class="u_phone">휴대폰 번호</span>
                        <span class="user-body2">
                           <div class="first-num">
                              <select name="p_num">
                                 <option value="010" >010</option>
                                 <option value="011" >011</option>
                                 <option value="016" >016</option>
                                 <option value="017" >017</option>
                                 <option value="018" >018</option>
                                 <option value="019" >019</option>
                              </select> -
                           </div>
                           <input class="ph_num"type="text" name="middle_num" value="" required minlength = 4 maxlength="4"> -
                           <input class="ph_num"type="text" name="last_num" value="" required minlength = 4 maxlength="4">
                        
                        </span>
                     </div>
                        <div class="Account">
                           <div class="ac_bank">
                           <span class="bank">거래 은행</span>
                           <span class="bank-body">
                              <div class="bank_name">
                                 <select name="bank_select">
                                    <option value="">선택</option>
                                    <option value="한국은행">한국은행</option><option value="산업은행">산업은행</option><option value="기업은행">기업은행</option><option value="국민은행">국민은행</option><option value="외환은행">외환은행</option><option value="수협중앙회">수협중앙회</option><option value="수출입은행">수출입은행</option><option value="농협중앙회">농협중앙회</option><option value="단위농협(축협)">단위농협(축협)</option><option value="우리은행">우리은행</option><option value="SC제일은행">SC제일은행</option><option value="한국씨티은행">한국씨티은행</option><option value="새마을금고">새마을금고</option><option value="신협중앙회">신협중앙회</option><option value="우체국">우체국</option><option value="하나은행">하나은행</option><option value="신한은행">신한은행</option><option value="대구은행">대구은행</option><option value="부산은행">부산은행</option><option value="광주은행">광주은행</option><option value="제주은행">제주은행</option><option value="전북은행">전북은행</option><option value="경남은행">경남은행</option><option value="상호저축은행">상호저축은행</option><option value="산림조합중앙회">산림조합중앙회</option><option value="케이뱅크">케이뱅크</option><option value="카카오뱅크">카카오뱅크</option>                                        </select>
                              </div>
                           </span>
                        </div>
                           <div class="b_name">
                              <span class="send">예금주</span>
                                 
                                 <input type="text" id="ba_name" name="ba_name" placeholder="이름을 입력하세요." value="" / required ">
                                 
                           </div>
                        </div>
                        
                        <div class="a_num">
                           <span class="acc_num">계좌 번호</span>
                              <input class="acc-text" type="text" name="accountnum" placeholder="숫자만 입력하세요." value="" / required>                  
                        </div>   
                        <div class="res_check">
                           <button class="res_btn" type="submit" >예약하기</button>
                           <button class="res_btn2" type="submit" onclick="location.href ='/user/Home/index.jsp'; ">돌아가기</button>
                        </div>
                     </form>
                     </section>
         
            <section id="content2" style="height: 50%;">
             
               <div style ="width:80%; margin-left:15%; height:90%;">
               <img class="options" style = "width: 10%; height: 20%;margin:5%;"id = "smoke"src="/images/smoke.png" alt="smoke"> 
               <img class="options" style = "width: 10%; height: 20%;margin:5%"id = "drink"src="/images/drink.png" alt="drink">
               <img class="options" style = "width: 10%; height: 20%;margin:5%;"id = "com"src="/images/com.png" alt="com"> 
               <img class="options" style = "width: 10%; height: 20%;margin:5%"id = "micro"src="/images/micro.png" alt="micro">
               <img class="options" style = "width: 10%; height: 20%;margin:5%"id = "airfy"src="/images/airfy.png" alt="airfy">
               <img class="options" style = "width: 10%; height: 20%;margin:5%"id = "tv"src="/images/tv.png" alt="tv">
               <img class="options" style = "width: 10%; height: 20%;margin:5%;"id = "refri"src="/images/refri.png" alt="refri"> 
               <img class="options" style = "width: 10%; height: 20%;margin:5%"id = "laund"src="/images/laund.png" alt="laund">
               <img class="options" style = "width: 10%; height: 20%;margin:5%;"id = "wifi"src="/images/wifi.png" alt="wifi"> 
               <img class="options" style = "width: 10%; height: 20%;margin:5%"id = "aircon"src="/images/aircon.png" alt="aircon">
               <img class="options" style = "width: 10%; height: 20%;margin:5%;"id = "table"src="/images/table.png" alt="tableware"> 
               <img class="options" style = "width: 10%; height: 20%;margin:5%"id = "kitchen"src="/images/kitchen.png" alt="kitchen">
               <img class="options" style = "width: 10%; height: 20%;margin:5%;"id = "tow"src="/images/tow.png" alt="tow"> 
               <img class="options" style = "width: 10%; height: 20%;margin:5%"id = "bed"src="/images/bed.png" alt="bed">
               <img class="options" style = "width: 10%; height: 20%;margin:5%"id = "desk"src="/images/desk.png" alt="desk">
               <img class="options" style = "width: 10%; height: 20%;margin:5%"id = "drawer"src="/images/drawer.png" alt="drawer">
               </div>   
            </section>
         
            <section id="content3">
              
               <img class="star" style = "width: 9%; height: 20%;margin:5%;"id = "star1"src="/images/nostar.png" alt="smoke"> 
               <img class="star" style = "width: 9%; height: 20%;margin:5%;"id = "star2"src="/images/nostar.png" alt="smoke"> 
               <img class="star" style = "width: 9%; height: 20%;margin:5%;"id = "star3"src="/images/nostar.png" alt="smoke"> 
               <img class="star" style = "width: 9%; height: 20%;margin:5%;"id = "star4"src="/images/nostar.png" alt="smoke"> 
               <img class="star" style = "width: 9%; height: 20%;margin:5%;"id = "star5"src="/images/nostar.png" alt="smoke"> 
               <br>
               <center>
               <h1 style="display:inline-block;" id ="grade">0.0</h1>
               <h1 style="display:inline-block;" id="grademax">/ 5</h1>
               </center>
            </section>
         
         
         </div>
         <!-- ------------ -->
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
<script src="/js/bootstrap.js"></script>
<!-- //for bootstrap working -->
<script language=javascript>
   var first_time;
   var last_time;
   var minstartday = "<%= startdata[0] %>" ;
   var maxlastday = "<%= enddata[0] %>" ;
   var mintime = "<%= startdata[1] %>" ;
   var maxtime = "<%= enddata[1] %>" ;
   var drink = "<%= drink %>" ;
   var smoke = "<%= smoke %>" ;
   var com = "<%= com %>" ;
   var tv = "<%= tv %>" ;
   var kitchen = "<%= kitchen %>" ;
   var aircon = "<%= aircon %>" ;
   var airfy = "<%= airfy %>" ;
   var com = "<%= com %>" ;
   var micro = "<%= micro %>" ;
   var refri = "<%= refri %>" ;
   var table = "<%= table %>" ;
   var tow = "<%= tow %>" ;
   var wifi = "<%= wifi %>" ;
   var desk = "<%= desk %>" ;
   var bed = "<%= bed %>" ;
   var laund = "<%= laund %>" ;
   var myArray3 ="<%= laund %>";
   var drawer = "<%= drawer %>" ;
   var grade =parseInt("<%=avgggrade%>");
   var reserStime ="<%= reserStime %>";
   var reserLtime ="<%= reserLtime %>";
   reserStime = reserStime.replace("[","");
   reserStime = reserStime.replace("]","");
   reserStime = reserStime.replace(",","");
   
   reserLtime = reserLtime.replace(",","");
   reserLtime = reserLtime.replace("[","");
   reserLtime = reserLtime.replace("]","");
   
   if(grade ==1 ){ 
      document.getElementById('star1').src = "/images/star.png";
   }
   else if(grade ==2 )
   { 
      document.getElementById('star1').src = "/images/star.png";
      document.getElementById('star2').src = "/images/star.png";
   }
   else if(grade ==3 ){ 
      document.getElementById('star1').src = "/images/star.png";
      document.getElementById('star2').src = "/images/star.png";
      document.getElementById('star3').src = "/images/star.png";
   }
   else if(grade ==4 ){ 
      document.getElementById('star1').src = "/images/star.png";
      document.getElementById('star2').src = "/images/star.png";
      document.getElementById('star3').src = "/images/star.png";
      document.getElementById('star4').src = "/images/star.png";
   }
   else if(grade ==5 ){ 
      document.getElementById('star1').src = "/images/star.png";
      document.getElementById('star2').src = "/images/star.png";
      document.getElementById('star3').src = "/images/star.png";
      document.getElementById('star4').src = "/images/star.png";
      document.getElementById('star5').src = "/images/star.png";
   }
   else { 
      document.getElementById('star1').style.display='none';
      document.getElementById('star2').style.display='none';
      document.getElementById('star3').style.display='none';
      document.getElementById('star4').style.display='none';
      document.getElementById('star5').style.display='none';
      document.getElementById("grade").style.display='none';
      document.getElementById("grademax").innerHTML="아직 방문한 사람이 없습니다! 먼저 방문하고 후기를 남겨주세요!";
   }
   
   if(smoke ==0 ) document.getElementById('smoke').src = "/images/nosmoke.png";
   if(drink ==0 ) document.getElementById('drink').src = "/images/nodrink.png";
   if(com ==0 ) document.getElementById("com").style.display='none';
   if(tv ==0 )document.getElementById("tv").style.display='none';
   if(wifi ==0 ) document.getElementById("wifi").style.display='none';
   if(laund ==0 ) document.getElementById("laund").style.display='none';
   if(airfy ==0 ) document.getElementById("airfy").style.display='none';
   if(kitchen ==0 ) document.getElementById("kitchen").style.display='none';
   if(tow ==0 ) document.getElementById("tow").style.display='none';
   if(bed ==0 ) document.getElementById("bed").style.display='none';
   if(desk ==0 ) document.getElementById("desk").style.display='none';
   if(aircon ==0 )document.getElementById("aircon").style.display='none';
   if(drawer ==0 ) document.getElementById("drawer").style.display='none';
   if(micro ==0 )document.getElementById("micro").style.display='none';
   if(refri ==0 )document.getElementById("refri").style.display='none';
   if(table ==0 )document.getElementById("table").style.display='none';
   document.getElementById("lastday").setAttribute("max", maxlastday);
   document.getElementById("startday").setAttribute("min",minstartday);
   document.getElementById("lastday").setAttribute("min", minstartday);
   document.getElementById("startday").setAttribute("max", maxlastday);
   document.getElementById("address").innerHTML ="<%=address%>";
   var r_num = "<%=room_num%>"
   r_num.replace("%20","");
   document.getElementById("room_num").value =r_num;
   document.getElementById("price").innerHTML="<%=price%>"+"원";
   document.getElementById("clamp").innerHTML="<%=notice%>"; 
   document.getElementById("grade").innerHTML="<%=avgggrade%>";
   document.getElementById("tlrks").style.display='none';
   
   var min_time = "<%= startdata[1] %>";
   
   var maxtime= "<%= enddata[1] %>"
   document.getElementById("starthour").value=min_time.substr(0,5);
   document.getElementById("endhour").value=maxtime.substr(0,5);
   min_time = min_time.substr(0,2);
   maxtime = maxtime.substr(0,2);
   var list_reserStime = reserStime.split(" ");
   var list_reserLtime = reserLtime.split(" ");
   var check ="<%=check%>";
   var startday;
   var lastday;
   var smonth;
   var lmonth;
   var sday;
   var lday;
   function scheck(){
      startday = document.getElementById("startday").value;
      document.getElementById("startdaycheck").value=1;
   }
   function lcheck(){
      lastday = document.getElementById("lastday").value;
      if(document.getElementById("startdaycheck").value==1){
         if(document.getElementById("lastday").getAttribute("min")!=document.getElementById("lastday").getAttribute("max")){
            if(startday>lastday){
                  var tmp = startday;
                  startday=lastday;
                  lastday=tmp;
               }
               smonth=startday.substr(5);
               lmonth=lastday.substr(5,7);
               sday=startday.substr(8);
               lday=lastday.substr(8);
               document.getElementById("tlrks").style.display='none';
               document.getElementById("showhour").style.display='none';
               document.getElementById("totalprice").value=(lday-sday+1)*"<%=price%>"*"24";
               document.getElementById("dayorhour").value =1;
            }
         else
         {
            //document.getElementById("showhour").style.display='inline-block';
            document.getElementById("tlrks").style.display='inline-block';
            for (let i = parseInt(min_time); i <= parseInt(maxtime); i++) {
               document.getElementById(eval(""+i+"")).style.display='inline-block';
            }
            if(check=="true"){
            for (let i = 0; i < list_reserStime.length; i++) {
                  var x=list_reserStime[i].substr(0,2);
                  var y=list_reserLtime[i].substr(0,2);
                  for (let j = x; j <= y; j++) {
                     document.getElementById(eval(""+j+"")).style.display='none';                  
               }
               
               }
            }
         }
   }
   }
   function setreservation(hour){
      var count = document.getElementById("count").value;
      if(count==0){
         document.getElementById("starthour").value= document.getElementById(eval(""+hour+"")).value;        
         first_time=hour; // 체크된 값
         document.getElementById("count").value=1;
      }
      else if(count==1){
         document.getElementById("endhour").value= document.getElementById(eval(""+hour+"")).value;  
         last_time=hour; // 체크된 값
         if(first_time>last_time){
            var tmp = first_time;
            first_time=last_time;
            last_time=tmp;
         }
         document.getElementById("totalprice").value=(last_time-first_time+1)*"<%=price%>";
      }
      
   }
   </script>
   
    
</body>
</html>