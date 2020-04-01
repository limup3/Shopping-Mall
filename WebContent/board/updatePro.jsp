<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "ch13.*" %>
<% 
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="article" class="ch13.BoardDataBean">
	<jsp:setProperty name="article" property="*" />
</jsp:useBean>	
<%
	BoardDBBean dbPro = BoardDBBean.getInstance();
	dbPro.updateArticle(article);
	response.sendRedirect("list.jsp");
%>