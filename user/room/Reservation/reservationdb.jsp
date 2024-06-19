<%@page language="java" contentType="text/html" pageEncoding="utf-8" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.util.*" %>
<%@ page import="java.sql.PreparedStatement" %>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" />

<%
    request.setCharacterEncoding("UTF-8");
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    String dayorhour=request.getParameter("dayorhour");
    PreparedStatement pstmt =null;
    StringBuilder stb = new StringBuilder();
    String jdbcDriver = "jdbc:mysql://211.213.95.123:33060/cloud?serverTimezone=UTC";
    String dbUser = "20183109"; //mysql id
    String dbPass = "1q2w3e4r"; //mysql password
    conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
    String startday= request.getParameter("startday");
    startday = startday.concat(" ");
    String endday= request.getParameter("endday");
    endday = endday.concat(" ");
    int user_num=0;
    String start= request.getParameter("start");
    String end= request.getParameter("end");
    if(!startday.equals(endday)){
        start= start.replace("%3A", ":");
        end= end.replace("%3A", ":");
        
    }
    else{
    start= start.replace("%3A", ":");
    start=start.concat(":00");
    end= end.replace("%3A", ":");
    end=end.concat(":00");
    }
    String start_day= startday.concat(start);
    String end_day= endday.concat(end);
    String r_number = request.getParameter("room_num");
    r_number = r_number.replace("+","");
    int room_num= Integer.parseInt(r_number);
    String reser_num="";
    String user = request.getParameter("id");
    String account_number = request.getParameter("accountnum");
    String bank = request.getParameter("bank_select");
    //stb.append("select * from user left outer join room on user.user_num =room.user_num where room.room_num= \"").append(room_num).append("\"");
    stb.append("select user_num from user where ID= \"").append(user).append("\"");
    String sql = stb.toString();
    stmt = conn.createStatement();
    rs = stmt.executeQuery(sql);
    if(rs.next()){
   user_num = rs.getInt("user_num");
    }
    else{
        out.println("<script>alert('본인의 아이디가 아닙니다 로그인한 아이디로 예약 부탁드립니다.');</script>"); //오류 창 출력
		out.println("<script>history.back();</script>");
    }

   rs.close();
   stmt.close();
   Random random = new Random();
   int rand = random.nextInt(300)+100;				
    String search = "select * from reservation where reser_num =" + rand;
    stmt = conn.createStatement();
   rs= stmt.executeQuery(search);

   while(true){
       if(rs.isBeforeFirst()==true){
           rand = random.nextInt(300)+100;
       }
       else break;
   } 
   if(dayorhour.equals("0")){
    sql ="insert into reservation (reser_num, room_num, user_num, start_time, end_time) values(?, ?, ?, ?, ?)";
    pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1, rand);
    pstmt.setInt(2, room_num);
    pstmt.setInt(3, user_num);
    pstmt.setString(4, start_day);
    pstmt.setString(5, end_day);
    int i=0;
    i =pstmt.executeUpdate();
   }
   else {
       sql = "UPDATE room SET sale = 0 where room_num= ?";
       pstmt = conn.prepareStatement(sql);
       pstmt.setInt(1, room_num);
       int i=0;
       i =pstmt.executeUpdate();
       sql ="insert into reservation (reser_num, room_num, user_num, start_time, end_time) values(?, ?, ?, ?, ?)";
    pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1, rand);
    pstmt.setInt(2, room_num);
    pstmt.setInt(3, user_num);
    pstmt.setString(4, start_day);
    pstmt.setString(5, end_day);
    i =pstmt.executeUpdate();
   }
   pstmt.close();
   
   sql = "select * from account where user_num ="+ user_num;
   stmt = conn.createStatement();
   rs= stmt.executeQuery(sql);
   if(!rs.next()){
    sql = "insert into account(user_num , bank_name, account_num) values(?,?,?)";
    pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1, user_num);
    pstmt.setString(2, bank);
    pstmt.setString(3, account_number);
    pstmt.executeUpdate();
   }
   out.println("<script>alert('예약 완료 되었습니다.');</script>");
   out.println("<script>location.href='/user/Home/af_codes.jsp';</script>");


  %>

<!-- 데이터 베이스를 읽어오는 코드블록 -->

<!DOCTYPE html>
<html>
    <body onload="init();">

<!-- //footer -->
<!-- for bootstrap working -->
<script>
    function init(){
       window.close();
    }
    </script>
<!-- //for bootstrap working -->
</body>
</html>