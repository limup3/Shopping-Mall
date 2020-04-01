<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>    
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String password_encrypted = request.getParameter("password_encrypted");
	String passwordcheck_encrypted = request.getParameter("passwordcheck_encrypted");
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
	
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	String str="";

	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/jsp_project";
		String dbId = "limup3";
		String dbPass = "wjdqhqhdks";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		
		String sql = "insert into membership values (?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, password_encrypted);
		pstmt.setString(3, passwordcheck_encrypted);
		pstmt.setString(4, name);
		pstmt.setString(5, tel);	 
		int n = pstmt.executeUpdate();
		if( n > 0){
	%>
			<script type="text/javascript">
			alert("회원가입 성공!!")
			location.href="/SexyStreet/index.html";
			</script>
	<%
			
		}else{

			System.out.println("가입 실패!!");
		}			
	}catch(Exception e){
		out.println("Exception : " + e.getMessage());
	}
%>








