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
	Statement stmt2 =null;
	ResultSet rs =null;
	ResultSet rs2=null;
	String query =null;
	String id = request.getParameter("id"); //사용자 ID입력 값 저장
	String pw = request.getParameter("ps"); //사용자 PASSWORD 입력 값 저장
	String value = request.getParameter("division");
	boolean find = false;

	try {				
		String jdbcDriver ="jdbc:mysql://211.213.95.123:33060/cloud?serverTimezone=UTC"; 
		String dbUser ="20183109"; //mysql id
		String dbPass ="1q2w3e4r"; //mysql password
		
		if(value.equals("Manager")){
			query = "select * from admin";
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			// Create Statement
			stmt = conn.createStatement();
			// Run Qeury
			rs = stmt.executeQuery(query);
			// Print Result (Run by Query)
			while(rs.next()) {
				String admin = rs.getString("ID"); //DB의 ID 값 admin에 저장
				String password = rs.getString("PASSWORD"); //DB의 PASSWORD 값 password에 저장
		
				if(admin.equals(id) && password.equals(pw)){ //사용자가 입력한 id,pw와 DB에 저장된 데이터가 일치할 시
					find = true; //find 값을 true 입력후 break
					break;
	
				}
	
			}
			if(find == false){ //find 값이 false일 경우
				out.println("<script>alert('관리자가 아닙니다. 게스트체크 후 다시 시도해 주세요');</script>"); //오류 창 출력
				out.println("<script>history.back();</script>");
			}
			else{ //find 값이 true일 경우
				if(id.equals(session.getAttribute("ADMINID"))){
					session.removeAttribute("ADMINID");
					session.setAttribute("ADMINID",id); //사용자 ID값 MEMBERID라는 세션에 저장
					out.println("<script>alert('로그인 성공!');</script>"); //성공 창 출력
					out.println("<script>location.href='../manager/Home/manager.jsp';</script>");
				}
				else{
					session.setAttribute("ADMINID",id); //사용자 ID값 MEMBERID라는 세션에 저장
					out.println("<script>alert('로그인 성공!');</script>"); //성공 창 출력
					out.println("<script>location.href='../manager/Home/manager.jsp';</script>");
				}
			}
		}
		else if(value.equals("Guest")){
			query ="select * from user";
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			// Create Statement
			stmt = conn.createStatement();
			// Run Qeury
			rs = stmt.executeQuery(query);
			// Print Result (Run by Query)
			while(rs.next()) {
				String user = rs.getString("ID"); //DB의 ID 값 user에 저장
				String password = rs.getString("PASSWORD"); //DB의 PASSWORD 값 password에 저장
		
				if(user.equals(id) && password.equals(pw)){ //사용자가 입력한 id,pw와 DB에 저장된 데이터가 일치할 시
					find = true; //find 값을 true 입력후 break
					break;
	
				}
	
			}
			if(find == false){ //find 값이 false일 경우
				out.println("<script>alert('로그인 실패! 다시 시도해주세요!');</script>"); //오류 창 출력
				out.println("<script>history.back();</script>");
			}
			else{ //find 값이 true일 경우
				stmt2 = conn.createStatement();
				StringBuilder stb = new StringBuilder();
				stb.append("select * from sanction where user_id = \"").append (id).append("\""); //SQL 문 작성
				String search =stb.toString(); //stb를 String형태로 형변환
				rs2= stmt2.executeQuery(search);

				if(rs2.isBeforeFirst() == true){
					out.println("<script>alert('이용제한된 사용자입니다. 담당자에게 문의주세요.');</script>");
					out.println("<script>history.back();</script>");
				}
				else{
					if(id.equals(session.getAttribute("MEMBERID"))){
						session.removeAttribute("MEMBERID");
						session.setAttribute("MEMBERID",id); //사용자 ID값 MEMBERID라는 세션에 저장
						out.println("<script>alert('로그인 성공!');</script>"); //성공 창 출력
						out.println("<script>location.href='/user/Home/af_Logout.jsp';</script>");
					}
					else{
						session.setAttribute("MEMBERID",id); //사용자 ID값 MEMBERID라는 세션에 저장
						out.println("<script>alert('로그인 성공!');</script>"); //성공 창 출력
					out.println("<script>location.href='/user/Home/af_Logout.jsp';</script>");
					}
				}
				
				
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

