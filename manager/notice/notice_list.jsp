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
	StringBuilder stb2 = new StringBuilder();
	
	String title = request.getParameter("Name");
	String msg = request.getParameter("Message");
	

	try {					
		String jdbcDriver ="jdbc:mysql://211.213.95.123:33060/cloud?serverTimezone=UTC"; 
		String dbUser ="20183109"; //mysql id
		String dbPass ="1q2w3e4r"; //mysql password
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		stmt = conn.createStatement();
						Random random = new Random();
						int rand = random.nextInt(300)+100;				
						search = "select * from announcement where an_num =" + rand;
						rs= stmt.executeQuery(search);

						while(true){
							if(rs.isBeforeFirst()==true){
								rand = random.nextInt(300)+100;
							}
							else break;
						} 
						
						String sql ="insert into announcement(an_num, title, contents, date) values(?, ?, ?,NOW())";
						pstmt = conn.prepareStatement(sql);

						pstmt.setInt(1, rand);
						pstmt.setString(2, title);
						pstmt.setString(3, msg);
						pstmt.executeUpdate();
						
						out.println("<script>alert('등록이 완료되었습니다.');</script>");
						out.println("<script>history.back();</script>");

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

