package com.blog.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import com.blog.dao.PostDao;
import com.blog.entities.Post;
import com.blog.entities.User;
import com.blog.helper.DatabaseConnection;
import com.blog.helper.Helper;

/**
 * Servlet implementation class AddPostServlet
 */
@MultipartConfig
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddPostServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	//	response.getWriter().append("Served at: ").append(request.getContextPath());
	  
		int cid= Integer.parseInt(request.getParameter("cid"));
	  String pTitle = request.getParameter("pTitle");
	  String pContent= request.getParameter("pContent");
	  String pCode= request.getParameter("pCode");
	  Part part=request.getPart("pic");
	  //getting currentuser id
	  HttpSession session= request.getSession();
	  User user= (User) session.getAttribute("currentUser");
	  user.getId();
	  PrintWriter out=response.getWriter();
	  out.println("your post titile is"+ pTitle);
	  out.println(part.getSubmittedFileName());
	  
	  Post p = new Post(pTitle, pContent, pCode, part.getSubmittedFileName(), null, cid, user.getId() );
	  
	try {
		PostDao dao = new PostDao(DatabaseConnection.getConnection());
		if(dao.SavePost(p)) {
			 
				String path = request.getServletContext().getRealPath("/")+"blog_pics"+File.separator+ part.getSubmittedFileName();
				Helper.saveFile(part.getInputStream(), path);
				out.println("done...");
		  }
		else {
			  out.println("error...");
		  }
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	  
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
