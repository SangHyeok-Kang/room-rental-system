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
	//request.setCharacterEncoding("EUC-KR");  //해당시스템의 인코딩타입이 EUC-KR일경우에
	String entX = request.getParameter("x"); 
	String entY = request.getParameter("y"); 
	ArrayList<String> juso_list = new ArrayList<String>(); 
    ArrayList<String> juso_x = new ArrayList<String>(); 
    ArrayList<String> juso_y = new ArrayList<String>();
    ArrayList<String> money = new ArrayList<String>(); 
    ArrayList<String> start_time = new ArrayList<String>(); 
    ArrayList<String> end_time = new ArrayList<String>(); 
    ArrayList<String> city = new ArrayList<String>(); 
    ArrayList<String> gu = new ArrayList<String>(); 
    ArrayList<String> ro = new ArrayList<String>();
    ArrayList<String> d_address = new ArrayList<String>();
    ArrayList<String> room_num = new ArrayList<String>();
    //out.println("<script>alert('실행');</script>");
     //out.println(entX);
     //out.println(entY);
////////////////////////////////////////////////////////////////db/////////////////////////////////////////////////////////////////////////-->
////////////////////////////////////////////////////////////////db/////////////////////////////////////////////////////////////////////////-->
////////////////////////////////////////////////////////////////db/////////////////////////////////////////////////////////////////////////--> // MySQL JDBC Driver Loading
                Class.forName("com.mysql.cj.jdbc.Driver"); 
                Connection conn =null;
                Statement stmt =null; //sql문
                ResultSet rs =null; //select 문에서 가져오는 것
                try {							
                    String jdbcDriver ="jdbc:mysql://211.213.95.123:33060/cloud?serverTimezone=UTC"; 
                    String dbUser ="20183207"; //mysql id
                    String dbPass ="1q2w3e4r"; //mysql password
                    StringBuilder stb = new StringBuilder();//보낼 쿼리문 작성을 위한 stb변수 생성  
                    //stb.append("select *, (6371*acos(cos(radians(37.4685225))*cos(radians(").append("x").append("))*cos(radians(").append("y").append(")-radians(126.8943311))+sin(radians(37.4685225))*sin(radians(").append("x").append(")))) FROM testtable HAVING distance <= 2.2");
					stb.append("select *, (6371*acos(cos(radians(").append(entX).append("))*cos(radians(").append("x").append("))*cos(radians(").append("y").append(")-radians(").append(entY).append("))+sin(radians(").append(entX).append("))*sin(radians(").append("x").append(")))) AS distance FROM room where sale =1 HAVING distance <= 10");
                    String query = stb.toString();  //StringBuilder를 string으로 변환
                    conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass); // db연결                    
                    stmt = conn.createStatement(); // Create Statement                   
                    rs = stmt.executeQuery(query); // 쿼리 실행
                    while(rs.next()){
                        StringBuilder appendjuso=new StringBuilder();
                        String a = rs.getString("x");
                        String b = rs.getString("y");
                        appendjuso.append(a).append(" ").append(b);
                        juso_x.add(rs.getString("x"));
                        juso_y.add(rs.getString("y"));
                        money.add(rs.getString("price"));
                        start_time.add(rs.getString("start_time"));
                        end_time.add(rs.getString("end_time"));
						juso_list.add(appendjuso.toString());
                        city.add(rs.getString("city"));
                        gu.add(rs.getString("ro"));
                        ro.add(rs.getString("gu"));
						d_address.add(rs.getString("d_address"));
                        room_num.add(rs.getString("room_num"));
                      //  out.println(juso_x);
                      //  out.println(juso_y);
                      //  out.println(start_time);
                      //  out.println(end_time);

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
</head>
<script language="javascript">
//opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("주소입력화면 소스"도 동일하게 적용시켜야 합니다.)
//document.domain = "abc.go.kr";

function init(){
		opener.dbCallBack("<%=juso_list%>","<%=juso_x%>","<%=juso_y%>","<%=money%>","<%=start_time%>","<%=end_time%>","<%=city%>","<%=gu%>","<%=ro%>","<%=d_address%>","<%=room_num%>");
		window.close();
} 

</script>
<body onload="init();">

</body>
</html>