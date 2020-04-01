<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "ch13.*" %>
<%
	BoardDBBean dbPro = BoardDBBean.getInstance();
	dbPro.deleteBoard();
	response.sendRedirect("list.jsp");
%>