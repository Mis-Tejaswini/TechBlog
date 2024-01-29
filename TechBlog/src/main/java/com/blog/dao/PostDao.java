package com.blog.dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.blog.entities.Category;
import com.blog.entities.Post;
public class PostDao {

	Connection con;

	public PostDao(Connection con) {
		super();
		this.con = con;
	}
	
	public ArrayList<Category> getAllCategories(){
		ArrayList<Category> list = new ArrayList<>();
		
		try {
			
			String q="select * from categories";
			Statement st= this.con.createStatement();
			ResultSet set=st.executeQuery(q);
			
			while(set.next()) 
			{
			 int cid=set.getInt("cid");
			 String name=set.getString("name");
			 String description=set.getString("description");
			 Category c=new Category(cid, name, description);
			 list.add(c);
			 
			}
		} catch (Exception e) {
			// TODO: handle exception
		e.printStackTrace();
		}
		
		return list;
	}
	
	public boolean SavePost(Post p) {
		
		boolean f= false;
		try {
			String q= "insert into post(pTitle, pContent, pCode, pPic, catId, userId) values(?,?,?,?,?,?)";
			PreparedStatement pstmt=con.prepareStatement(q);
			pstmt.setString(1, p.getpTitle());
			pstmt.setString(2, p.getpContent());
			pstmt.setString(3, p.getpContent());
			pstmt.setString(4, p.getpPic());
			pstmt.setInt(5, p.getCatId());
			pstmt.setInt(6, p.getUserId());
			pstmt.executeUpdate();
			f=true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return f;
	}
	
	// get All the Posts 
	public List<Post> getALLPosts()
	{
		// list is interface so we use child class ArrayList for create object 
		List<Post> list = new ArrayList<>();
		
		// Fetch All the Post 
		try {
			
			PreparedStatement p = con.prepareStatement("select * from post order by pid desc");
			
			ResultSet set=p.executeQuery();
			
			while(set.next())
			{
			   	int pid=set.getInt("pid");
			   	String pTitle=set.getString("pTitle");
			   	String pContent=set.getString("pContent");
			   	String pCode=set.getString("pCode");
			   	String pPic=set.getString("pPic");
			   	Timestamp date=set.getTimestamp("pDate");
			   	int catId=set.getInt("catId");
			   	int userId=set.getInt("userId");
			   	Post post = new Post( pid, pTitle, pContent, pCode, pPic, date, catId, userId);
			   	
			   	list.add(post);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return list;
	}
	
	public List<Post> getPostByCatId(int catId)
	{
       List<Post> list = new ArrayList<>();
		
		// Fetch All the Post by id  
   	// Fetch All the Post 
		try {
			
			PreparedStatement p = con.prepareStatement("select * from post where catId=?");
			p.setInt(1, catId);
			ResultSet set=p.executeQuery();
			
			while(set.next())
			{
			   	int pid=set.getInt("pid");
			   	String pTitle=set.getString("pTitle");
			   	String pContent=set.getString("pContent");
			   	String pCode=set.getString("pCode");
			   	String pPic=set.getString("pPic");
			   	Timestamp date=set.getTimestamp("pDate");
	        	int userId=set.getInt("userId");
			   	Post post = new Post( pid, pTitle, pContent, pCode, pPic, date, catId, userId);
			   	
			   	list.add(post);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}	
       
       
		return list;
	}
	
	public  Post getPostByPostId(int postId) {
		Post post = null;
		String q="select * from post where pid=?";
		PreparedStatement p;
		try {
			p = this.con.prepareStatement(q);
			p.setInt(1, postId);
			
			ResultSet set= p.executeQuery();
			
			if(set.next()) {
				
			  	int pid=set.getInt("pid");
			   	String pTitle=set.getString("pTitle");
			   	String pContent=set.getString("pContent");
			   	String pCode=set.getString("pCode");
			   	String pPic=set.getString("pPic");
			   	Timestamp date=set.getTimestamp("pDate");
	        	int userId=set.getInt("userId");
	        	int cid= set.getInt("catId");
	        	
			    post = new Post( pid, pTitle, pContent, pCode, pPic, date, cid, userId);
			   
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return post;

	}
}

