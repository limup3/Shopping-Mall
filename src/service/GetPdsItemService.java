package service;

import java.sql.Connection;
import java.sql.SQLException;
import dao.PdsItemDao;
import model.PdsItem;
import jdbc.JdbcUtil;
import connection.ConnectionProvider;

 
public class GetPdsItemService 
{
      private static GetPdsItemService instance = new GetPdsItemService();
 
      public static GetPdsItemService getInstance()
      { return instance; }
 
      private GetPdsItemService() {}
 
      public PdsItem getPdsItem(int id) throws Exception
      {
            Connection conn = null;
  
            try
            {
                  conn = ConnectionProvider.getConnection();
                  PdsItem pdsItem = PdsItemDao.getInstance().selectById(conn, id);
   
                  if(pdsItem == null)
                  {
                        throw new PdsItemNotFoundException("PdsItemNotFoundException : " + id);
                  }
                  return pdsItem;
            }catch(SQLException e){
                  throw new RuntimeException("RuntimeException: " + e.getMessage(), e);
            }finally{
                  JdbcUtil.close(conn);
            }
      }
}
