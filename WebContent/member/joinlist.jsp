<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String jdbcUrl = "jdbc:mysql://localhost:3306/jsp_project";
	String dbId = "limup3";
	String dbPass = "wjdqhqhdks";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		pstmt = conn.prepareStatement("select * from membership");
		rs = pstmt.executeQuery();
	//}catch(Exception e){
		//System.out.println("Exception : " + e.getMessage());
	//}
%>    
<!DOCTYPE html>
<html>
<head>
<jsp:include page="Header.jsp" />
</head>
<body>


<div class="row">
	<div class="col-sm-2"></div>
	
	
	<div class="col-sm-9">
		<h2 class="text-center">모든 회원 보기</h2>
		
		<div class="table-responsive">
			<table class="table table-striped">
				<tr>
				 	 <td>아이디</td>
					<td>비밀번호</td>
					<td>이름</td>
					<td>전화번호</td>
					<td>수정</td>
				</tr>
	
<% while(rs.next()){  %>	
	<tr>
		<td><%=rs.getString("id") %></td>
		<td><%=rs.getString("password_encrypted") %></td>
		<td><%=rs.getString("name") %></td>
		<td><%=rs.getString("tel") %></td>
		<td>
		<input type=button class="btn btn-success" onClick="location.href='/SexyStreet/member/joinUpdateForm.jsp?id=<%=rs.getString("id") %>'" value=수정>
		<input type=button class="btn btn-warning" onClick="location.href='/SexyStreet/member/joinDeleteForm.jsp?id=<%=rs.getString("id") %>'" value=삭제>
		</td>
		
	</tr>
<% } %>	
		</table>
		</div>
		
	</div>
	
</div>



</body>
</html>
<%
	}catch(Exception e){
		System.out.println("Exception : " + e.getMessage());
	}
%>
