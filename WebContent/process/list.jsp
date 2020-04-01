
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "service.ListPdsItemService" %>
<%@ page import = "model.PdsItemListModel" %>

 <head>
 <link rel="shortcut icon" type="image/x-icon" href="images/tuxedo.png" />
 </head>

<%
      String pageNumberString = request.getParameter("p");
      int pageNumber = 1;
 
      if(pageNumberString != null && pageNumberString.length() > 0)
      {
            pageNumber = Integer.parseInt(pageNumberString);
      }
 
      ListPdsItemService listService = ListPdsItemService.getInstance();
      PdsItemListModel itemListModel = listService.getPdsItemList(pageNumber);
      request.setAttribute("listModel", itemListModel);
 
      if(itemListModel.getTotalPageCount() > 0)
      {
            int beginPageNumber = (itemListModel.getRequestPage() - 1) / 10 * 10 + 1;
            int endPageNumber = beginPageNumber + 9;
  
            if(endPageNumber > itemListModel.getTotalPageCount())
            {
                  endPageNumber = itemListModel.getTotalPageCount();
            }
            request.setAttribute("beginPage", beginPageNumber);
            request.setAttribute("endPage", endPageNumber);
      }
%>
<jsp:forward page = "../view/list_view.jsp" />
