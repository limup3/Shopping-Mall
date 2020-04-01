package connection;

import java.sql.Connection;
import java.sql.DriverManager;
//import java.sql.SQLException;
//import java.sql.*;
//import javax.naming.*;
//import javax.sql.DataSource;

public class ConnectionProvider 
{
	public static Connection getConnection() throws Exception
    {
//  	  Context initCtx = null;
//  	  Context envCtx = null;
//  	  DataSource ds = null;
//  	  try {
//  		  initCtx = new InitialContext();
//  	  	  envCtx = (Context)initCtx.lookup("java:comp/env");
//  	  	  ds = (DataSource)envCtx.lookup("jdbc/web_project_db");
//  	  	  
//  	  }catch(Exception e) {
//  		  
//  	  }
//  	  return ds.getConnection();
  	  Connection conn = null;
  	  String jdbcUrl = "jdbc:mysql://localhost:3306/jsp_project";
  	  String dbId = "limup3";
  	  String dbPass = "wjdqhqhdks";
	  		
  	  Class.forName("com.mysql.jdbc.Driver");
  	  conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
  	  return conn;
        //return DriverManager.getConnection("jdbc:apache:commons:dbcp:/pool");
    }
}
