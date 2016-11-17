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
 * Servlet implementation class UserUpdateFormServlet
 */
@WebServlet("/userUpdateForm")
public class UserUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	 public UserUpdateFormServlet() {
	        super();
	        // TODO Auto-generated constructor stub
	    }

		/**
		 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
		 */
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			this.doPost(request, response);
		}

		/**
		 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
		 */
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// get the bookID
			int user_id = Integer.parseInt(request.getParameter("user_id"));
			
			// create dbHelper class
			UserHelper bdb = new UserHelper();
			
			// Use ReadRecord to get the book data
			User user = bdb.doStartOne(user_id);
				
			// pass Book and control to the updateForm.jsp
			request.setAttribute("user", user);
			
			String url = "/UserUpdateForm.jsp";
			
			RequestDispatcher dispatcher = request.getRequestDispatcher(url);
			dispatcher.forward(request, response);
		}

}
