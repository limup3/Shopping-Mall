<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="ch13.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ include file="color.jspf"%>
<%
	int pageSize = 10; // 페이지당 글갯수
	int pageBlock = 10; // 블럭당 페이지수
	String pageNum = request.getParameter("pageNum");
	if (pageNum == null) {
		pageNum = "1";
	}
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1) * pageSize + 1;
	int endRow = currentPage * pageSize;

	BoardDBBean dbPro = BoardDBBean.getInstance();
	List<BoardDataBean> articleList = dbPro.getArticles(startRow, pageSize);
	int count = dbPro.getArticleCount();
	int number = count - (currentPage - 1) * pageSize;
	//if (articleList != null){
%>
<html>
<head>
<title>게시판</title>

</head>

<body>
	<center>
		<b>글목록(전체 글:<%=dbPro.getArticleCount()%>)
		</b>
		<table width="1100">


			<tr>
				<td align="right"><a href="writeForm.jsp">글쓰기</a> | <a
					href="writeForm2.jsp">자동생성</a> | <a href="deleteBoardPro.jsp">게시판비우기</a>

				</td>
		</table>
		
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr height="5"><td width="5"></td></tr>
<tr style="background:url('../images/table_mid.gif') repeat-x; text-align:center;">
<td width="5"><img src="../images/table_left.gif" width="5" height="30" /></td>
<td width="50">번호</td>
<td width="250">제목</td>
<td width="100">작성자</td>
<td width="150">작성일</td>
<td width="50">조회수</td>
<td width="100">ip</td>
<td width="7"><img src="../images/table_right.gif" width="5" height="30" /></td>
</tr>
<tr height="25" align="center">
</tr>
<table>
			<tr>
				<td align="center">
					<%
						if (dbPro.getArticleCount() == 0) {
					%> 게시판에 저장된 글이 없습니다. <%
						}
					%>
				</td>
		</table>
		<%
			if (count > 0) {
		%>
		<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr><td colspan="4" height="5"></td></tr>
<tr align="center">

			<%
				for (int i = 0; i < articleList.size(); i++) {
						BoardDataBean article = articleList.get(i);
			%>

			<tr height="30">
				<td align="center" width="50"><%=number--%></td>
				<td width="250">
					<%
						if (article.getRe_level() > 0) {
					%> <img src="../images/level.gif"	width=<%=10*article.getRe_level()%> height="16"> 
						<img src="../images/re.gif"> <%
 	} else {
 %> <img src="../images/level.gif"	height="16"> <%
 	}
 %> <%
 	if (article.getReadcount() >= 20) {
 %> <img
					src="../images/hot.gif" border="0" height="16"> <%
 	}
 %> 
 
 				<a href="../board/content.jsp?num=<%=article.getNum()%>&pageNum=<%=currentPage%>">
						<%=article.getSubject()%>
				</a>

				</td>
				<td align="center" width="100"><%=article.getWriter()%></td>
				<td align="center" width="150"><%=article.getReg_date()%></td>
				<td align="center" width="50"><%=article.getReadcount()%></td>
				<td align="center" width="100"><%=article.getIp()%></td>
			</tr>
			<%
				}
			%>

		</table>
<tr height="1" bgcolor="#D2D2D2"><td colspan="7"></td></tr>

<tr height="1" bgcolor="#82B5DF"><td colspan="7" width="752"></td></tr>
</table>


		<%
			int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);

				int startPage = 1;

				if (currentPage % pageBlock != 0) {
					startPage = (currentPage / 10) * 10 + 1;
				} else {
					startPage = ((currentPage / 10) - 1) * pageBlock + 1;
				}

				int endPage = startPage + pageBlock - 1;
				if (endPage > pageCount)
					endPage = pageCount;
		%>
		<%
			if (startPage > pageBlock) {
		%>
		<a href="list.jsp?pageNum=<%=startPage - pageBlock%>">[이전]</a>
		<%
			}
		%>

		<%
			for (int i = startPage; i <= endPage; i++) {
		%>
		<a href="list.jsp?pageNum=<%=i%>">[<%=i%>]
		</a>
		<%
			}
		%>


		<%
			if (endPage < pageCount) {
		%>
		<a href="../board/list.jsp?pageNum=<%=startPage + pageBlock%>">[다음]</a>
		<%
			}
		%>


	</center>
</body>
</html>
<%
	}
%>








