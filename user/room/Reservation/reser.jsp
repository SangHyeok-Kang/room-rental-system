<%@page language="java" contentType="text/html" pageEncoding="utf-8" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.util.*" %>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" />

<%
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    StringBuilder stb = new StringBuilder();
    String jdbcDriver = "jdbc:mysql://211.213.95.123:33060/cloud?serverTimezone=UTC";
    String dbUser = "20183109"; //mysql id
    String dbPass = "1q2w3e4r"; //mysql password
    conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
    
   String room_num= request.getParameter("room_num");
   String reser_num= request.getParameter("reser_num");
   String user = (String)session.getAttribute("MEMBERID");
   stb.append("select * from user left outer join room on user.user_num =room.user_num where room.room_num= \"").append(room_num).append("\"");
    String sql = stb.toString();
    stmt = conn.createStatement();
    rs = stmt.executeQuery(sql);
    rs.next();
    String micro=rs.getString("microwave");
    String airfy=rs.getString("airfryer");
    String tv=rs.getString("tv");
    String laund=rs.getString("laundry");
    String aircon=rs.getString("airconditioner");
    String refri=rs.getString("refrigerator");
    String wifi=rs.getString("wifi");
    String table=rs.getString("tableware");
    String kitchen=rs.getString("kitchentools");
    String tow=rs.getString("towel");
    String bed=rs.getString("bed");
    String drawer=rs.getString("drawer");
    String desk=rs.getString("desk");
    String com=rs.getString("computer");
    String notice =rs.getString("notice");
    String start_time = rs.getString("start_time");
    String end_time = rs.getString("end_time");
    String price = rs.getString("price");
    String drink = rs.getString("drink");
    String smoke = rs.getString("smoke");
    String first_name= rs.getString("first_name");
    String last_name= rs.getString("last_name");
    String name = first_name.concat(last_name);
    String city = rs.getString("city");
    String gu = rs.getString("gu");
    String ro = rs.getString("ro");
    String d_address = rs.getString("d_address");
    StringBuilder stbaddress = new StringBuilder();
    stbaddress.append(city).append(" ").append(gu).append(" ").append(ro).append(" ").append(d_address);
    String address = stbaddress.toString();    
%>

<!-- 데이터 베이스를 읽어오는 코드블록 -->

<!DOCTYPE html>
<html>

<head>
   <title>내방어때?</title>
   
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
<!-- banner -->
 
<div class="container">
        <div class="tabs">
            <div id="subtitleCon">
                <div class="subTitle" style="padding-top: 10px; height: 45px; width:100%;">
                    <ul>
                        <li style="float: left; width: 17%; white-space: nowrap; overflow: hidden; 
                  text-overflow: ellipsis; font-size: 25px ;background-color:#ff7609; border-radius:10px;
                   color:#f5f5f5; margin-left:5%; margin-top:1%;margin-bottom:2%" id="CurrentMenuTitle">예약세부정보
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
                   
                   
                        <tr>
                            <th style="text-align: left;color:#333;text-align: center;background-color:#fef5ef;"
                                scope="col">방 번호
                            </th>
                            <td colspan="5" style="text-align: left;padding:1%" id = "room_num">
                            </td>
                        </tr>
                        <tr>
                            <th style="text-align: left;color:#333;text-align: center;background-color:#fef5ef;"
                                scope="col">방 주인
                            </th>
                            <td style="text-align: left;padding:1%" id = "name"></td>
                            <th style=" text-align: left;color:#333;text-align: center;background-color:#fef5ef;">방 위치</th>
                            <td style="width: 100%; text-align: left;padding:1%" id="address"></td>
                        </tr>

                        <tr style="height:400px">
                            <th style="text-align: left;color:#333;text-align: center; background-color:#fef5ef ;"
                                scope="col">세부 정보
                            </th>
                             
                            <td height="200" colspan="5" style="text-align: left;padding:1%" >
                                <table  id = "option" >
                                </table>
                                

                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div style="float: left; width: 100%; text-align: center; margin-top: 3%; margin-bottom:15px;">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tbody>
                    <tr>
                        <td width="15%" align="left"><span class="btn_pack medium">
                            <a href='#'onclick='history.back();'>목록</a></span>
                        </td>
                    </tr>
                        
                </tbody>
                
            </table>
            <button style="width: 10%;background-color: #ffd7b4;border: solid 2px #ff895c69;border-radius: 10px;">
                <a style="color: black;" onclick="writereview()">리뷰 등록</a>
            </button>
            <button style="width: 10%;background-color: #ffd7b4;border: solid 2px #ff895c69;border-radius: 10px;">
                <a style="color: black;" onclick="cancel()">예약 취소</a>
            </button>
            
        </div>
    </div>
