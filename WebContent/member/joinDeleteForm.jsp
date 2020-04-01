<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                    <h2 class="text-center">회원 정보 삭제하기</h2>
                     
                    <form action="joinDelete.jsp" method="post">
                     
                    <table class="table table-striped">
                      <tr>
                        <td>아이디</td>
                        <td><%= request.getParameter("id") %></td>
                      </tr>
                       
                      <tr>
                        <td>패스워드</td>
                        <td>
                        <input type="password"  name="pass1" class="form-control">
                        </td>
                      </tr>
                       
                    <tr>
                        <td colspan="2" class="text-center">
                         <input type="hidden" name="id" value="<%= request.getParameter("id") %>">
                         <input type="submit" value="회원 삭제하기" class="btn btn-success">
 <button type="button"  class="btn btn-warning" onclick="location.href='../index.html'">메인으로</button>
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