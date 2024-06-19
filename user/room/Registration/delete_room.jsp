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
	int r_num = Integer.parseInt(request.getParameter("room_number"));

	
	try {					
		String jdbcDriver ="jdbc:mysql://211.213.95.123:33060/cloud?serverTimezone=UTC"; 
		String dbUser ="20183109"; //mysql id
		String dbPass ="1q2w3e4r"; //mysql password
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
        stb.append("delete from room where room_num = \"").append(r_num).append("\"");
        search = stb.toString();
        stmt = conn.createStatement();
        stmt.executeUpdate(search);

		stb.setLength(0);
		stmt.close();

		stb.append("select * from reservation where room_num= \"").append(r_num).append("\"");
		search=stb.toString();
		stmt=conn.createStatement();
		rs = stmt.executeQuery(search);

		if(rs.next()){
			rs.close();
			stmt.close();

			stb.append("delete from reservation where room_num=\"").append(r_num).append("\"");
			search=stb.toString();
			stmt=conn.createStatement();
			stmt.executeUpdate(search);
	
		}
			stb.setLength(0);
			rs.close();
			stmt.close();
	
			stb.append("select user_num from room where room_num=\"").append(r_num).append("\"");
			search=stb.toString();
			stmt=conn.createStatement();
			rs=stmt.executeQuery(search);

		
		if(rs.next()){
			int user_number = rs.getInt("user_num");
			stb.setLength(0);
			stmt.close();

			stb.append("delete from account where user_num=\"").append(user_number).append("\"");
			search=stb.toString();
			stmt=conn.createStatement();
			stmt.executeUpdate(search);
		}

        out.println("<script>alert('삭제 완료 하였습니다.');</script>"); //오류 창 출력
        out.println("<script>location.href='/user/Home/af_Logout.jsp';</script>");

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

