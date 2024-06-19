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
	
	String a_num = request.getParameter("ask_number");
	String msg = request.getParameter("Message");
	

	try {					
		String jdbcDriver ="jdbc:mysql://211.213.95.123:33060/cloud?serverTimezone=UTC"; 
		String dbUser ="20183109"; //mysql id
		String dbPass ="1q2w3e4r"; //mysql password
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		stb.append("select * from inquiry where ask_num = \"").append(a_num).append("\"");
		search = stb.toString();
		stmt = conn.createStatement();
		rs = stmt.executeQuery(search);

		if(rs.isBeforeFirst()==true){
			stb.setLength(0);
			rs.close();
			stmt.close();
			stb.append("select answer from inquiry where ask_num = \"").append(a_num).append("\"");
			search = stb.toString();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(search);
			
			if(rs.next()){								
				if(rs.getString("answer") != null){
					out.println("<script>alert('이미 답변이 완료된 문의입니다.');</script>");
					out.println("<script>history.back();</script>");
				}
				else{	
					stmt.close();
					rs.close();
					stb.setLength(0);
					stb.append("update inquiry set answer = \"").append(msg).append("\"").append(" where ask_num = \"").append(a_num).append("\"");
					search=stb.toString();
					stmt = conn.createStatement();
					stmt.executeUpdate(search);
	
					out.println("<script>alert('답변 등록 완료 되었습니다.');</script>");
					out.println("<script>location.href='../Home/m_contact.jsp';</script>");
				}
			}
			
			
		}
		else{
			out.println("<script>alert('등록된 문의가 없습니다. 문의번호를 확인해주세요');</script>");
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
%></h3> <br>

