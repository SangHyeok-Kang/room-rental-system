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
	ResultSet rs2=null;
    PreparedStatement pstmt =null;
	String search = null;
	StringBuilder stb2 = new StringBuilder();
	String id = request.getParameter("id");
	String pw = null;
	

	try {					
		String jdbcDriver ="jdbc:mysql://211.213.95.123:33060/cloud?serverTimezone=UTC"; 
		String dbUser ="20183109"; //mysql id
		String dbPass ="1q2w3e4r"; //mysql password
		StringBuilder stb = new StringBuilder(); //StringBuilder 객체 생성
		stb.append("select PASSWORD from user where ID = \"").append (id).append("\""); //SQL 문 작성
		String query =stb.toString(); //stb를 String형태로 형변환
		// Create DB Connection
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		// Create Statement
		stmt = conn.createStatement();
		// Run Qeury
		rs = stmt.executeQuery(query);
		// Print Result (Run by Query)
			if(rs.next()){ //동일한 아이디가 존재할 경우
				pw = rs.getString("PASSWORD");
			%>
			<script>
				alert('고객님의 비밀번호는 <%=pw%> 입니다. 확인 누르시면 첫 화면으로 이동합니다.');
			</script>
			<% out.println("<script>location.href='/user/Home/index.jsp';</script>");

			}

            else{ //동일한 아이디가 없을 경우
				out.println("<script>alert('일치하는 아이디가 없습니다 회원가입 후 이용해 주세요');</script>");
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
