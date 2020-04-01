package service;

import java.sql.Connection;
import java.sql.SQLException;
import dao.PdsItemDao;
import jdbc.JdbcUtil;
import connection.ConnectionProvider;

public class IncreaseDownloadCountService 
{
      private static IncreaseDownloadCountService instance
            = new IncreaseDownloadCountService();
 
      public static IncreaseDownloadCountService getInstance()
      { return instance; }
 
      private IncreaseDownloadCountService() {}
 
      public boolean increaseCount(int id) throws Exception
      {
            Connection conn = null;
  
            try
            {
                  conn = ConnectionProvider.getConnection();
   
                  int updatedCount = PdsItemDao.getInstance().increaseCount(conn, id);
   
                  return updatedCount == 0 ? false : true;
            }catch(SQLException e){
                  throw new RuntimeException("RuntimeException : " + e.getMessage(), e);
            }finally{
                  JdbcUtil.close(conn);
            }
      }
}
