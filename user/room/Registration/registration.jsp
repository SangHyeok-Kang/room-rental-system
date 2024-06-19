<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.util.Random" %>
<%@ page import="java.util.ArrayList" %>


<%
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = null;
    Statement stmt = null;
    Statement stmt2 = null;
    ResultSet rs = null;
    ResultSet rs2 = null;
    PreparedStatement pstmt = null;
    String search = null;
    StringBuilder stb2 = new StringBuilder();


    Random random = new Random();
    int pri = Integer.parseInt(request.getParameter("price")); //사용자 가격 받아와 Int형으로 변환
    String u_id = request.getParameter("user_id"); //사용자 아이디 받아와 u_id에 저장
    String bank_name = request.getParameter("bank_select"); // 은행명 선택 값 저장
    String first_name = request.getParameter("account_holder"); // 예금주 성 값 저장
    String last_name = request.getParameter("account_holder2");// 예금주 이름 값 저장
    String accont_number = request.getParameter("account_num"); //계좌번호 값 저장
    String opt[] = request.getParameterValues("option"); //옵션 값 저장
    String add1 = request.getParameter("address1"); //나머지 주소 저장
    String add2 = request.getParameter("address2"); //나머지 주소 저장
    String ph1 = request.getParameter("phone1"); //휴대폰 첫 번호 저장
    String ph2 = request.getParameter("phone2"); //휴대폰 중간 번호 저장
    String ph3 = request.getParameter("phone3"); //휴대폰 마지막 번호 저장
    String ph = ph1 + "-" + ph2 + "-" + ph3; //휴대폰 번호 하나의 변수로 합침
    String smk = request.getParameter("smoke"); //담배 여부 저장
    String drk = request.getParameter("drink"); //음주 여부 저장
    String jeon = request.getParameter("jeondal"); //전달사항 저장
    String s_date = request.getParameter("startday"); //시작 날짜 저장
    String l_date = request.getParameter("lastday"); //종료 날짜 저장
    String s_time = request.getParameter("startime"); //시작 시간 저장
    String l_time = request.getParameter("lastime"); //종료 시간 저장
    String img1 = request.getParameter("img"); //방 등록 사진 1 저장
    String[] address_info = new String[5];
    address_info = add1.split(" ");//주소정보 받아오기 city,gu,ro,d_address순
    StringBuilder stbstart_time = new StringBuilder();//시작날짜 + 시작시간
    StringBuilder stbend_time = new StringBuilder();//종료날짜 + 시작시간
    stbstart_time.append(s_date).append(" ").append(s_time);//시작날짜 + 시작시간
    stbend_time.append(l_date).append(" ").append(l_time);///종료날짜 + 시작시간
    String start_time = stbstart_time.toString();//시작날짜 + 시작시간
    String end_time = stbend_time.toString(); //종료날짜 + 시작시간
    String x = request.getParameter("entX"); //x좌표
    String y = request.getParameter("entY"); //y좌표
    String value = "";
    int u_num = 0;  

    for (int i = 0; i < opt.length; i++){
        value += opt[i] + " ";
    }

    try {
        String jdbcDriver = "jdbc:mysql://211.213.95.123:33060/cloud?serverTimezone=UTC";
        String dbUser = "20183109"; //mysql id
        String dbPass = "1q2w3e4r"; //mysql password
        StringBuilder stb = new StringBuilder(); //StringBuilder 객체 생성
        stb.append("select user_num from user where ID = \"").append(u_id).append("\""); //입력받은 유저 아이디로 사용자 번호 검색
        String query = stb.toString(); //stb를 String형태로 형변환
        conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
        stmt = conn.createStatement();
        rs = stmt.executeQuery(query);

        if (rs.next()) {
            u_num = rs.getInt("user_num"); //유저 번호 받아오는 값 u_num에 저장
            rs.close();
            stmt.close();
        }

        stb.setLength(0);
        stb.append("select * from user where ID = \"").append(u_id).append("\"")
                .append(" and first_name= \"").append(first_name).append("\"")
                .append(" and last_name= \"").append(last_name).append("\""); //user 테이블에서 사용자 아이디와 이름이 일치하는 정보 검색
        search = stb.toString();
        stmt = conn.createStatement();
        rs = stmt.executeQuery(search);

        if (rs.isBeforeFirst() == true) { //일치하는 정보가 있을 경우
            rs.close();
            stmt.close();

            stb.setLength(0);
            stb.append("select * from user where ID = \"").append(u_id).append("\"").append(" and phone_num= \"").append(ph).append("\"");
            search = stb.toString();
            stmt = conn.createStatement();
            rs = stmt.executeQuery(search);

            if (rs.isBeforeFirst() == true) {
                stb.setLength(0);
                rs.close();
                stmt.close();
                int rand = random.nextInt(300) + 100;

                search = "select * from room where room_num =" + rand;
                stmt = conn.createStatement();
                rs = stmt.executeQuery(search);
                while (true) {
                    if (rs.isBeforeFirst() == true) {
                        rand = random.nextInt(300) + 100;
                    } else break;
                }
                String sql = "insert into room(user_num, room_num, image, city, gu, ro, d_address, price, start_time, end_time, drink, smoke,wifi, computer, airconditioner, bed, laundry, microwave, refrigerator, kitchentools,airfryer, desk, towel, tv, tableware, drawer, notice,x,y,detail_add,sale) values(?, ?, ?, ?, ?, ?,?,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,1)";
                pstmt = conn.prepareStatement(sql);


                pstmt.setInt(1, u_num);
                pstmt.setInt(2, rand);
                pstmt.setString(3, img1);
                pstmt.setString(4, address_info[0]);
                pstmt.setString(5, address_info[1]);
                pstmt.setString(6, address_info[2]);
                pstmt.setString(7, address_info[3]);
                pstmt.setString(30, add2);
                pstmt.setInt(8, pri);
                pstmt.setString(9, start_time);
                pstmt.setString(10, end_time);
                pstmt.setString(28, x);
                pstmt.setString(29, y);

                if (drk.equals("true")) {
                    pstmt.setInt(11, 1);
                } else {
                    pstmt.setInt(11, 0);
                }

                if (smk.equals("true")) {
                    pstmt.setInt(12, 1);
                } else {
                    pstmt.setInt(12, 0);
                }

                pstmt.setInt(13, 0);
                pstmt.setInt(14, 0);
                pstmt.setInt(15, 0);
                pstmt.setInt(16, 0);
                pstmt.setInt(17, 0);
                pstmt.setInt(18, 0);
                pstmt.setInt(19, 0);
                pstmt.setInt(20, 0);
                pstmt.setInt(21, 0);
                pstmt.setInt(22, 0);
                pstmt.setInt(23, 0);
                pstmt.setInt(24, 0);
                pstmt.setInt(25, 0);
                pstmt.setInt(26, 0);

                for (int i = 0; i < opt.length; i++) {
                    if (opt[i].equals("wifi")) {
                        pstmt.setInt(13, 1);
                    }
                    else if (opt[i].equals("com")) {
                        pstmt.setInt(14, 1);
                    }
                    else if (opt[i].equals("aircon")) {
                        pstmt.setInt(15, 1);
                    }
                    else if (opt[i].equals("bed")) {
                        pstmt.setInt(16, 1);
                    }
                    else if (opt[i].equals("laund")) {
                        pstmt.setInt(17, 1);
                    }
                    else if (opt[i].equals("micro")) {
                        pstmt.setInt(18, 1);
                    }
                    else if (opt[i].equals("refri")) {
                        pstmt.setInt(19, 1);
                    }
                    else if (opt[i].equals("kitchen")) {
                        pstmt.setInt(20, 1);
                    }
                    else if (opt[i].equals("airfy")) {
                        pstmt.setInt(21, 1);
                    }
                    else if (opt[i].equals("desk")) {
                        pstmt.setInt(22, 1);
                    }
                    else if (opt[i].equals("tow")) {
                        pstmt.setInt(23, 1);
                    }
                    else if (opt[i].equals("tv")) {
                        pstmt.setInt(24, 1);
                    }
                    else if (opt[i].equals("tableware")) {
                        pstmt.setInt(25, 1);
                    }
                    else if (opt[i].equals("drawer")) {
                        pstmt.setInt(26, 1);
                    }
                }
                
                pstmt.setString(27, jeon);
                pstmt.executeUpdate();
                pstmt.close();

                stb.setLength(0);
                stmt.close();
                rs.close();
                stb.append("select * from account where user_num = \"").append(u_num).append("\"");
                search=stb.toString();
                stmt= conn.createStatement();
                rs= stmt.executeQuery(search);

                if(rs.isBeforeFirst()==false){
                    sql = "insert into account(user_num, bank_name, account_num) values(?, ?, ?)";
                    pstmt = conn.prepareStatement(sql);
    
                    pstmt.setInt(1, u_num);
                    pstmt.setString(2, bank_name);
                    pstmt.setString(3, accont_number);
                    pstmt.executeUpdate();
    
                }
   
                out.println("<script>alert('등록완료 되었습니다.');</script>");
                out.println("<script>location.href='/user/Home/af_about.jsp';</script>");

            } else {
                out.println("<script>alert('휴대폰 번호가 회원정보와 일치하지 않습니다 다시 작성해 주세요!');</script>");
                rs.close();
                stmt.close();
                out.println("<script>history.back();</script>");
            }
        } else { //등록된 이름과
            out.println("<script>alert('회원정보의 이름과 다른 예금주입니다. 다시 입력해주세요.');</script>");
            rs.close();
            stmt.close();
            out.println("<script>history.back();</script>");
        }

    } catch (SQLException ex) {
        out.println(ex.getMessage());
        ex.printStackTrace();
    } finally {
        // Close Statement
        if (rs != null) try {
            rs.close();
        } catch (SQLException ex) {
        }
        if (stmt != null) try {
            stmt.close();
        } catch (SQLException ex) {
        }
        // Close Connection
        if (conn != null) try {
            conn.close();
        } catch (SQLException ex) {
        }
    }
%>