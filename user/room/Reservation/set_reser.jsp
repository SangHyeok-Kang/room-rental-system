<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %> 
<%@ page import ="java.sql.DriverManager" %>
<%@ page import ="java.sql.Connection" %>
<%@ page import ="java.sql.Statement" %>
<%@ page import ="java.sql.ResultSet" %>
<%@ page import ="java.sql.SQLException" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.util.Random" %>


<%
	Class.forName("com.mysql.cj.jdbc.Driver"); 
	Connection conn =null;
	Statement stmt =null;
	ResultSet rs =null;
    PreparedStatement pstmt =null;
	String search = null;
	StringBuilder stb = new StringBuilder();
    
    String s_day = request.getParameter("startday");
    String l_day = request.getParameter("lastday");
    String s_time = request.getParameter("starttime");
    String l_time = request.getParameter("endtime");
    String user = request.getParameter("u_id");
    String ph1 = request.getParameter("p_num"); //휴대폰 첫 번호 저장
    String ph2 = request.getParameter("middle_num"); //휴대폰 중간 번호 저장
    String ph3 = request.getParameter("last_num"); //휴대폰 마지막 번호 저장
    String ph = ph1 + "-" + ph2 + "-" + ph3; //휴대폰 번호 하나의 변수로 합침
	String bank_name = request.getParameter("bank_select");
	String bank_user = request.getParameter("ba_name");
    String bank_num = request.getParameter("bank_number");
    StringBuilder stbend_time = new StringBuilder();//종료날짜 + 시작시간
    stbstart_time.append(s_day).append(" ").append(s_time);//시작날짜 + 시작시간
    stbend_time.append(l_day).append(" ").append(l_time);///종료날짜 + 시작시간
    String start_time = stbstart_time.toString();//시작날짜 + 시작시간
    String end_time = stbend_time.toString(); //종료날짜 + 시작시간

	int u_num=0;
    int rand=0;
    try {					
		String jdbcDriver ="jdbc:mysql://211.213.95.123:33060/cloud?serverTimezone=UTC"; 
		String dbUser ="20183109"; //mysql id
		String dbPass ="1q2w3e4r"; //mysql password
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		stb.append("select user_num from user where ID= \"").append(u_id).append("\"");
        search=stb.toString();
        stmt=conn.createStatement();
        rs=stmt.exectueQuery(search);

        if(rs.next()){
            int user_number = getInt("user_num");
            Random random = new Random();
        rand = random.nextInt(300)+100;				
        search = "select * from reservation where reser_num =" + rand;
        stmt = conn.createStatement();
        rs= stmt.executeQuery(search);

        while(true){
            if(rs.isBeforeFirst()==true){
                rand = random.nextInt(300)+100;
            }
            else break;
        } 
                        
        String sql ="insert into reservation(reser_num, room_num, user_num, start_time, end_time) values(?, ?, ?, ?, ?)";
        pstmt = conn.prepareStatement(sql);

        pstmt.setInt(1, rand);
        pstmt.setString(2, room_number);
        pstmt.setInt(3, user_number);
        pstmt.setString(4, start_time);
        pstmt.setString(5, end_time);
        pstmt.executeUpdate();
        pstmt.close();

        sql ="insert into account(user_num, bank_name, account_num) values(?, ?, ?)";
        pstmt=conn.prepareStatement(sql);

        pstmt.setInt(1, user_number);
        pstmt.setString(2, bank_name);
        pstmt.setString(3, bank_num);
        pstmt.executeUpdate();
        
                        
        out.println("<script>alert('등록이 완료되었습니다.');</script>");
        out.println("<script>history.back();</script>");
        }
        else{
            out.println("<script>alert('회원정보와 일치하지 않는 아이디입니다. 다시 입력해주세요');</script>");
            out.println("<script>history.back();</script>");
        }

		

		
	} catch(SQLException ex) {
		out.println(ex.getMessage());
		ex.printStackTrace();
	} finally {
		// Close Statement
		if (rs !=null) try { rs.close(); } catch(SQLException ex) {}
		if (stmt !=null) try { stmt.close(); } catch(SQLException ex) {}
		// Close Connection
		if (conn !=null) try { conn.close(); } catch(SQLException ex) {}
	}
%>