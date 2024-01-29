package com.blog.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import com.blog.dao.UserDao;
import com.blog.entities.Message;
import com.blog.entities.User;
import com.blog.helper.DatabaseConnection;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		// fetch username and password from request 
		
		String userEmail=request.getParameter("email");
		String userPassword=request.getParameter("password");
		
		try {
			UserDao dao= new UserDao(DatabaseConnection.getConnection());
			
			User u= dao.getUserByEmailANdPassword(userEmail, userPassword);
			
			if(u==null) {
				//login .........
				//error
			//	PrintWriter out= response.getWriter();
			//	out.println("invalid Details...try again");
				
				Message msg= new Message("Invalid Details! try with another", "error", "alert-danger");
				HttpSession s=request.getSession();
				s.setAttribute("msg",msg);
				
				response.sendRedirect("login.jsp");
				
			}else {
				//login Success....
				
			HttpSession s= request.getSession();
			s.setAttribute("currentUser",u);
			response.sendRedirect("profile.jsp");
				
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
