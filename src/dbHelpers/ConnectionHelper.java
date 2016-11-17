/**
 * 
 */
package dbHelpers;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * @author atlmtw
 * Sole purpose of this class is to reduce the code used to connect to servers.
 * Username and Password are left as parameters to allow any user to make a connection
 * as long as they have access to the database
 * 
 * 
 * ADD THESE FOR CSV
 * response.setHeader("Content-Description","File Transfer");
 * response.setHeader("Content-Disposition","attachment; filename=books.csv");
 * response.setContentType("text/csv");
 */
public class ConnectionHelper {
	
	private static final String dbName = "ocfr_katemasondavid";
	private static final String uname = "root";
	private static final String pwd  = "1080848kc!";
	
	private static Connection connection = null;
	public ConnectionHelper(){}

	static public Connection doConnection(){
		if (connection != null) {
			return connection;
		}
		
		String url = "jdbc:mysql://localhost:3306/" + dbName;
		
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			connection = DriverManager.getConnection(url, uname, pwd); 
		} catch (InstantiationException | IllegalAccessException
				| ClassNotFoundException | SQLException e) {
			// NOTE: Errors that occur here will show in the Console, but will not
			// stop the web app from running. These errors could be handled better.
			e.printStackTrace();
		}
		
		if (connection == null) {
			throw new RuntimeException("Error connecting to database.");
		}
		
		return connection;
	}

}