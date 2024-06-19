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
	
	String u_id = request.getParameter("user");
	String msg = request.getParameter("Message");
	String repoter = (String)session.getAttribute("MEMBERID");

	int u_num;

	try {					
		String jdbcDriver ="jdbc:mysql://211.213.95.123:33060/cloud?serverTimezone=UTC"; 
		String dbUser ="20183109"; //mysql id
		String dbPass ="1q2w3e4r"; //mysql password
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		if(u_id.equals(repoter)){
			out.println("<script>alert('자기 자신은 신고할 수 없습니다. 다시 시도해주세요');</script>");
             out.println("<script>history.back();</script>");
		}
		else{
			stb.append("select user_num from user where ID = \"").append (u_id).append("\""); 
			String query =stb.toString(); //stb를 String형태로 형변환
			stmt = conn.createStatement();
			rs= stmt.executeQuery(query);
                        
			if(rs.next()){
				u_num=rs.getInt("user_num");// 값 받아와서 u_num에 넣음			
				Random random = new Random();
				int rand = random.nextInt(300)+100;				
				search = "select * from waiting_sanction where sanction_num =" + rand;
				stmt = conn.createStatement();
				rs= stmt.executeQuery(search);

				while(true){ 
					if(rs.isBeforeFirst()==true){
						rand = random.nextInt(300)+100;
					}
					else break;
				} 
				String sql ="insert into waiting_sanction(sanction_num, user_id, appro_user_id, user_num, reason,date,state) values(?, ?, ?, ?, ?,NOW(),default)";
                pstmt = conn.prepareStatement(sql);
			
                pstmt.setInt(1, rand);
				pstmt.setString(2, repoter);
                pstmt.setString(3, u_id);
				pstmt.setInt(4, u_num);
                pstmt.setString(5, msg);
								
                pstmt.executeUpdate();
                
                out.println("<script>alert('등록이 완료되었습니다.');</script>");
                out.println("<script>history.back();</script>");
							
            }
        	else{
				out.println("<script>alert('사용자를 찾지 못하였습니다.');</script>");
				out.println("<script>history.back();</script>");
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

