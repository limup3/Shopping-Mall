<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String id = request.getParameter("id");
	String password_encrypted = request.getParameter("password_encrypted");

	String jdbcUrl = "jdbc:mysql://localhost:3306/jsp_project";
	String dbId = "limup3";
	String dbPass = "wjdqhqhdks";

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		String sql = "select * from membership where id=? and password_encrypted=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, password_encrypted);
		rs = pstmt.executeQuery();
		if (id.equals("limup3")) {
%>
<script type="text/javascript">
	alert("admin로그인 성공!!")
	location.href = "/SexyStreet/member/joinlist.jsp";
</script>
<%
	} else {
%>
<script type="text/javascript">
	alert("user:<%=id%>로그인 성공!!")
	location.href = "/SexyStreet/member/joinUpdateForm2.jsp?id=<%=id%>";
</script>
<%
	}

	} catch (Exception e) {
		out.println("Exception :" + e.getMessage());
	}
%>