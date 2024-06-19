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
	ResultSet rs2=null;
    PreparedStatement pstmt =null;
	String search = null;
	
	int san = Integer.parseInt(request.getParameter("san_num"));
	int user_number=0;

	try {					
		String jdbcDriver ="jdbc:mysql://211.213.95.123:33060/cloud?serverTimezone=UTC"; 
		String dbUser ="20183109"; //mysql id
		String dbPass ="1q2w3e4r"; //mysql password
		StringBuilder stb = new StringBuilder(); //StringBuilder 객체 생성
		stb.append(" select user_num, appro_user_id from waiting_sanction where sanction_num  = \"").append (san).append("\""); //SQL 문 작성
		String query =stb.toString(); //stb를 String형태로 형변환

		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(query);

		if(rs.next()){ //동일한 아이디가 존재할 경우
            user_number = rs.getInt("user_num");
			String user = rs.getString("appro_user_id");
			stb.setLength(0);
			rs.close();
			stmt.close();
			stb.append("select * from sanction where user_id = \"").append (user).append("\"");
			query=stb.toString();
			stmt=conn.createStatement();
			rs=stmt.executeQuery(query);
			if(rs.next()){
				out.println("<script>alert('이미 승인 완료한 사용자 입니다.');</script>");
				out.println("<script>history.back();</script>");
			}
			else{
				String sql ="insert into sanction(user_id, user_num) values(?, ?)";
				pstmt = conn.prepareStatement(sql);
		
				pstmt.setString(1, user);
				pstmt.setInt(2, user_number);
				pstmt.executeUpdate();
				pstmt.close();
				
				stb.setLength(0);
				rs.close();
				stmt.close();
				
				query = "update waiting_sanction set state='y' where sanction_num = " + san;
				stmt=conn.createStatement();
				stmt.executeUpdate(query);

				out.println("<script>alert('사용자 제한이 완료되었습니다.');</script>");
				out.println("<script>location.href='../Home/m_users.jsp';</script>");

			}
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

