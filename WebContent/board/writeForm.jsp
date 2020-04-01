<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="color.jspf"%>
<%
	int num= 0;
	int ref= 1;
	int re_step= 0;
	int re_level= 0;
	if(request.getParameter("num")!=null){ // 답글이라면
		num = Integer.parseInt(request.getParameter("num"));
		ref = Integer.parseInt(request.getParameter("ref"));
		re_step = Integer.parseInt(request.getParameter("re_step"));
		re_level = Integer.parseInt(request.getParameter("re_level"));
	}
%>


<html> 
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>
<body >
<table>
  <tr>
   <td>
    <table width="100%" cellpadding="0" cellspacing="0" border="0">
     <tr style="background:url('../images/table_mid.gif') repeat-x; text-align:center;">
      <td width="5"><img src="../images/table_left.gif" width="5" height="30" /></td>
      <td>글쓰기</td>
      <td width="5"><img src="../images/table_right.gif" width="5" height="30" /></td>
     </tr>
    </table>
<br>
<form action="writePro.jsp">
<input type="hidden" name="num" value="<%=num%>">
<input type="hidden" name="ref" value="<%=ref%>">
<input type="hidden" name="re_step" value="<%=re_step%>">
<input type="hidden" name="re_level" value="<%=re_level%>">

<table>
      <tr>
      <td>&nbsp;</td>
      <td align="center">이름</td>
      <td><input type="text" name="writer" size="50" maxlength="50"></td>
      <td>&nbsp;</td>
     </tr>
         <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td align="center">제목</td>
      <td><input type="text" name="subject" size="50" maxlength="100"></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr>
      <td>&nbsp;</td>
      <td align="center">Email</td>
      <td><input type="text" name="email" size="50" maxlength="100"></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
      <tr>
      <td>&nbsp;</td>
      <td align="center">내용</td>
      <td><textarea name="content" rows="13" cols="40"></textarea></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
     <tr align="center">
  <tr>
      <td>&nbsp;</td>
      <td align="center">비밀번호</td>
      <td><input type="password" name="passwd" size="50" maxlength="50"></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr>      
 <td colspan=2 align="center">  
  <input type="submit" value="글쓰기"  >  
  <input type="reset" value="다시작성">
  <input type="button" onClick="location.href='../board/list.jsp'"  value="목록보기" >
  
</td></tr></table>  
</form>  
</body>
</html>