<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="color.jspf"%>
 <%
 	int num = Integer.parseInt(request.getParameter("num"));
 %>
<html>
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body bgcolor=<%=bodyback_c %>>
<center><b>글삭제</b>
<br>
<form action= "../board/deletePro.jsp">
 <table border="1" align="center" cellspacing="0" cellpadding="0" width="360">
  <tr height="30">
     <td align=center bgcolor=<%=value_c %>>
     <input type=hidden name=num value=<%=num %>>
       <b>비밀번호를 입력해 주세요.</b></td>
  </tr>
  <tr height="30">
     <td align=center >비밀번호 :   
       <input type="password" name="passwd" size="8" maxlength="12">
 </tr>
 <tr height="30">
    <td align=center>
      <input type="submit" value="글삭제" >
      <input type="button" value="글목록" onClick="location.href='../board/list.jsp'">     
   </td>
 </tr>  
</table> 
</form>
</body>
</html>