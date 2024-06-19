<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %> 
<%@ page import ="java.sql.DriverManager" %>
<%@ page import ="java.sql.Connection" %>
<%@ page import ="java.sql.Statement" %>
<%@ page import ="java.sql.ResultSet" %>
<%@ page import ="java.sql.SQLException" %>
<%@ page import="java.sql.PreparedStatement" %>


<%
	Class.forName("com.mysql.cj.jdbc.Driver"); 
	Connection conn =null;
	Statement stmt =null;
	ResultSet rs =null;
    PreparedStatement pstmt =null;
	String search = null;
	StringBuilder stb = new StringBuilder();

    String user_id = (String) session.getAttribute("MEMBERID");
    int u_num =0;

	try {					
		String jdbcDriver ="jdbc:mysql://211.213.95.123:33060/cloud?serverTimezone=UTC"; 
		String dbUser ="20183109"; //mysql id
		String dbPass ="1q2w3e4r"; //mysql password
		stb = new StringBuilder(); //StringBuilder 객체 생성
		stb.append("select user_num from user where ID = \"").append(user_id).append("\""); //SQL 문 작성
		String query =stb.toString(); //stb를 String형태로 형변환
		// Create DB Connection
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		// Create Statement
		stmt = conn.createStatement();
		// Run Qeury
	    rs = stmt.executeQuery(query);
		// Print Result (Run by Query)
		if(rs.next()){
			u_num = rs.getInt("user_num"); //DB의 ID 값 admin에 저장
			rs.close();
		}
		stmt.close();
		stb.setLength(0);
		stb.append("delete from user where user_num = \"").append(u_num).append("\""); //SQL 문 작성
		query =stb.toString(); //stb를 String형태로 형변환
		stmt = conn.createStatement();
	    stmt.executeUpdate(query);

		stmt.close();
		stb.setLength(0);
		stb.append("delete from inquiry where user_num = \"").append(u_num).append("\""); //SQL 문 작성
		query =stb.toString(); //stb를 String형태로 형변환
		stmt = conn.createStatement();
	    stmt.executeUpdate(query);
		
		stmt.close();
		stb.setLength(0);
		stb.append("delete from user_grade where user_num = \"").append(u_num).append("\""); //SQL 문 작성
		query =stb.toString(); //stb를 String형태로 형변환
		stmt = conn.createStatement();
	    stmt.executeUpdate(query);
		
		stmt.close();
		stb.setLength(0);
		stb.append("delete from room where user_num = \"").append(u_num).append("\""); //SQL 문 작성
		query =stb.toString(); //stb를 String형태로 형변환
		stmt = conn.createStatement();
	    stmt.executeUpdate(query);

		stmt.close();
		stb.setLength(0);
		stb.append("delete from room_grade where user_num = \"").append(u_num).append("\""); //SQL 문 작성
		query =stb.toString(); //stb를 String형태로 형변환
		stmt = conn.createStatement();
	    stmt.executeUpdate(query);

		stmt.close();
		stb.setLength(0);
		stb.append("delete from reservation where user_num = \"").append(u_num).append("\""); //SQL 문 작성
		query =stb.toString(); //stb를 String형태로 형변환
		stmt = conn.createStatement();
	    stmt.executeUpdate(query);

		stmt.close();
		stb.setLength(0);
		stb.append("delete from account where user_num = \"").append(u_num).append("\""); //SQL 문 작성
		query =stb.toString(); //stb를 String형태로 형변환
		stmt = conn.createStatement();
	    stmt.executeUpdate(query);

		stmt.close();
		stb.setLength(0);
		stb.append("delete from sanction where user_num = \"").append(u_num).append("\""); //SQL 문 작성
		query =stb.toString(); //stb를 String형태로 형변환
		stmt = conn.createStatement();
	    stmt.executeUpdate(query);

		stmt.close();
		stb.setLength(0);
		stb.append("delete from ser_account where user_num = \"").append(u_num).append("\""); //SQL 문 작성
		query =stb.toString(); //stb를 String형태로 형변환
		stmt = conn.createStatement();
	    stmt.executeUpdate(query);

		stmt.close();
		stb.setLength(0);
		stb.append("delete from waiting_sanction where user_num = \"").append(u_num).append("\""); //SQL 문 작성
		query =stb.toString(); //stb를 String형태로 형변환
		stmt = conn.createStatement();
	    stmt.executeUpdate(query);

        session.removeAttribute("MEMBERID"); //세션 삭제
        out.println("<script>alert('회원탈퇴 완료되었습니다. 자동 로그아웃 됩니다.');</script>"); //오류 창 출력
        out.println("<script>location.href='/user/Home/index.jsp';</script>");

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