</div>

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
<script>
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
var drawer = "<%= drawer %>" ;
var start_time = "<%= start_time %>" ;
var end_time = "<%= end_time %>" ;
document.getElementById("address").innerHTML="<%=address%>";
document.getElementById("name").innerHTML="<%=name%>";
document.getElementById("room_num").innerHTML="<%=room_num%>";
const table1 = document.getElementById('option');

if (drink==1){
    const newRow = table1.insertRow();
  const newCell1 = newRow.insertCell(0);
  newCell1.innerText = "⚫ 음주가능";
}
else 
{
    const newRow = table1.insertRow();
  const newCell1 = newRow.insertCell(0);
  newCell1.innerText = "⚫ 음주 불가능";
}
if (smoke==1){
    const newRow = table1.insertRow();
  const newCell1 = newRow.insertCell(0);
  newCell1.innerText = "⚫ 흡연가능";
}
else 
{
    const newRow = table1.insertRow();
  const newCell1 = newRow.insertCell(0);
  newCell1.innerText = "⚫ 흡연 불가능";
}
if (airfy==1){
    const newRow = table1.insertRow();
  const newCell1 = newRow.insertCell(0);
  newCell1.innerText = "⚫ 에어프라이기 보유";
}
if (com==1){
    const newRow = table1.insertRow();
  const newCell1 = newRow.insertCell(0);
  newCell1.innerText = "⚫ 컴퓨터 보유";
}
if (desk==1){
    const newRow = table1.insertRow();
  const newCell1 = newRow.insertCell(0);
  newCell1.innerText = "⚫ 책상 보유";
}
if (kitchen==1){
    const newRow = table1.insertRow();
  const newCell1 = newRow.insertCell(0);
  newCell1.innerText = "⚫ 주방도구 보유";
}
if (refri==1){
    const newRow = table1.insertRow();
  const newCell1 = newRow.insertCell(0);
  newCell1.innerText = "⚫ 냉장고 보유";
}
if (drawer==1){
    const newRow = table1.insertRow();
  const newCell1 = newRow.insertCell(0);
  newCell1.innerText = "⚫ 서랍 보유";
}
if (micro==1){
    const newRow = table1.insertRow();
  const newCell1 = newRow.insertCell(0);
  newCell1.innerText = "⚫ 전자레인지 보유";
}
if (bed==1){
    const newRow = table1.insertRow();
  const newCell1 = newRow.insertCell(0);
  newCell1.innerText = "⚫ 챔대 보유";
}
if (tow==1){
    const newRow = table1.insertRow();
  const newCell1 = newRow.insertCell(0);
  newCell1.innerText = "⚫ 수건 보유";
}
if (wifi==1){
    const newRow = table1.insertRow();
  const newCell1 = newRow.insertCell(0);
  newCell1.innerText = "⚫ WIFI 보유";
}
if (aircon==1){
    const newRow = table1.insertRow();
  const newCell1 = newRow.insertCell(0);
  newCell1.innerText = "⚫ 에어컨 보유";
}
if (laund==1){
    const newRow = table1.insertRow();
  const newCell1 = newRow.insertCell(0);
  newCell1.innerText = "⚫ 세탁기 보유";
}
if (table==1){
    const newRow = table1.insertRow();
  const newCell1 = newRow.insertCell(0);
  newCell1.innerText = "⚫ 테이블 보유";
}
if (tv==1){
    const newRow = table1.insertRow();
  const newCell1 = newRow.insertCell(0);
  newCell1.innerText = "⚫ TV 보유";
}
function writereview(){
   var pop = window.open("review.jsp?room_num="+"<%=room_num%>"+"", "pop", "width=500,height=250, scrollbars=yes, resizable=yes");
}
function cancel(){
   var pop = window.open("cancel_reser.jsp?reser_num="+"<%=reser_num%>"+"", "_self", "width=500,height=250, scrollbars=yes, resizable=yes");
}
</script>
<!-- //for bootstrap working -->
</body>
</html>