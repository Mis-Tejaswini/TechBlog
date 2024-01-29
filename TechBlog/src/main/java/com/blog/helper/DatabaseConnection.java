package com.blog.helper;
import java.sql.*;

public class DatabaseConnection
{
   private static Connection con;
   public static Connection getConnection() throws SQLException{
	   try 
	   {
		  if(con==null) {
			  
			  // driver class load
			   Class.forName("com.mysql.jdbc.Driver");
			   
			   //create a connection..
			   con= DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog", "root", "sairaj0411");
			   
		  }
	   }catch(Exception e)
	   {
		e.printStackTrace();   
	   }
	   
	   return con;
   }
   
}
