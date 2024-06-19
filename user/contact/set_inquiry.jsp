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
    
    String u_id = request.getParameter("id");
	String title = request.getParameter("title");
	String msg = request.getParameter("Message");
    String user = (String)session.getAttribute("MEMBERID");
	int u_num=0;
    int rand=0;
    try {					
		String jdbcDriver ="jdbc:mysql://211.213.95.123:33060/cloud?serverTimezone=UTC"; 
		String dbUser ="20183109"; //mysql id
		String dbPass ="1q2w3e4r"; //mysql password
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		
		Random random = new Random();
        if(u_id.equals(user)){
            stb.append("select user_num from user where ID = \"").append (u_id).append("\""); 
		    search = stb.toString();
            stmt = conn.createStatement();
            rs=stmt.executeQuery(search);
            if(rs.next()){
                u_num = rs.getInt("user_num");

                stmt.close();
                rs.close();

                rand = random.nextInt(300)+100;				
                search = "select * from inquiry where ask_num =" + rand;
                stmt = conn.createStatement();
                rs= stmt.executeQuery(search);
        
                while(true){
                    if(rs.isBeforeFirst()==true){
                        rand = random.nextInt(300)+100;
                    }
                    else break;
                } 
                                
                String sql ="insert into inquiry(ask_num, user_id, user_num, title, contents, date) values(?, ?, ?, ?, ?, NOW())";
                pstmt = conn.prepareStatement(sql);
        
                pstmt.setInt(1, rand);
                pstmt.setString(2, u_id);
                pstmt.setInt(3, u_num);
                pstmt.setString(4, title);
                pstmt.setString(5, msg);
                pstmt.executeUpdate();
                                
                out.println("<script>alert('등록이 완료되었습니다.');</script>");
                out.println("<script>history.back();</script>");
        
            }
        }
        else{
            out.println("<script>alert('로그인된 아이디로 다시 작성해주세요');</script>");
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