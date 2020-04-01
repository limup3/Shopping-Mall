<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="color.jspf"%>
 <%
 	int num = Integer.parseInt(request.getParameter("num"));
 %>
<html>
<head>
<title>게시판</title>
</head>

<body>
<form action= "../board/deletePro.jsp">
<table>

    <table width="100%" cellpadding="0" cellspacing="0" border="0">
     <tr style="background:url('../images/table_mid.gif') repeat-x; text-align:center;">
      <td width="5"><img src="../images/table_left.gif" width="5" height="30" /></td>
      <td>삭제</td>
      <td width="5"><img src="../images/table_right.gif" width="5" height="30" /></td>
     </tr>
    </table>
     <tr>
     <input type=hidden name=num value=<%=num %>>
      <td>&nbsp;</td>
      <td align="center">비밀번호</td>
      <td><input type="password" name="passwd" size="50" maxlength="100"> </td>
      <td>&nbsp;</td>
     </tr>
	 <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
     <tr align="center">
      <td>&nbsp;</td>
      <td colspan="2"><input type="submit" value="글삭제" >
      <input type="button" value="글목록" onClick="location.href='list.jsp'">  
  <td>&nbsp;</td> 
    </tr>
     </table>  
   </td>
 </tr>  
</table> 
</form>
</body>
</html>

