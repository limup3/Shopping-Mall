<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

 

<%
      response.setHeader("Pragma", "No-cache");
      response.setHeader("Cache-Control", "no-cache");
      response.addHeader("Cache-Control", "no-store");
      response.setDateHeader("Expires", 1L);
%>
  <head>
    <title>자료실 목록</title>
    
    
   
<style>
table a:link {
   color: #666;
   font-weight: bold;
   text-decoration:none;
}
table a:visited {
   color: #999999;
   font-weight:bold;
   text-decoration:none;
}
table a:active,
table a:hover {
   color: #bd5a35;
   text-decoration:underline;
}
table {
   width:800px;
   font-family:Arial, Helvetica, sans-serif;
   color:#666;
   font-size:12px;
   text-shadow: 1px 1px 0px #fff;
   background:#eaebec;
   margin:30px;
   border:#ccc 1px solid;

   -moz-border-radius:3px;
   -webkit-border-radius:3px;
   border-radius:3px;

   -moz-box-shadow: 0 1px 2px #d1d1d1;
   -webkit-box-shadow: 0 1px 2px #d1d1d1;
   box-shadow: 0 1px 2px #d1d1d1;
}
table th {
   padding:21px 25px 22px 25px;
   border-top:1px solid #fafafa;
   border-bottom:1px solid #e0e0e0;

   background: #ededed;
   background: -webkit-gradient(linear, left top, left bottom, from(#ededed), to(#ebebeb));
   background: -moz-linear-gradient(top,  #ededed,  #ebebeb);
}
table th:first-child {
   text-align: left;
   padding-left:20px;
}
table tr:first-child th:first-child {
   -moz-border-radius-topleft:3px;
   -webkit-border-top-left-radius:3px;
   border-top-left-radius:3px;
}
table tr:first-child th:last-child {
   -moz-border-radius-topright:3px;
   -webkit-border-top-right-radius:3px;
   border-top-right-radius:3px;
}
table tr {
   text-align: center;
   padding-left:20px;
}
table td:first-child {
   text-align: left;
   padding-left:20px;
   border-left: 0;
}
table td {
   padding:10px;
   border-top: 1px solid #ffffff;
   border-bottom:1px solid #e0e0e0;
   border-left: 1px solid #e0e0e0;

   background: #fafafa;
   background: -webkit-gradient(linear, left top, left bottom, from(#fbfbfb), to(#fafafa));
   background: -moz-linear-gradient(top,  #fbfbfb,  #fafafa);
}
table td.second {
  text-align:right;
   padding:18px;
   border-top: 1px solid #ffffff;
   border-bottom:1px solid #e0e0e0;
   border-left: 1px solid #e0e0e0;

   background: #fafafa;
   background: -webkit-gradient(linear, left top, left bottom, from(#fbfbfb), to(#fafafa));
   background: -moz-linear-gradient(top,  #fbfbfb,  #fafafa);
}
table tr.even td {
   background: #f6f6f6;
   background: -webkit-gradient(linear, left top, left bottom, from(#f8f8f8), to(#f6f6f6));
   background: -moz-linear-gradient(top,  #f8f8f8,  #f6f6f6);
}
table tr:last-child td {
   border-bottom:0;
}
table tr:last-child td:first-child {
   -moz-border-radius-bottomleft:3px;
   -webkit-border-bottom-left-radius:3px;
   border-bottom-left-radius:3px;
}
table tr:last-child td:last-child {
   -moz-border-radius-bottomright:3px;
   -webkit-border-bottom-right-radius:3px;
   border-bottom-right-radius:3px;
}
table tr:hover td {
   background: #f2f2f2;
   background: -webkit-gradient(linear, left top, left bottom, from(#f2f2f2), to(#f0f0f0));
   background: -moz-linear-gradient(top,  #f2f2f2,  #f0f0f0);   
}
</style>

<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600' rel='stylesheet' type='text/css'>
</head>
<body>

<table width="100%" cellspacing='0'> <!-- cellspacing='0' is important, must stay -->

<c:if test = "${listModel.totalPageCount > 0}">
<tr>
      <td colspan = "5">
            ${listModel.startRow} - ${listModel.endRow}
            [${listModel.requestPage} / ${listModel.totalPageCount}]
      </td>
</tr>
</c:if>

   <!-- Table Header -->
   <thead>
      <tr>
         <th>번호</th>
         <th>파일명</th>
         <th>파일크기</th>
         <th>다운로드 횟수</th>
         <th>다운로드</th>
      </tr>
   </thead>
   <!-- Table Header -->

   <!-- Table Body -->
   <c:choose>
<c:when test = "${listModel.hasPdsItem == false}">
<tr>
      <td colspan = "5">
            게시글이 없습니다.
      </td>
</tr>
</c:when>

 

<c:otherwise>
<c:forEach var = "item" items = "${listModel.pdsItemList}">
<tr>
      <td>${item.id}</td>
      <td>${item.fileName}</td>
      <td>${item.fileSize}</td>
      <td>${item.downloadCount}</td>
      <td><a href = "../process/download.jsp?id=${item.id}">다운받기</a></td>
</tr>
</c:forEach>
<tr>
      <td colspan = "5">
            <c:if test = "${beginPage > 10}">
                  <a href = "list.jsp?p=${beginPage-1}">이전</a>
            </c:if>
            <c:forEach var = "pno" begin = "${beginPage}" end = "${endPage}">
                  <a href = "list.jsp?p=${pno}">[${pno}]</a>
            </c:forEach>
            <c:if test = "${endPage < listModel.totalPageCount}">
                  <a href = "list.jsp?p=${endPage+1}">다음</a>
            </c:if>
      </td>
</tr>
</c:otherwise>
</c:choose>
<tr>
      <td colspan = "5">
            <a href = "../form/uploadForm.jsp">파일 첨부</a>
 </td>
</tr>

</table>
    
</body>