package controllers;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbHelpers.PersonHelper;

/**
 * Servlet implementation class csvExporter
 */
@WebServlet("/csvExporter")
public class csvExporter extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public csvExporter() {
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
		// Create a dbHelper object
				PersonHelper ph = new PersonHelper();
				
				// Get the html table from the dbHelper object
				ResultSet rs = ph.readAll();
				
				String table;
				
					// Do CSV
				response.setContentType("text/csv");
					
					// These next two HTTP headers in the response object
					// tell the browser to treat the content as a download, 
					// rather than as something to display.
				response.setHeader("Content-Description", "File Transfer");
				response.setHeader("Content-Disposition", "attachment; filename=stationReport.csv");
					
					// A CSV output helper method, similar to the one we used for 
					// the HTML table.
				table = ph.getCSVTable(rs);
					
					// At this point, we could dispatch to a JSP, but
					// the content we wish to output is already fully generated.
					// Let's just print it instead, and be done.
				response.getOutputStream().print(table);
				return;
	}

}
