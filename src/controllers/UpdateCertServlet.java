package controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbHelpers.CertificationHelper;
import model.Certification;

/**
 * Servlet implementation class UpdateCertServlet
 */
@WebServlet("/updateCertificate")
public class UpdateCertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cert_id = Integer.parseInt(request.getParameter("cert_id"));
		String cert_name = request.getParameter("cert_name");
		String cert_sponsor = request.getParameter("cert_sponsor");
		int cert_expiry_type = Integer.parseInt(request.getParameter("cert_expiry_type"));
		int person_id = Integer.parseInt(request.getParameter("person_id"));
		
		Certification cert = new Certification(cert_id,cert_name,cert_sponsor,cert_expiry_type);
		
		CertificationHelper ch = new CertificationHelper();
		ch.doUpdate(cert);
		
		String url = "profileServlet?person_id="+person_id;
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
		
	}

}
