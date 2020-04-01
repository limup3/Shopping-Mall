<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String password_encrypted = request.getParameter("password_encrypted");
	String passwordcheck_encrypted = request.getParameter("passwordcheck_encrypted");
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/jsp_project";
		String dbId = "limup3";
		String dbPass = "wjdqhqhdks";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		String sql = "update membership set password_encrypted=?, ";
		sql += "name=?, tel=? where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, password_encrypted);
		pstmt.setString(2, name);
		pstmt.setString(3, tel);
		pstmt.setString(4, id);
		pstmt.executeUpdate();
		response.sendRedirect("/SexyStreet/member/joinlist.jsp");
	}catch(Exception e){
		System.out.println("Exception : " + e.getMessage());
	}
%>    











