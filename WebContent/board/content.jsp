<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="color.jspf" %>
<%@ page import = "ch13.*" %>
<%
	BoardDBBean dbPro = BoardDBBean.getInstance();
	int num = Integer.parseInt(request.getParameter("num"));
	//Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	BoardDataBean article = dbPro.getArticle(num);
	
	int ref = article.getRef();
	int re_step = article.getRe_step();
	int re_level = article.getRe_level();
%>
<html> 
<head>
<title>게시판</title>
</head>
<body>
    <table width="100%" cellpadding="0" cellspacing="0" border="0">
     <tr style="background:url('../images/table_mid.gif') repeat-x; text-align:center;">
      <td width="5"><img src="../images/table_left.gif" width="5" height="30" /></td>
      <td>글 내용보기</td>
      <td width="5"><img src="../images/table_right.gif" width="5" height="30" /></td>
     </tr>
    </table> 

<br>
<form>
   <table width="413">
     <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">글번호</td>
      <td width="319"><%=article.getNum()%></td>
      <td width="0">&nbsp;</td>
     </tr>
	 <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
	<tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">조회수</td>
      <td width="319"><%=article.getRef()%></td>
      <td width="0">&nbsp;</td>
     </tr>
	 <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr> 
  <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">작성자</td>
      <td width="319"><%=article.getWriter()%></td>
      <td width="0">&nbsp;</td>
     </tr>
	 <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
	   <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">작성일</td>
      <td width="319"><%=article.getReg_date()%></td>
      <td width="0">&nbsp;</td>
     </tr>
	 <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
	 	   <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">글제목</td>
      <td width="319"><%=article.getSubject()%></td>
      <td width="0">&nbsp;</td>
     </tr>
	 <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
	 
	 	   <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">글내용</td>
      <td width="319"><pre><%=article.getContent()%></pre></td>
      <td width="0">&nbsp;</td>
     </tr>
	 <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>

  <tr height="30">     
    <td colspan="4" align="center" > 
	  <input type="button" value="글수정" onClick="location.href='../board/updateForm.jsp?num=<%=article.getNum()%>'">
	   &nbsp;&nbsp;&nbsp;&nbsp;
	  <input type="button" value="글삭제" onClick="location.href='deleteForm.jsp?num=<%=article.getNum()%>'">
	   &nbsp;&nbsp;&nbsp;&nbsp;
      <input type="button" value="답글쓰기" onClick="location.href='writeForm.jsp?num=<%=article.getNum()%>&ref=<%=ref%>&re_step=<%=re_step%>&re_level=<%=re_level%>'">
	   &nbsp;&nbsp;&nbsp;&nbsp;
       <input type="button" value="글목록" onClick="location.href='list.jsp?pageNum=<%=pageNum%>'">
    </td>
  </tr>
</table>    
</form>      
</body>
</html>