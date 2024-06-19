<script src="https://kit.fontawesome.com/d7e5986696.js" crossorigin="anonymous"></script>
<link href="/css/star.css" rel="stylesheet">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  String room_num= request.getParameter("room_num");
  Class.forName("com.mysql.cj.jdbc.Driver");
%>
<meta charset="UTF-8">
<div class="cont" style=" padding-right: 2.5%;">
<div class="title" >
<div class="stars" style=" width: 100%;">
  <input class="star star-5" id="star-5" type="radio" name="star" value="5"/>
  <label class="star star-5" for="star-5"></label>
  <input class="star star-4" id="star-4" type="radio" name="star" value="4"/>
  <label class="star star-4" for="star-4"></label>
  <input class="star star-3" id="star-3" type="radio" name="star" value="3"/>
  <label class="star star-3" for="star-3"></label>
  <input class="star star-2" id="star-2" type="radio" name="star" value="2"/>
  <label class="star star-2" for="star-2"></label>
  <input class="star star-1" id="star-1" type="radio" name="star" value="1"/>
  <label class="star star-1" for="star-1"></label>

<div>
  <p style="padding-left: 14%;" onclick="gradebe()" >확인</p>
</div>
<script>
function gradebe(){
  var review = document.querySelector('input[name="star"]:checked').value; // 체크된 값(checked value)
   var pop = window.open("reviewdb.jsp?review="+review+"&room_num="+"<%=room_num%>"+"", "pop", "width=0,height=0");
   alert("리뷰 등록이 완료되었습니다!")
}
</script>

