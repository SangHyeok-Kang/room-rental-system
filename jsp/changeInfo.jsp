<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %> 
<%@ page import ="java.sql.DriverManager" %>
<%@ page import ="java.sql.Connection" %>
<%@ page import ="java.sql.Statement" %>
<%@ page import ="java.sql.ResultSet" %>
<%@ page import ="java.sql.SQLException" %>

<%
	Class.forName("com.mysql.cj.jdbc.Driver"); 
	Connection conn =null;
	Statement stmt =null;
	ResultSet rs =null;
	StringBuilder stb = new StringBuilder();
	String query =null;
	String id = (String)session.getAttribute("MEMBERID"); //세션에 있는 id 값 저장
    String N_pass = request.getParameter("NowPass");
    String M_pass = request.getParameter("ModPass");
	String ph1 = request.getParameter("phone1");
	String ph2 = request.getParameter("phone2");
	String ph3 = request.getParameter("phone3");
	String ph = ph1 +"-"+ ph2 +"-"+ ph3;
	boolean find = false;
	
	try {
				
		String jdbcDriver ="jdbc:mysql://211.213.95.123:33060/cloud?serverTimezone=UTC"; 
		String dbUser ="20183109"; //mysql id
		String dbPass ="1q2w3e4r"; //mysql password
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);

		stb.append("select * from user where PASSWORD = \"").append (N_pass).append("\"");
		query =stb.toString(); //stb를 String형태로 형변환
		stmt = conn.createStatement();
		rs = stmt.executeQuery(query);
		if(rs.isBeforeFirst()== true){
			if(ph2.isEmpty() && ph3.isEmpty() && !M_pass.isEmpty()){
				stmt.close();
				stb.setLength(0);
				stb.append("update user set PASSWORD = \"").append (M_pass).append("\"").append(" where ID = \"").append(id).append("\"");
				query =stb.toString(); //stb를 String형태로 형변환
				stmt = conn.createStatement();
				stmt.executeUpdate(query);
				session.removeAttribute("MEMBERID"); //세션 삭제
				out.println("<script>alert('비밀번호변경이 완료 되었습니다. 다시 로그인 해주세요');</script>");		
				out.println("<script>location.href='/user/Home/index.jsp';</script>");
			}
			else if(!ph2.isEmpty() && !ph3.isEmpty() && M_pass.isEmpty()){
				out.println("하위2");
				stmt.close();
				stb.setLength(0);
				stb.append("update user set phone_num = \"").append (ph).append("\"").append(" where ID = \"").append(id).append("\"");
				query =stb.toString(); //stb를 String형태로 형변환
				stmt = conn.createStatement();
				stmt.executeUpdate(query);
	
				session.removeAttribute("MEMBERID");
				out.println("<script>alert('회원정보 수정이 완료되었습니다.. 다시 로그인 해주세요');</script>");		
				out.println("<script>location.href='/user/Home/index.jsp';</script>");
			}
			else if(ph2.isEmpty() && ph3.isEmpty() && M_pass.isEmpty()){
				out.println("하위3");
				out.println("<script>alert('변경할 내용을 입력해주세요');</script>");
				out.println("<script>history.back();</script>");
			}
			else if((!ph2.isEmpty() && ph3.isEmpty()) || (ph2.isEmpty() && !ph3.isEmpty()))  {
				out.println("<script>alert('휴대폰 번호를 모두 입력해주세요');</script>");
				out.println("<script>history.back();</script>");
			}
			else{
				stmt.close();
				stb.setLength(0);
				stb.append("update user set PASSWORD = \"").append(M_pass).append("\"").append(", phone_num = \"").append (ph).append("\"").append(" where ID = \"").append(id).append("\"");
				query =stb.toString(); //stb를 String형태로 형변환
				stmt = conn.createStatement();
				stmt.executeUpdate(query);
	
				session.removeAttribute("MEMBERID");
				out.println("<script>alert('회원정보 수정이 완료되었습니다.. 다시 로그인 해주세요');</script>");		
				out.println("<script>location.href='/user/Home/index.jsp';</script>");
			}
		}
		else{
			out.println("<script>alert('현재 비밀번호가 일치하지 않습니다. 다시 입력해주세요');</script>");
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

