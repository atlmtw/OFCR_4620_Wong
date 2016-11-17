package model;

public class Certification {

	
	
	private int certID;
	private String certName;
	private String certSponsor;
	private int certExpiry;
	/**
	 * @return the certID
	 */
	public Certification()
	{
		
	}
	public Certification(int certID,String certName, String certSponsor, int certExpiry)
	{
		this.certID = certID;
		this.certName = certName;
		this.certSponsor = certSponsor;
		this.certExpiry = certExpiry;
		
	}
	
	public int getCertID() {
		return certID;
	}
	/**
	 * @param certID the certID to set
	 */
	public void setCertID(int certID) {
		this.certID = certID;
	}
	/**
	 * @return the certName
	 */
	public String getCertName() {
		return certName;
	}
	/**
	 * @param certName the certName to set
	 */
	public void setCertName(String certName) {
		this.certName = certName;
	}
	/**
	 * @return the certSponsor
	 */
	public String getCertSponsor() {
		return certSponsor;
	}
	/**
	 * @param certSponsor the certSponsor to set
	 */
	public void setCertSponsor(String certSponsor) {
		this.certSponsor = certSponsor;
	}
	/**
	 * @return the certExpiry
	 */
	public int getCertExpiry() {
		return certExpiry;
	}
	/**
	 * @param certExpiry the certExpiry to set
	 */
	public void setCertExpiry(int certExpiry) {
		this.certExpiry = certExpiry;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Certification [certID=" + certID + ", certName=" + certName + ", certSponsor=" + certSponsor
				+ ", certExpiry=" + certExpiry + "]";
	}
	
	
	
	
}
