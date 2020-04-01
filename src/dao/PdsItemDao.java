package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import jdbc.JdbcUtil;
import model.PdsItem;
import java.util.StringTokenizer;
 

public class PdsItemDao 
{
      private static PdsItemDao instance = new PdsItemDao();


      public static PdsItemDao getInstance()
      { return instance; }
 
      private PdsItemDao() {}
 
      public int selectCount(Connection conn) throws SQLException
      {
            Statement stmt = null;
            ResultSet rs = null;
  
            try
            {
                  stmt = conn.createStatement();
                  rs = stmt.executeQuery("select count(*) from pds_item");
                  rs.next();
                  return rs.getInt(1);
            }finally{
                  JdbcUtil.close(rs);
                  JdbcUtil.close(stmt);
            }
      }
 
      public List<PdsItem> select(Connection conn, int firstRow, int endRow)
            throws SQLException
      {
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            
            String sql = "";
            try
            {
            	sql = "select pds_item_id, filename, realpath, filesize, downloadcount "
                        + "from pds_item "
                        + "where pds_item_id <= ? and pds_item_id >= ? " 
                        + "order by pds_item_id desc ";
            	pstmt = conn.prepareStatement(sql);
                         
                  pstmt.setInt(1, endRow);
                  pstmt.setInt(2, firstRow);
                  rs = pstmt.executeQuery();
   
                  if(!rs.next())
                  {
                        return Collections.emptyList();
                  }
                  List<PdsItem> itemList = new ArrayList<PdsItem>();
   
                  do
                  {
                        PdsItem article = makeItemFromResultSet(rs);
                        itemList.add(article);
                  }while(rs.next());
                  return itemList;
            }finally{
                  JdbcUtil.close(rs);
                  JdbcUtil.close(pstmt);
            }
      }
 
      private PdsItem makeItemFromResultSet(ResultSet rs) throws SQLException
      {
            PdsItem item = new PdsItem();
            item.setId(rs.getInt("pds_item_id"));
            
            // string conversion
            String fileName = rs.getString("filename");
            	// 	"\" is special in java so u use "\\\\" when using split()
            String[] fileNameTokens = fileName.split("\\\\");  
            
            fileName = fileNameTokens[fileNameTokens.length-1];
            item.setFileName(fileName);
            
            item.setRealPath(rs.getString("realpath"));
            item.setFileSize(rs.getLong("filesize"));
            item.setDownloadCount(rs.getInt("downloadcount"));
            return item;
      }
 
      public PdsItem selectById(Connection conn, int itemId) throws SQLException
      {
            PreparedStatement pstmt = null;
            ResultSet rs = null;
  
            try
            {
                  pstmt = conn.prepareStatement("select * from pds_item "
                         + "where pds_item_id = ?");
                  pstmt.setInt(1, itemId);
                  rs = pstmt.executeQuery();
   
                  if(!rs.next())
                  {
                        return null;
                  }
                  PdsItem item = makeItemFromResultSet(rs);
                  return item;
            }finally{
                  JdbcUtil.close(rs);
                  JdbcUtil.close(pstmt);
            }
      }
 
      public int insert(Connection conn, PdsItem item) throws SQLException
      {
            PreparedStatement pstmt = null;
            Statement stmt = null;
            ResultSet rs = null;
  
            try
            {
                  pstmt = conn.prepareStatement("insert into pds_item "
                         + "(filename, realpath, filesize, downloadcount) "
                         + "values (?, ?, ?, 0)");
                  pstmt.setString(1, item.getFileName());
                  pstmt.setString(2, item.getRealPath());
                  pstmt.setLong(3, item.getFileSize());
   
                  int insertedCount = pstmt.executeUpdate();
   
                  if(insertedCount > 0)
                  {
                        stmt = conn.createStatement();

                        //rs = stmt.executeQuery("select pds_item_id_seq.CURRVAL from dual"); // oracle
                        rs = stmt.executeQuery("select MAX(pds_item_id) from pds_item");
    
                        if(rs.next())
                        {
                              return rs.getInt(1);
                        }
                  }
                  return -1;
            }finally{
                  JdbcUtil.close(rs);
                  JdbcUtil.close(stmt);
                  JdbcUtil.close(pstmt);
            }
      }
 
      public int increaseCount(Connection conn, int id) throws SQLException
      {
            PreparedStatement pstmt = null;
  
            try
            {
                  pstmt = conn.prepareStatement("update pds_item set downloadcount ="
                         + "downloadcount + 1 where pds_item_id = ?");
                  pstmt.setInt(1, id);
                  return pstmt.executeUpdate();
            }finally{
                  JdbcUtil.close(pstmt);
            }
      }
}
