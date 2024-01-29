package com.blog.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import com.blog.dao.UserDao;
import com.blog.entities.User;
import com.blog.helper.DatabaseConnection;
/**
 * Servlet implementation class RegistersServlet
 */
@MultipartConfig

public class RegistersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistersServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	//	response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String check=request.getParameter("check");
		PrintWriter out= response.getWriter();
		if(check==null) {
			out.println("Select Terms and Condition");
		}else {
			
			//baki ka data yaha nikalna...
			String name=request.getParameter("user_name");
			String email=request.getParameter("user_email");
			String password =request.getParameter("user_password");
			String gender =request.getParameter("gender");
			String about =request.getParameter("about");
            //create user object and set all data to that object 
			User user = new User(name, email, password, gender, about);
			
			
			
			//Create a user Dao object..
			UserDao dao = null;
			try {
				dao = new UserDao(DatabaseConnection.getConnection());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
         
			if(dao.saveUser(user)) {
				
				out.println("done");
			}else {
				out.println("error");
			}
			
			
			
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
