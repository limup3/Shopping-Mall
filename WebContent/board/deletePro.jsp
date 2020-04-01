<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "ch13.*" %>
<%@ page import = "java.sql.*" %>

<%
	int num = Integer.parseInt(request.getParameter("num"));
	String passwd = request.getParameter("passwd");
	BoardDBBean dbPro = BoardDBBean.getInstance();
	int check = dbPro.deleteArticle(num, passwd);
	
	if(check ==1){ // 정상성공
		response.sendRedirect("list.jsp");
	}else{	//삭제실패
%>
	<script>
		alert("비밀번호가 틀렸습니다!\n다시 시도해 주세요!");
		history.back();
	</script>
 
<%		
	}
%>