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
	int reser_num = Integer.parseInt(request.getParameter("reser_num"));
    int user_number=0;
	
	try {					
		String jdbcDriver ="jdbc:mysql://211.213.95.123:33060/cloud?serverTimezone=UTC"; 
		String dbUser ="20183109"; //mysql id
		String dbPass ="1q2w3e4r"; //mysql password
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
        stb.append("select user_num from reservation where reser_num = \"").append(reser_num).append("\"");
        search = stb.toString();
        stmt = conn.createStatement();
        rs= stmt.executeQuery(search);

        if(rs.next()){
            user_number = rs.getInt("user_num");
            stb.setLength(0);
            stmt.close();
            rs.close();

            stb.append("delete from reservation where reser_num = \"").append(reser_num).append("\"");
            search = stb.toString();
            stmt= conn.createStatement();
            stmt.executeUpdate(search);

            stb.setLength(0);
            stmt.close();

            stb.append("select * from account where user_num= \"").append(user_number).append("\"");
            search=stb.toString();
            stmt=conn.createStatement();
            rs = stmt.executeQuery(search);

            if(rs.next()){
                String acc = rs.getString("account_num");
                String bnk = rs.getString("bank_name");
                stb.setLength(0);
                stmt.close();
                rs.close();
                
                Random random = new Random();
				int rand = random.nextInt(300)+100;				
				search = "select * from wait_refund where refund_num =" + rand;
				stmt = conn.createStatement();
				rs= stmt.executeQuery(search);

				while(true){
					if(rs.isBeforeFirst()==true){
						rand = random.nextInt(300)+100;
					}
					else break;
				} 

                String sql ="insert into wait_refund(refund_num ,user_num, bank_name, account_num, state) values(?, ?, ?, ?, default)";
				pstmt = conn.prepareStatement(sql);

                pstmt.setInt(1, rand);
				pstmt.setInt(2, user_number);
				pstmt.setString(3, bnk);     
                pstmt.setString(4, acc);
				pstmt.executeUpdate();

				out.println("<script>alert('예약 취소 완료하였습니다 환불은 2~3일 정도 소요 됩니다.');</script>");
				out.println("<script>location.href='/user/Home/check_reser.jsp';</script>");
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

