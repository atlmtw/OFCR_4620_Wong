package controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbHelpers.UserHelper;
import model.User;

/**
 * Servlet implementation class UserAddServlet
 */
@WebServlet("/addUser")
public class UserAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	public UserAddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// NEVER make database changes via a GET request.
		// You don't want a web crawler accidentally modifying your data!
		throw new RuntimeException();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// get the data
		// TODO: Add error checking!
		int user_id = Integer.parseInt(request.getParameter("user_id"));
	    String username = request.getParameter("username");
	    String password = request.getParameter("password");
	  
	    
	    
	
		// set up a book object
	    User user = new User();
	    user.setUserID(user_id);
	    user.setUsername(username);
	    user.setPassword(password);
	
	    
		// set up an dbHelper object
	    UserHelper bdb = new UserHelper();
	    
		// pass the book to addQuery to add to the database
	    bdb.doAdd(user);
	    
		// pass execution control to the ReadServlet
	    String url = "/UserRead";
	    
	    RequestDispatcher dispatcher = request.getRequestDispatcher(url);
	    dispatcher.forward(request, response);
	}


}
