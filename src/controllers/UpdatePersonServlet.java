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
 * Servlet implementation class UpdateBookServlet
 */
@WebServlet(description = "Controller which starts the actual book update to the database", urlPatterns = { "/edit" })
public class UpdatePersonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdatePersonServlet() {
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
		// get the form data and set up person object
		int personID = Integer.parseInt(request.getParameter("personID"));
		String fName = request.getParameter("fName");
		String lName = request.getParameter("lName");
		String position = request.getParameter("position");
		String suffix = request.getParameter("suffix");
		String gender = request.getParameter("gender");
		String streetAddress = request.getParameter("streetAddress");
		String city = request.getParameter("city");
		String county = request.getParameter("county");
		String state = request.getParameter("state");
		int zipCode = Integer.parseInt(request.getParameter("zipCode"));
		String wPhone = request.getParameter("wPhone");
		String mPhone = request.getParameter("mPhone");
		String email = request.getParameter("email");
		int radioNum = Integer.parseInt(request.getParameter("radioNum"));
		int stationNum = Integer.parseInt(request.getParameter("stationNum"));
		String pActive = request.getParameter("pActive");
		
		

		Person person = new Person(
			personID,fName,lName,position,suffix,gender,streetAddress,city,county,state,zipCode,wPhone,mPhone,email,
			radioNum,stationNum,pActive
		);

		// create an dbHelper object and use it to update the book
		PersonHelper ph = new PersonHelper();
		ph.doUpdate(person);

		// pass control on to the ReadServlet
		String url = "/read";

		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);

	}

}
