package com.blog.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import com.blog.dao.UserDao;
import com.blog.entities.Message;
import com.blog.entities.User;
import com.blog.helper.DatabaseConnection;
import com.blog.helper.Helper;

/**
 * Servlet implementation class EditServlet
 */
@MultipartConfig
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		// fetch all data ....
		
		String userEmail=request.getParameter("user_email");
		String userName=request.getParameter("user_name");
		String userPassword=request.getParameter("user_password");
		String userAbout = request.getParameter("user_about");
		Part part=request.getPart("image");
		String imageName=part.getSubmittedFileName();
		
		//get the user from the session....
		
		HttpSession s=request.getSession();
		User user= (User) s.getAttribute("currentUser");
		user.setEmail(userEmail);
		user.setName(userName);
		user.setPassword(userPassword);
		user.setAbout(userAbout);
		String oldFile= user.getProfile();
		user.setProfile(imageName);
		
		//update database......
		PrintWriter out= response.getWriter();

		try {
			UserDao userDao=new UserDao(DatabaseConnection.getConnection());
			
			boolean ans= userDao.updateUser(user);
			
			String path= request.getServletContext().getRealPath("/")+"pics"+File.separator+user.getProfile();
			
			//Delete file code...
			String pathOldFile= request.getServletContext().getRealPath("/")+"pics"+File.separator+ oldFile;
	        if(!oldFile.equals("default.png")){
	        	Helper.deleteFile(pathOldFile);	
	        
	        }			
	            		if(Helper.saveFile(part.getInputStream(), path)) {
						out.println("Profile Updated...");		
						Message msg= new Message("Profile details updated...", "success", "alert-success");
						s.setAttribute("msg",msg);
						
					}
					else {
				out.println("notupdated...");
				Message msg= new Message("Something went wrongs...", "error", "alert-danger");
				s.setAttribute("msg",msg);
			}
					
		response.sendRedirect("profile.jsp");
					
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
