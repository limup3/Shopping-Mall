<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ page import = "service.AddPdsItemService" %>
<%@ page import = "file.FileSaveHelper" %>
<%@ page import = "model.AddRequest" %>
<%@ page import = "model.PdsItem" %>
<%@ page import = "java.util.Iterator" %>
<%@ page import = "java.util.List" %>
<%@ page import = "org.apache.commons.fileupload.FileItem" %>
<%@ page import = "org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import = "org.apache.commons.fileupload.servlet.ServletFileUpload" %>

 

<%
      boolean isMultipart = ServletFileUpload.isMultipartContent(request);
      if(!isMultipart)
      {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            return;
      }
      
      DiskFileItemFactory factory = new DiskFileItemFactory();
      ServletFileUpload upload = new ServletFileUpload(factory);
      List items = upload.parseRequest(request);
      AddRequest addRequest = new AddRequest();
 
      Iterator<FileItem> iter = items.iterator();
 
      while(iter.hasNext())
      {
            FileItem item = iter.next();
  
            if(item.isFormField())
            {
//                   String name = item.getFieldName();
   
//                   if(name.equals("description"))
//                   {
//                         String value = item.getString();
//                         addRequest.setDescription(value);
//                   }
            }
            else
            {
                  String name = item.getFieldName();
   
                  if(name.equals("file"))
                  {
                        String realPath = FileSaveHelper.save("C:\\Storage", item.getInputStream());
                        addRequest.setFileName(item.getName());
                        addRequest.setFileSize(item.getSize());
                        addRequest.setRealPath(realPath);
                  }
            }
      }
      PdsItem pdsItem = AddPdsItemService.getInstance().add(addRequest);
%>

 

<html>
<head><title>업로드 성공</title></head>
<script type="text/javascript">
		alert("<%= pdsItem.getFileName() %> 파일을 업로드 했습니다.")
		location.href="../process/list.jsp";
		</script>
</body>
</html>
