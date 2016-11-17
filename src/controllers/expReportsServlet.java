package controllers;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dbHelpers.PersonCertificateHelper;

/**
 * Servlet implementation class expReportsServlet
 */
@WebServlet("/expiredServlet")
public class expReportsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public expReportsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String message = "";
		int certID = Integer.parseInt(request.getParameter("certificateslist"));
		//Create a PCH object and gather a result set that can be sent to the reports jsp
		//Read it based on certification id that is retrieved from the select menu
		PersonCertificateHelper pch = new PersonCertificateHelper();
		ResultSet rs = pch.readAll(certID);
		//In case a certificate is selected but is not on the expired list
		try {
			if (!rs.next()) {
			    message = "Sorry there are no results! \nTry Another One.";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//Set the result set as an attribute and send it to expReports
		request.setAttribute("rs", rs);
		request.setAttribute("message", message);
		RequestDispatcher dispatcher = request.getRequestDispatcher("expReports.jsp");
		
		dispatcher.forward(request, response);
	}

}
