<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.sql.*" %>
<%

String id = request.getParameter("id");

String jdbcUrl = "jdbc:mysql://localhost:3306/jsp_project";
String dbId = "limup3";
String dbPass = "wjdqhqhdks";

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
try{
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
	String sql = "select * from membership where id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs = pstmt.executeQuery();
	//rs.next();
	if(rs.next()){
		//String str = "test gogo";
		//str.indexOf("gogo2");
%>  
<!DOCTYPE html>
<html>
<head>
<jsp:include page="Header.jsp" />
</head>
<body>


 
<div class="container">
    <div class="row">
        <div class="col-sm-12">
            <div class="col-sm-2"></div>
                <div class="col-sm-9">
                    <h2 class="text-center">회원 정보 수정하기</h2>
                     
                    <form action=/SexyStreet/member/joinUpdateProc2.jsp method="post">
                     
                    <table class="table table-striped">
                      <tr>
                        <td>아이디</td>
                        <td><%=rs.getString("id") %></td>
                      </tr>
                       
                       <tr>
                        <td>패스워드</td>
                        <td>
                        <input type="password" value="<%=rs.getString("password_encrypted") %>" name="password_encrypted" class="form-control">
                        </td>
                      </tr>
            			</tr>
						<tr>
						<td>이 름</td>
						<td><input type=text name=name value=<%=rs.getString("name")%>  class="form-control" ></td>
						</tr>
                      <tr>
                        <td>전화</td>
                        <td>
                        <input type="tel" value="<%=rs.getString("tel") %>" name="tel" class="form-control">
                        </td>
                      </tr>
                       
                      
                       
                    <tr>
                        <td colspan="2" class="text-center">
                         <input type="hidden" name="id" value="<%=rs.getString("id") %>">
                         <input type="submit" value="회원 수정하기" class="btn btn-success">
 						<input type=button class="btn btn-warning" onClick="location.href='/SexyStreet/member/joinDeleteForm2.jsp?id=<%=rs.getString("id") %>'" value=회원정보삭제>
                         </td>    
                    </tr>
                          
                    </table>
                 
                </form>   
                     
                </div>
        </div> <!-- col-sm-12 -->
    </div><!-- row -->
</div> <!-- container end-->
     
     
</body>
</html>
<%
		}	// end if
	}catch(Exception e){
		System.out.println("Exception : " + e.getMessage());
	}
%>