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
	String pw = request.getParameter("ps");
	String first_name = request.getParameter("firstname");
	String last_name = request.getParameter("lastname");
	String bir = request.getParameter("birth");
	String resi = request.getParameter("resident");
	String ph1 = request.getParameter("phonenum");
	String ph2 = request.getParameter("phonenum2");
	String ph3 = request.getParameter("phonenum3");
	String ph = ph1 +"-"+ ph2 +"-"+ ph3;
	String resi2 = bir +"-"+ resi;

	try {					
		String jdbcDriver ="jdbc:mysql://211.213.95.123:33060/cloud?serverTimezone=UTC"; 
		String dbUser ="20183109"; //mysql id
		String dbPass ="1q2w3e4r"; //mysql password
		StringBuilder stb = new StringBuilder(); //StringBuilder 객체 생성
		stb.append("select * from user where ID = \"").append (id).append("\""); //SQL 문 작성
		String query =stb.toString(); //stb를 String형태로 형변환
		// Create DB Connection
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		// Create Statement
		stmt = conn.createStatement();
		// Run Qeury
		rs = stmt.executeQuery(query);
		// Print Result (Run by Query)
			if(rs.isBeforeFirst()== true){ //동일한 아이디가 존재할 경우
				out.println("<script>alert('동일한 아이디가 있습니다 다시 시도해주세요.');</script>");
				out.println("<script>history.back();</script>");

			}

            else{ //동일한 아이디가 없을 경우
				stb.setLength(0);
				stb.append("select * from user where resident = \"").append(resi2).append("\"");
				search =stb.toString();
				rs2= stmt.executeQuery(search);
				if(rs2.isBeforeFirst()== true){
					out.println("<script>alert('동일한 주민등록번호가 있습니다. 다시 시도해주세요.');</script>");
					out.println("<script>history.back();</script>");
				}
				else{
					stb.setLength(0);
					stb.append("select * from user where phone_num = \"").append(ph).append("\"");
					search =stb.toString();
					rs2= stmt.executeQuery(search);
					if(rs2.isBeforeFirst()== true){
						out.println("<script>alert('동일한 휴대폰번호가 있습니다. 다시 시도해주세요.');</script>");
						out.println("<script>history.back();</script>");
					}
					else{
						Random random = new Random();
						int rand = random.nextInt(300)+100;				
						search = "select * from user where user_num =" + rand;
						rs2= stmt.executeQuery(search);

						while(true){
							if(rs2.isBeforeFirst()==true){
								rand = random.nextInt(300)+100;
							}
							else break;
						} 

						String sql ="insert into user(user_num, first_name, last_name, ID, PASSWORD, resident, phone_num) values(?, ?, ?, ?, ?, ?, ?)";
						pstmt = conn.prepareStatement(sql);

						pstmt.setInt(1, rand);
						pstmt.setString(2, first_name);
						pstmt.setString(3, last_name);
						pstmt.setString(4, id);
						pstmt.setString(5, pw);
						pstmt.setString(6, resi2);
						pstmt.setString(7, ph);
						pstmt.executeUpdate();

						out.println("<script>alert('회원가입 완료되었습니다.');</script>");
						out.println("<script>location.href='/user/Home/index.jsp';</script>");
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
%></h3> <br>

