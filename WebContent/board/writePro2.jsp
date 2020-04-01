<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "ch13.*" %>
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="article" class="ch13.BoardDataBean">
	<jsp:setProperty name="article" property="*"/>
</jsp:useBean>
<%
	int articleCount = Integer.parseInt(request.getParameter("articleCount"));
	BoardDBBean dbPro = BoardDBBean.getInstance();
	String writer = article.getWriter();
	String subject = article.getSubject();
	for(int i=1;i<=articleCount;i++)
	{
	
	article.setReg_date(new Timestamp(System.currentTimeMillis()));
	article.setIp(request.getRemoteAddr());
	article.setWriter(writer + "_" + i);
	article.setSubject(subject + "_" + i);
	dbPro.insertArticle(article);
	}
	response.sendRedirect("list.jsp");
%>