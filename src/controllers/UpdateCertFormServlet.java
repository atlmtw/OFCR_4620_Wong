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
@WebServlet("/updateFormCertificate")
public class UpdateCertFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCertFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cert_id = Integer.parseInt(request.getParameter("cert_id"));
		int person_id = Integer.parseInt(request.getParameter("person_id"));
		
		Certification cert = null;
		CertificationHelper ch = new CertificationHelper();
		cert = ch.doReadOne(cert_id);
		
		request.setAttribute("cert", cert);
		request.setAttribute("person_id", person_id);
		
		String url="updateCertForm.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
		
		
	}

}
