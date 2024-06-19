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
	String search = null;
	
	int refund_number = Integer.parseInt(request.getParameter("refund_number"));
	

	try {					
		String jdbcDriver ="jdbc:mysql://211.213.95.123:33060/cloud?serverTimezone=UTC"; 
		String dbUser ="20183109"; //mysql id
		String dbPass ="1q2w3e4r"; //mysql password
		StringBuilder stb = new StringBuilder(); //StringBuilder 객체 생성
		String query =null;

		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);

		
				
		query = "update wait_refund set state='n' where refund_num = " + refund_number;
		stmt=conn.createStatement();
		stmt.executeUpdate(query);

		out.println("<script>alert('환불 거절 되었습니다.');</script>");
		out.println("<script>location.href='../Home/m_refund.jsp';</script>");

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

