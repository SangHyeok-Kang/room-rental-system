<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %> 
<%
    if(session.getAttribute("MEMBERID")!= null){
        session.removeAttribute("MEMBERID"); //세션 삭제
        out.println("<script>alert('로그아웃 됩니다.');</script>"); //오류 창 출력
        out.println("<script>location.href='/user/Home/index.jsp';</script>");
    }
    else{
        out.println("<script>alert('세션이 만료되었습니다 다시 로그인해주세요!');</script>"); //오류 창 출력
        out.println("<script>location.href='/user/Home/index.jsp';</script>");
    }
    
%>