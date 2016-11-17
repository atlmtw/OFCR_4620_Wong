package controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbHelpers.PersonHelper;
import model.Person;

/**
 * Servlet implementation class AddServlet
 */
@WebServlet(description = "Controller for adding a new person to the database", urlPatterns = { "/addPerson" })
public class AddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddServlet() {
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
		int person_id = Integer.parseInt(request.getParameter("personID"));
	    String fName = request.getParameter("firstName");
	    String lName = request.getParameter("lastName");
	    String position = request.getParameter("position");
	    String suffix = request.getParameter("suffix");
	    String gender = request.getParameter("gender");
	    String streetAddress = request.getParameter("address");
	    String city = request.getParameter("city");
	    String county = request.getParameter("county");
	    String state = request.getParameter("state");
	    int zipCode = Integer.parseInt(request.getParameter("zip"));
	    String wPhone = request.getParameter("workPhone");
	    String mPhone = request.getParameter("mainPhone");
	    String email = request.getParameter("email");
	    int radioNum = Integer.parseInt(request.getParameter("radioNumber"));
	    int stationNum = Integer.parseInt(request.getParameter("stationNumber"));
	    String pActive = request.getParameter("active");
	    
	    
	
		// set up a person object
	    Person person = new Person(
	    	person_id, fName, lName, position, suffix, gender, streetAddress, city, county, state, zipCode, wPhone, mPhone,	
	    	email, radioNum, stationNum, pActive);
	    
		// set up an dbHelper object
	    PersonHelper ph = new PersonHelper();
	    
		// pass the book to addQuery to add to the database
	    ph.doAdd(person);
	    
		// pass execution control to the ReadServlet
	    String url = "/read";
	    
	    RequestDispatcher dispatcher = request.getRequestDispatcher(url);
	    dispatcher.forward(request, response);
	}

}
