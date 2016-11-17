package dbHelpers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.Certification;

public class CertificationHelper {
private Connection connection;
	
	public CertificationHelper(){
		this.connection = ConnectionHelper.doConnection();
	}
	public Certification doReadOne(int cert_id) {
		String query = "SELECT * FROM certification WHERE cert_id = ?";

		Certification cert = null;

		try {
			PreparedStatement ps = connection.prepareStatement(query);

			ps.setInt(1, cert_id);
			ResultSet results = ps.executeQuery();

			results.next();

			// What if book isn't found? Is an exception thrown?
			// Is it okay to return null from this refactored method?

			cert = new Certification(
					results.getInt("cert_id"),
					results.getString("cert_name"),
					results.getString("cert_sponsor"),
					results.getInt("cert_expiry_type")
					);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return cert;
	}
	public void doUpdate(Certification cert){
		String query = "UPDATE certification SET cert_name=? , cert_sponsor=? , cert_expiry_type=? WHERE cert_id=?";
		
		PreparedStatement ps;
		try {
			ps = connection.prepareStatement(query);
			ps.setString(1, cert.getCertName());
			ps.setString(2, cert.getCertSponsor());
			ps.setInt(3, cert.getCertExpiry());
			ps.setInt(4, cert.getCertID());
			
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
