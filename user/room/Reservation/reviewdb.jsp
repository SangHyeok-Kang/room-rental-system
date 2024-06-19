<%@ page import ="java.sql.DriverManager" %>
<%@ page import ="java.sql.Connection" %>
<%@ page import ="java.sql.Statement" %>
<%@ page import ="java.sql.ResultSet" %>
<%@ page import ="java.sql.SQLException" %>
<%@ page import ="java.util.*" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/proj4js/2.8.0/proj4.js" integrity="sha512-ha3Is9IgbEyIInSb+4S6IlEwpimz00N5J/dVLQFKhePkZ/HywIbxLeEu5w+hRjVBpbujTogNyT311tluwemy9w==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<% 
   request.setCharacterEncoding("UTF-8");  //한글깨지면 주석제거
                Class.forName("com.mysql.cj.jdbc.Driver"); 
                Connection conn =null;
                Statement stmt =null; //sql문
                ResultSet rs =null; //select 문에서 가져오는 것
                try {                     
                    String jdbcDriver ="jdbc:mysql://211.213.95.123:33060/cloud?serverTimezone=UTC"; 
                    String dbUser ="20183207"; //mysql id
                    String dbPass ="1q2w3e4r"; //mysql password
                    StringBuilder stb = new StringBuilder();//보낼 쿼리문 작성을 위한 stb변수 생성
                    String room_num= request.getParameter("room_num");  
                    String review= request.getParameter("review");
                    stb.append("insert into room_grade (room_num,grade,user_num) values (").append(room_num).append(",").append(review).append(",1)");
                    String query = stb.toString();  //StringBuilder를 string으로 변환
                    conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass); // db연결                    
                    stmt = conn.createStatement(); // Create Statement                   
                    int colnum;
                    colnum = stmt.executeUpdate(query); // 쿼리 실행
                    
                    
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
</head>
<script language="javascript">
//opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("주소입력화면 소스"도 동일하게 적용시켜야 합니다.)
//document.domain = "abc.go.kr";

function init(){
  
      window.close();
} 

</script>
<body onload="init();">

</body>
</html>