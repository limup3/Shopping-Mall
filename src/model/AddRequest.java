package model;

public class AddRequest 
{
      private String fileName;
      private long fileSize;
      private String realPath;
 
      public String getFileName()
      { return fileName; }
 
      public void setFileName(String fileName)
      { this.fileName = fileName; }
 
      public long getFileSize()
      { return fileSize; }
 
      public void setFileSize(long fileSize)
      { this.fileSize = fileSize; }
 
      public String getRealPath()
      { return realPath; }
 
      public void setRealPath(String realPath)
      { this.realPath = realPath; }
 
      public PdsItem toPdsItem()
      {
            PdsItem item = new PdsItem();
            item.setFileName(fileName);
            item.setFileSize(fileSize);
            item.setRealPath(realPath);
            return item;
      }
}