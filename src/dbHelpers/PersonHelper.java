package dbHelpers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.Person;

public class PersonHelper {
	private Connection connection;
	
	public PersonHelper(){
		this.connection = ConnectionHelper.doConnection();
	}
	public ResultSet readAll(){
		String query = "SELECT * FROM person";
		ResultSet rs = null;
		try {
			PreparedStatement ps = connection.prepareStatement(query);
			rs = ps.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rs;
	}
	
	//read from a result that collects a person object with a specific person_id as a parameter
	public Person doReadOne(int personID) {
		String query = "SELECT * FROM person WHERE person_id = ?";

		Person person = null;

		try {
			PreparedStatement ps = connection.prepareStatement(query);

			ps.setInt(1, personID);
			ResultSet results = ps.executeQuery();

			results.next();

			// What if person isn't found? Is an exception thrown?
			// Is it okay to return null from this refactored method?

			person = new Person(
					results.getInt("person_id"),
					results.getString("person_fn"),
					results.getString("person_ln"),
					results.getString("person_position"),
					results.getString("person_suffix"),
					results.getString("person_gender"),
					results.getString("person_st_addr"),
					results.getString("person_city"),
					results.getString("person_county"),
					results.getString("person_state"),
					results.getInt("person_zip"),
					results.getString("person_w_phone"),
					results.getString("person_m_phone"),
					results.getString("email_address"),
					results.getInt("radio_num"),
					results.getInt("station_num"),
					results.getString("person_active")
					);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return person;
	}
	
	/*Below is a method that creates the ResultSet used for the station reports page
	 * */
	public ResultSet readTable(int stationNum){
		String query = "";
		if(stationNum == 0){
			query = "SELECT * FROM person"; }
		else{
			query = "SELECT * FROM person WHERE station_num = "+ stationNum;
		}
		ResultSet rs = null;
		try {
			PreparedStatement ps = connection.prepareStatement(query);
			rs = ps.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rs;
	}
	/*Below is a method that generates the table for the station reports page
	 * it requires a result set from the readTable method
	 * */
	public String generateReport(ResultSet rs){
		String table = "";
		table += "<table id='table1' class='table table-striped'>";
		table += "<thead>";
			table += "<tr>";
			table += "<td>Member ID</td>";
			table += "<td>Member First Name</td>";
			table += "<td>Member Last Name</td>";
			table += "<td>Member Radio #</td>";
			table += "<td>Member Station #</td>";
			table += "<td>Email Address</td>";
			table += "</tr>";
		table += "</thead>";
		table += "<tbody>";
		
		try {
			while(rs.next()){
					int personID = rs.getInt("person_id");
					String firstName = rs.getString("person_fn");
					String lastName = rs.getString("person_ln");
					String position = rs.getString("person_position");
					String suffix = rs.getString("person_suffix");
						if(suffix == null){suffix = "";}
					String gender = rs.getString("person_gender");
					String address = rs.getString("person_st_addr");
					String city = rs.getString("person_city");
					String county = rs.getString("person_county");
					String state = rs.getString("person_state");
					int zip = rs.getInt("person_zip");
					String wPhone = rs.getString("person_w_phone");
					String mPhone = rs.getString("person_m_phone");
					String email = rs.getString("email_address");
					int radioNum = rs.getInt("radio_num");
					int stationNum = rs.getInt("station_num");
					String active = rs.getString("person_active");
					
					Person person = new Person(
						personID, firstName, lastName, position, suffix, gender, address, city,
						county, state, zip, wPhone, mPhone, email, radioNum, stationNum, active);
		
					table += "<tr>";
					table += "<td>"+person.getPersonID()+"</td>";
					table += "<td>"+person.getfName()+"</td>";
					table += "<td>"+person.getlName()+"</td>";
					table += "<td>"+person.getRadioNum()+"</td>";
					table += "<td>"+person.getStationNum()+"</td>";
					table += "<td>"+person.getEmail()+"</td>";
					table += "</tr>";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		table += "</tbody>";
		table += "</table>";
		
		return table;
	}
	/*Print all persons from the person table onto an HTML table
	 * */
	public String getHTMLTable(ResultSet results){
		String table ="";
		table += "<table class='table table-striped'>\n";
		table += "<thead>";
			table += "<tr>";
			table += "<td>Person ID</td>";
			table += "<td>First Name</td>";
			table += "<td>Last Name</td>";
			table += "<td>Position</td>";
			table += "<td>Suffix</td>";
			table += "<td>Gender</td>";
			table += "<td>Street Address</td>";
			table += "<td>City</td>";
			table += "<td>County</td>";
			table += "<td>State</td>";
			table += "<td>Zip</td>";
			table += "<td>Work Phone</td>";
			table += "<td>Main Phone</td>";
			table += "<td>Email</td>";
			table += "<td>Radio #</td>";
			table += "<td>Station #</td>";
			table += "<td>Active?</td>";
			table += "</tr>";
		table += "</thead>";
		try {
			while(results.next()) {

				// Consider: Why are we creating Book objects with these results, rather 
				// than just printing the results of the query directly?
				// (It helps us validate our data.)

				Person person = new Person(
						results.getInt("person_id"),
						results.getString("person_fn"),
						results.getString("person_ln"),
						results.getString("person_position"),
						results.getString("person_suffix"),
						results.getString("person_gender"),
						results.getString("person_st_addr"),
						results.getString("person_city"),
						results.getString("person_county"),
						results.getString("person_state"),
						results.getInt("person_zip"),
						results.getString("person_w_phone"),
						results.getString("person_m_phone"),
						results.getString("email_address"),
						results.getInt("radio_num"),
						results.getInt("station_num"),
						results.getString("person_active")
						);

				// Consider: Could this table row code be refactored to be part of person?
				// Would that be a good idea or not?

				table +="<tr>";
				table +="\t<td>";
				table += person.getPersonID();
				table +="</td>";
				table +="<td>";
				table += person.getfName();
				table +="</td>";
				table +="<td>";
				table += person.getlName();
				table +="</td>";
				table +="<td>";
				table += person.getPosition();
				table +="</td>";
				table +="<td>";
				if(person.getSuffix()==null){
					person.setSuffix("");
				}
				table += person.getSuffix();
				table +="</td>";
				table +="<td>";
				table += person.getGender();
				table +="</td>";
				table +="<td>";
				table += person.getStreetAddress();
				table +="</td>";
				table +="<td>";
				table += person.getCity();
				table +="</td>";
				table +="<td>";
				table += person.getCounty();
				table +="</td>";
				table +="<td>";
				table += person.getState();
				table +="</td>";
				table +="<td>";
				table += person.getZipCode();
				table +="</td>";
				table +="<td>";
				table += person.getwPhone();
				table +="</td>";
				table +="<td>";
				table += person.getmPhone();
				table +="</td>";
				table +="<td>";
				table += person.getEmail();
				table +="</td>";
				table +="<td>";
				table += person.getRadioNum();
				table +="</td>";
				table +="<td>";
				table += person.getStationNum();
				table +="</td>";
				table +="<td>";
				table += person.getpActive();
				table +="</td>";
				table +="\n\t<td>";
				
				// We made changes to the Delete servlet, so that it can't be accessed via 'GET'
				// Thus, this HTML needs to change as well. 
				// We'll create a small form that POSTs instead.
				table += "<a href=update?person_id=" + person.getPersonID() + " ><button class='btn btn-default'>Update Person</button></a><br>";
				table += "<a href=profileServlet?person_id=" + person.getPersonID() + " ><button class='btn btn-default'>See Member Certificates</button></a><br>";
				table += "<form action=\"delete\" method=\"post\">";
				table += "<input type=\"hidden\" name=\"personID\" value=\"" + person.getPersonID() + "\">";
				table += "<input type=\"submit\" class=\"btn btn-default\" value=\"Delete\"></form>";
				
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

		table += "</table>";
		return table;
	}
	
	/*Below is a method that generates a CSV text file from the return output
	 * from the readTable method (generates a result set)
	 * */
	public String getCSVTable(ResultSet rs){
		String table ="";
		
		try {
			while(rs.next()) {
						int personID = rs.getInt("person_id");
						String firstName = rs.getString("person_fn");
						String lastName = rs.getString("person_ln");
						String position = rs.getString("person_position");
						String suffix = rs.getString("person_suffix");
							if(suffix == null){suffix = "";}
						String gender = rs.getString("person_gender");
						String address = rs.getString("person_st_addr");
						String city = rs.getString("person_city");
						String county = rs.getString("person_county");
						String state = rs.getString("person_state");
						int zip = rs.getInt("person_zip");
						String wPhone = rs.getString("person_w_phone");
						String mPhone = rs.getString("person_m_phone");
						String email = rs.getString("email_address");
						int radioNum = rs.getInt("radio_num");
						int stationNum = rs.getInt("station_num");
						String active = rs.getString("person_active");
						
						Person person = new Person(
							personID, firstName, lastName, position, suffix, gender, address, city,
							county, state, zip, wPhone, mPhone, email, radioNum, stationNum, active);
				
				table += person.getPersonID();
				table +="\", \"";
				table += person.getfName().replaceAll("\"", "\"\"");
				table +="\", \"";
				table += person.getlName().replaceAll("\"", "\"\"");
				table +="\",";
				table += person.getRadioNum();
				table +="\",";
				table += person.getStationNum();
				table +="\", \"";
				table += person.getEmail().replaceAll("\"", "\"\"");
				table +="\n";  // Important!

				// Just as \" is resolved as a " character, \n resolves
				// as a new line. Each record in a CSV file is a new line.
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return table;
	}
	
	public void doAdd(Person person){
		String query = "INSERT INTO person (person_id, person_fn, person_ln, person_position, person_suffix, person_gender, person_st_addr, person_city, person_county, person_state, person_zip, person_w_phone, person_m_phone, email_address, radio_num, station_num, person_active) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			PreparedStatement ps = connection.prepareStatement(query);
			ps.setInt(1, person.getPersonID());
			ps.setString(2, person.getfName());
			ps.setString(3, person.getlName());
			ps.setString(4, person.getPosition());
			ps.setString(5, person.getSuffix());
			ps.setString(6, person.getGender());
			ps.setString(7, person.getStreetAddress());
			ps.setString(8, person.getCity());
			ps.setString(9, person.getCounty());
			ps.setString(10, person.getState());
			ps.setInt(11, person.getZipCode());
			ps.setString(12, person.getwPhone());
			ps.setString(13, person.getmPhone());
			ps.setString(14, person.getEmail());
			ps.setInt(15, person.getRadioNum());
			ps.setInt(16, person.getStationNum());
			ps.setString(17, person.getpActive());
			

			ps.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block; add real error handling!
			e.printStackTrace();
		}
	}

	public void doDelete(int personID) {
		String query = "DELETE FROM person WHERE person_id = ?";

		try {
			PreparedStatement ps = connection.prepareStatement(query);

			ps.setInt(1, personID);

			ps.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block; add real error handling!
			e.printStackTrace();
		}
	}

	public void doUpdate(Person person){
		String query = "UPDATE person SET person_fn=?, person_ln=?, person_position=?, person_suffix=?, person_gender=?, person_st_addr=?, person_city=?, person_county=?, person_state=?, person_zip=?, person_w_phone=?, person_m_phone=?, email_address=?, radio_num=?, station_num=?, person_active=? WHERE person_id=?";

		try {
			PreparedStatement ps = connection.prepareStatement(query);

			ps.setString(1, person.getfName());
			ps.setString(2, person.getlName());
			ps.setString(3, person.getPosition());
			ps.setString(4, person.getSuffix());
			ps.setString(5, person.getGender());
			ps.setString(6, person.getStreetAddress());
			ps.setString(7, person.getCity());
			ps.setString(8, person.getCounty());
			ps.setString(9, person.getState());
			ps.setInt(10, person.getZipCode());
			ps.setString(11, person.getwPhone());
			ps.setString(12, person.getmPhone());
			ps.setString(13, person.getEmail());
			ps.setInt(14, person.getRadioNum());
			ps.setInt(15, person.getStationNum());
			ps.setString(16, person.getpActive());
			ps.setInt(17, person.getPersonID());

			ps.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block; add real error handling!
			e.printStackTrace();
		}
	}
	
}
