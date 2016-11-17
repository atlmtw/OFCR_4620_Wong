/**
 * 
 */
package dbHelpers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dbHelpers.ConnectionHelper;
import model.User;

/**
 * @author atlmtw
 *
 */
public class UserHelper {
	private Connection connection;
	
	public UserHelper(){
		this.connection = ConnectionHelper.doConnection();
	}
	public ResultSet doStartAll(){
		
		String query = "SELECT *  FROM user"; 

		ResultSet results = null;
		try {
			PreparedStatement ps = this.connection.prepareStatement(query);
			results = ps.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block; add real error handling!
			e.printStackTrace();
		}

		return results;
	}
	
	public User doStartOne(int user_id) {
		String query = "SELECT * FROM user WHERE user_id = ?";

		User user = null;

		try {
			PreparedStatement ps = connection.prepareStatement(query);

			ps.setInt(1,user_id);
			ResultSet results = ps.executeQuery();

			results.next();

			// What if product isn't found? Is an exception thrown?
			// Is it okay to return null from this refactored method?

			user = new User(
					results.getInt("user_id"),
					results.getString("username"),
					results.getString("password")
					
					);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return user;
	}
	
	public boolean symbolChecker(String username){
		boolean check = true;
		String symbols [] = {"!","%","]","/",".","?","!","("};
		for(int i=0; i<symbols.length; i++){
			if(username.contains(symbols[i])){
				check = false;
			}
		}
		return check;
	}
	public boolean idChecker(int user_id){
		ResultSet rs;
		
		boolean check = false;
		String query = "SELECT user_id FROM user";
		PreparedStatement ps;
		try {
			ps = connection.prepareStatement(query);
			rs = ps.executeQuery();
			
			try {
				while(rs.next()){
					int dummy_id = rs.getInt("user_id");
					if(dummy_id == user_id){
						check = true;
					}
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return check;
	}
	/*
	 * This is a method that connects to the database and checks to see
	 * if the inputed username and password match any user in the
	 * users database. If true return true, if false return false*/
	public User authenticateUser(String username, String password)
	{
		User user = null;
		int user_id = 0;
		//Create a query that will find all results that match the username and password
		String query = "SELECT * FROM user WHERE username = ? AND password = SHA2(?, 256) LIMIT 1";
		
		try {
			//Set the username and password to the parameters
			PreparedStatement ps = connection.prepareStatement(query);
			ps.setString(1, username);
			ps.setString(2, password);
			
			ResultSet rs = ps.executeQuery();
			
			//if there are no results, than return false
			if(rs.next()==false){
				user = null;
			} 
			else{ //if there are results, return true
				while(rs.next()){
					user_id = rs.getInt("user_id");
					break;
				}
				user = new User(user_id, username, password);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return user;
	}
	
	public void doAdd(User user){
		String query = "INSERT INTO user (user_id, username, password) values (?,?,SHA2(?, 256))";

		try {
			PreparedStatement ps = connection.prepareStatement(query);
			ps.setInt(1, user.getUserID());
			ps.setString(2, user.getUsername());
			ps.setString(3, user.getPassword());

			ps.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block; add real error handling!
			e.printStackTrace();
		}
	}
	
	public void doDelete(int user_id) {
		String query = "DELETE FROM user WHERE user_id = ?";

		try {
			PreparedStatement ps = connection.prepareStatement(query);

			ps.setInt(1, user_id);

			ps.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block; add real error handling!
			e.printStackTrace();
		}
	}
	
	public void doUpdate(User user){
		String query = "UPDATE user SET username=?, password=SHA2(?,256) WHERE user_id=?";

		try {
			PreparedStatement ps = connection.prepareStatement(query);

			ps.setString(1, user.getUsername());
			ps.setString(2, user.getPassword());
			ps.setInt(3, user.getUserID());

			ps.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block; add real error handling!
			e.printStackTrace();
		}
	}
	public String getHTMLTable(ResultSet results){
		String table ="";
		table += "<table class='table table-striped'>";
		table +="<thead>";
		table +="<tr>";
		table +="<td>User ID</td>";
		table +="<td>Username</td>";
		table +="<td>Password</td>";
		table +="</tr>";
		table +="</thead>";
		table +="<tbody>";

		try {
			while(results.next()) {

				// Consider: Why are we creating Product objects with these results, rather 
				// than just printing the results of the query directly?
				// (It helps us validate our data.)

				User user = new User(
						results.getInt("user_id"),
						results.getString("username"),
						results.getString("password")
						
						);

				// Consider: Could this table row code be refactored to be part of Product?
				// Would that be a good idea or not?
				table +="<tr>";
				table +="\t<td>";
				table += user.getUserID();
				table +="</td>";
				table +="<td>";
				table += user.getUsername();
				table +="</td>";
				table +="<td>";
				table +="***********************";
				table +="</td>";
			
				
				table +="\n\t<td>";
				
				// We made changes to the Delete servlet, so that it can't be accessed via 'GET'
				// Thus, this HTML needs to change as well. 
				// We'll create a small form that POSTs instead.
				table += "<a href=userUpdateForm?user_id=" + user.getUserID() + " ><button type='submit' class='btn btn-default'>Update User</button></a><br>";
				table += "<form action=\"userDelete\" method=\"post\">";
				table += "<input type=\"hidden\" name=\"user_id\" value=\"" + user.getUserID() + "\">";
				table += "<input type=\"submit\" value=\"Delete\" class='btn btn-default'></form>";
				
				// Consider adding behavior that might make this more user friendly:
				// a) adding an "Are you sure?" Javascript popup.
				// b) adding a success message to the reloaded page.
				
				table +="</td>\n";
				
				table +="</tr>\n";

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		table +="</tbody>";
		table += "</table>";
		return table;
	}
	

	
	
}
