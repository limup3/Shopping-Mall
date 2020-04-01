<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="color.jspf" %>
<%@ page import = "ch13.*" %>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	BoardDBBean dbPro = BoardDBBean.getInstance();
	BoardDataBean article = dbPro.getArticle(num);
%>
<html>
 <head>
 <title>게시판</title>
 <link href="style.css" rel="stylesheet" type="text/css">
 <script language="JavaScript" src="script.js"></script>
 </head>
 <body>

    <table width="100%" cellpadding="0" cellspacing="0" border="0">
     <tr style="background:url('../images/table_mid.gif') repeat-x; text-align:center;">
      <td width="5"><img src="../images/table_left.gif" width="5" height="30" /></td>
      <td>수정</td>
      <td width="5"><img src="../images/table_right.gif" width="5" height="30" /></td>
     </tr>
    </table>
     <form action = "../board/updatePro.jsp">
 <table>
      <tr>
      <td>&nbsp;</td>
      <td align="center">이름</td>
      <td>
      <input type="text" size="50" maxlength="50" name="writer" value=<%=article.getWriter() %>>
	   <input type="hidden" name="num" value=<%=article.getNum() %> ></td>
      <td>&nbsp;</td>
     </tr>
         <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td align="center">제목</td>
      <td><input type="text" size="50" maxlength="100" name="subject"  value=<%=article.getSubject() %>></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr>
      <td>&nbsp;</td>
      <td align="center">Email</td>
      <td><input type="text" size="50" maxlength="100" name="email" value=<%=article.getEmail() %>></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
      <tr>
      <td>&nbsp;</td>
      <td align="center">내용</td>
      <td><textarea name="content" rows="13" cols="40"><%=article.getContent() %></textarea></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
     <tr align="center">
  <tr>
      <td>&nbsp;</td>
      <td align="center">비밀번호</td>
      <td><input type="password" name="passwd" size="50" maxlength="50" value=<%=article.getPasswd() %>></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
<tr>      
 <td colspan=2 align="center"> 
     <input type="submit" value="글수정">  
     <input type="reset" value="다시작성">
     <input type="button" value="목록보기" onClick="location.href='list.jsp'" >
   </td>
 </tr>
 </table>
  </form>
</body>
</html> 