package ch13;

import java.sql.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;

import org.apache.tomcat.jdbc.pool.DataSource;

public class BoardDBBean {
   private static BoardDBBean instance = new BoardDBBean();

   public static BoardDBBean getInstance() {
      return instance;
   }

   private BoardDBBean() {
   };

   private Connection getConnection() throws Exception {
      Connection conn = null;
      String jdbcUrl = "jdbc:mysql://localhost:3306/jsp_project";
      String dbId = "limup3";
      String dbPass = "wjdqhqhdks";

      Class.forName("com.mysql.jdbc.Driver");
      conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
      return conn;
   }

   public void insertArticle(BoardDataBean article) throws Exception {
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;

      int num = article.getNum();
      int ref = article.getRef();
      int re_step = article.getRe_step();
      int re_level = article.getRe_level();
      int number = 0;
      String sql = "";

      try {
         conn = getConnection();

         pstmt = conn.prepareStatement("select max(num) from board");
         rs = pstmt.executeQuery();

         if (rs.next())
            number = rs.getInt(1) + 1;
         else
            number = 1;

         if (num != 0) {
            sql = "update board set re_step=re_step+1 ";
            sql += "where ref= ? and re_step> ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, ref);
            pstmt.setInt(2, re_step);
            pstmt.executeUpdate();
            re_step = re_step + 1;
            re_level = re_level + 1;
         } else {
            ref = number;
            re_step = 0;
            re_level = 0;
         }

         sql = "insert into board(writer,email,subject,passwd,reg_date,";
         sql += "ref,re_step,re_level,content,ip) values(?,?,?,?,?,?,?,?,?,?)";
         
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, article.getWriter());
         pstmt.setString(2, article.getEmail());
         pstmt.setString(3, article.getSubject());
         pstmt.setString(4, article.getPasswd());
         pstmt.setTimestamp(5, article.getReg_date());
         pstmt.setInt(6, ref);
         pstmt.setInt(7, re_step);
         pstmt.setInt(8, re_level);
         pstmt.setString(9, article.getContent());
         pstmt.setString(10, article.getIp());
         pstmt.executeUpdate();
      } catch (Exception ex) {
         ex.printStackTrace();
      } finally {
         if (rs != null)
            try {
               rs.close();
            } catch (SQLException ex) {
            }
         if (pstmt != null)
            try {
               pstmt.close();
            } catch (SQLException ex) {
            }
         if (conn != null)
            try {
               conn.close();
            } catch (SQLException ex) {
            }
      }
   }

   public List<BoardDataBean> getArticles(int start, int end) throws Exception {
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      List<BoardDataBean> articleList = null;
      try {
         conn = getConnection();

         pstmt = conn.prepareStatement("select * from board order by ref desc, re_step asc limit ?,? ");
         pstmt.setInt(1, start - 1);
         pstmt.setInt(2, end);
         rs = pstmt.executeQuery();

         if (rs.next()) {
            articleList = new ArrayList<BoardDataBean>(end);
            do {
               BoardDataBean article = new BoardDataBean();
               article.setNum(rs.getInt("num"));
               article.setWriter(rs.getString("writer"));
               article.setEmail(rs.getString("email"));
               article.setSubject(rs.getString("subject"));
               article.setPasswd(rs.getString("passwd"));
               article.setReg_date(rs.getTimestamp("reg_date"));
               article.setReadcount(rs.getInt("readcount"));
               article.setRef(rs.getInt("ref"));
               article.setRe_step(rs.getInt("re_step"));
               article.setRe_level(rs.getInt("re_level"));
               article.setContent(rs.getString("content"));
               article.setIp(rs.getString("ip"));

               articleList.add(article);
            } while (rs.next());
         }
      } catch (Exception ex) {
         // ex.printStackTrace();
         System.out.println("Exception : " + ex.getMessage());
      } finally {
         if (rs != null)
            try {
               rs.close();
            } catch (SQLException ex) {
            }
         if (pstmt != null)
            try {
               pstmt.close();
            } catch (SQLException ex) {
            }
         if (conn != null)
            try {
               conn.close();
            } catch (SQLException ex) {
            }
      }
      return articleList;
   }

   public int getArticleCount() {
      int count = 0;
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      
      try {
         conn = getConnection();
         pstmt = conn.prepareStatement("select count(*) from board");
         rs = pstmt.executeQuery();
         if(rs.next()) {
            count = rs.getInt(1);
         }
      }catch(Exception e) {
         System.out.println(e.getMessage());
      } finally {
         if (rs != null)
            try {
               rs.close();
            } catch (SQLException ex) {
            }
         if (pstmt != null)
            try {
               pstmt.close();
            } catch (SQLException ex) {
            }
         if (conn != null)
            try {
               conn.close();
            } catch (SQLException ex) {
            }
      }
      return count;
   }
   public BoardDataBean getArticle(int num) {
	   Connection conn = null;
	   PreparedStatement pstmt = null;
	   ResultSet rs = null;
	   BoardDataBean article = null;
	   
	   
	   
	   try {
		   conn = getConnection();
		   String sql = "select * from board where num = ? ";
		   pstmt = conn.prepareStatement(sql);
		   pstmt.setInt(1,num);
		   rs = pstmt.executeQuery();
		   if(rs.next()) {
			   article = new BoardDataBean();
			   article.setNum(rs.getInt("num"));
			   article.setWriter(rs.getString("writer"));
			   article.setEmail(rs.getString("email"));
               article.setSubject(rs.getString("subject"));
               article.setPasswd(rs.getString("passwd"));
               article.setReg_date(rs.getTimestamp("reg_date"));
               article.setReadcount(rs.getInt("readcount"));
               article.setRef(rs.getInt("ref"));
               article.setRe_step(rs.getInt("re_step"));
               article.setRe_level(rs.getInt("re_level"));
               article.setContent(rs.getString("content"));
               article.setIp(rs.getString("ip"));
		   }
	   }catch(Exception e) {
		   System.out.println("Exception : " + e.getMessage());
	   }finally {if (rs != null)
            try {
               rs.close();
            } catch (SQLException ex) {
            }
         if (pstmt != null)
            try {
               pstmt.close();
            } catch (SQLException ex) {
            }
         if (conn != null)
            try {
               conn.close();
            } catch (SQLException ex) {
            }
		   
	   }
	   return article;
   }
   public void updateArticle(BoardDataBean article) {
	   Connection conn = null;
	   PreparedStatement pstmt = null;
	   
	   try {
		   conn = getConnection();
		   String sql = "update board set writer=?,email=?,subject=?,passwd=?,content=?";
		   sql += "where num=? ";
		   pstmt = conn.prepareStatement(sql);
		   pstmt.setString(1, article.getWriter());
		   pstmt.setString(2, article.getEmail());
		   pstmt.setString(3, article.getSubject());
		   pstmt.setString(4, article.getPasswd());
		   pstmt.setString(5, article.getContent());
		   pstmt.setInt(6, article.getNum());
		   pstmt.executeUpdate();
	   }catch(Exception e) {
		   System.out.println("Exception : "+ e.getMessage()); 
	   }finally {
		   
	         if (pstmt != null)
	            try {
	               pstmt.close();
	            } catch (SQLException ex) {
	            }
	         if (conn != null)
	            try {
	               conn.close();
	            } catch (SQLException ex) {
	            }
		   
	   }
   }
   public int deleteArticle(int num, String passwd) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int state = 0;
		try {
			conn = getConnection();
			String sql = "delete from board where num=? and passwd=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, passwd);
			state = pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("Exception : " + e.getMessage());
		}finally {
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	        if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		
		return state;
	}
   public void deleteBoard() {
	   Connection conn = null;
	   PreparedStatement pstmt = null;
	   int state = 0;
	   //System.out.println("num:"+num+",passwd:"+passwd);
	   try {
		   conn = getConnection();
		   String sql = "delete from board";
		   pstmt = conn.prepareStatement(sql);
		   pstmt.executeUpdate();
	   }catch(Exception e) {
		   System.out.println("Exception : " + e.getMessage());
	   }finally {
		   
	         if (pstmt != null)
	            try {
	               pstmt.close();
	            } catch (SQLException ex) {
	            }
	         if (conn != null)
	            try {
	               conn.close();
	            } catch (SQLException ex) {
	            }
		   
	   }
	 
   }
}