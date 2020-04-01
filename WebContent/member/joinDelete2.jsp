<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");

	Connection conn = null;
	PreparedStatement pstmt = null;
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/jsp_project";
		String dbId = "limup3";
		String dbPass = "wjdqhqhdks";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		String sql = "delete from membership where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.executeUpdate();
		%>
		<script type="text/javascript">
		alert("삭제 완료")
		location.href="/SexyStreet/index.html";
		</script>
<%
	}catch(Exception e){
		System.out.println("Exception : " + e.getMessage());
	}
%>    
