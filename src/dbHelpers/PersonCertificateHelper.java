package dbHelpers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import model.Certification;
import model.PersonCertificate;

public class PersonCertificateHelper {
	private Connection connection;
	
	public PersonCertificateHelper(){
		this.connection = ConnectionHelper.doConnection();
	}
	public ResultSet readAll(int certID){
		String query;
		//if they select none, then display everything
		if(certID == 0){
				query = "SELECT person_certificate_id, person_certificate.cert_id, cert_name, person.person_id, person_fn, person_ln, cert_rec_date, cert_ren_date "+ 
					"FROM person, person_certificate, certification "+
					"WHERE person.person_id = person_certificate.person_id "+
					"AND person_certificate.cert_id = certification.cert_id";}
		//if they select a certain certificate, make a where clause that specifies by cert_id
		else{
				query = "SELECT person_certificate_id, person_certificate.cert_id, cert_name, person.person_id, person_fn, person_ln, cert_rec_date, cert_ren_date "+ 
					"FROM person, person_certificate, certification "+
					"WHERE person.person_id = person_certificate.person_id "+
					"AND person_certificate.cert_id = certification.cert_id "+
					"AND person_certificate.cert_id = "+certID;}
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
	
	public String tableGenerator(ResultSet rs){
		String table = "";
		Date current = new Date();
		
		table+="<table class='table table-striped'>";
		table+="<thead>";
			table+="<tr>";
			table+="<td>Person Certificate ID</td>";
			table+="<td>Certificate ID</td>";
			table+="<td>Person ID</td>";
			table+="<td>Certificate Name</td>";
			table+="<td>First Name</td>";
			table+="<td>Last Name</td>";
			table+="<td>Date Certificate Received</td>";
			table+="<td>Date Certificate Expired</td>";
			table+="</tr>";
		table+="</thead>";
		table+="<tbody>";
		try {
			while(rs.next()){
				int pci = rs.getInt("person_certificate_id");
				int ci = rs.getInt("cert_id");
				String certName = rs.getString("cert_name");
				int pi = rs.getInt("person_id");
				String firstName = rs.getString("person_fn");
				String lastName = rs.getString("person_ln");
				Date RecDate = rs.getDate("cert_rec_date");
				Date RenDate = rs.getDate("cert_ren_date");
				
				PersonCertificate pc = new PersonCertificate(pci, ci, pi, RecDate, RenDate);
				
				if(RenDate.after(current)==true){
					continue;
				}
				else
				{
				//Print out the table here and add in the pc info by using getter methods
				table+="<tr>";
				table+="<td>"+pc.getPersonCertificateID()+"</td>";
				table+="<td>"+pc.getCertID()+"</td>";
				table+="<td>"+certName+"</td>";
				table+="<td>"+pc.getPersonID()+"</td>";
				table+="<td>"+firstName+"</td>";
				table+="<td>"+lastName+"</td>";
				table+="<td>"+pc.getCertRecDate()+"</td>";
				table+="<td>"+pc.getCertRenDate()+"</td>";
				table+="</tr>";
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		table+="</tbody>";
		table+="</table>";
		
		return table;
	}
	
	public ArrayList<Certification> getCertArray(int person_id){
		ArrayList<Certification> alc = new ArrayList<Certification>();
		ResultSet rs = null;
		String query = "SELECT certification.cert_id, cert_name, cert_sponsor, cert_expiry_type "+
			"FROM person, certification, person_certificate "+
			"WHERE person_certificate.person_id = person.person_id "+
			"AND person_certificate.cert_id = certification.cert_id "+
			"AND person.person_id = ?";
		
		try {
			PreparedStatement ps = connection.prepareStatement(query);
			ps.setInt(1, person_id);
			rs = ps.executeQuery();
			
			while(rs.next()){
				
				Certification cert = new Certification(
					rs.getInt("cert_id"),
					rs.getString("cert_name"),
					rs.getString("cert_sponsor"),
					rs.getInt("cert_expiry_type"));
				
				alc.add(cert);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return alc;
	}
	public int generatePCID(){
		ArrayList<Integer>al = new ArrayList<Integer>();
		String query = "SELECT person_certificate_id FROM person_certificate";
		int randomPCID = (int)Math.random()*1000;	
		try {
			PreparedStatement ps = connection.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				al.add(rs.getInt("person_certificate_id"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		for(int i = 0; i<al.size(); i++){
			if(al.get(i) == randomPCID){
				while(al.get(i)==randomPCID){
				randomPCID = (int)Math.random()*1000;
				}
			}
		}
		return randomPCID;
	}
	public void deletePCertificate(int person_id, int cert_id){
		String query = "DELETE FROM person_certificate WHERE person_id = ? AND cert_id = ?";
		try {
			PreparedStatement ps = connection.prepareStatement(query);
			ps.setInt(1, person_id);
			ps.setInt(2, cert_id);
			
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void addPCertificate(int pc_id, int person_id, Certification cert)
	{	//Create a date in java format
		java.util.Date currentDate = new java.util.Date();
		//Create a calendar object to use methods to create an end date. 
		Calendar c = Calendar.getInstance();
		c.setTime(currentDate);
		c.add(Calendar.YEAR, cert.getCertExpiry());
		//Then convert it back to a java date function
		java.util.Date expireDate = c.getTime();
		
		java.sql.Date sqlCurrentDate = new java.sql.Date(currentDate.getTime());
		java.sql.Date sqlExpiredDate = new java.sql.Date(expireDate.getTime());
		
		
		
		String query = "INSERT INTO person_certificate (person_certificate_id, cert_id, person_id, cert_rec_date, cert_ren_date) values(?,?,?,?,?)";
		try {
			PreparedStatement ps = connection.prepareStatement(query);
			ps.setInt(1, pc_id);
			ps.setInt(2, cert.getCertID());
			ps.setInt(3, person_id);
			ps.setDate(4, sqlCurrentDate);
			ps.setDate(5, sqlExpiredDate);
			
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
