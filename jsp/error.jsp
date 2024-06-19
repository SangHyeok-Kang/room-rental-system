<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %> 
<%
    out.println("<script>alert('로그인 후 이용 부탁드립니다.');</script>"); //오류 창 출력
    out.println("<script>location.href='/user/Home/index.jsp';</script>");
%>