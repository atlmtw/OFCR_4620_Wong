package model;

import java.util.Date;

public class PersonCertificate {
	int personCertificateID;
	int certID, personID;
	Date certRecDate; 
	Date certRenDate;
	
	public PersonCertificate(){}

	/**
	 * @param personCertificateID
	 * @param certID
	 * @param personID
	 * @param certRecDate
	 * @param certRenDate
	 */
	public PersonCertificate(int personCertificateID, int certID, int personID, Date certRecDate,
			Date certRenDate) {
		this.personCertificateID = personCertificateID;
		this.certID = certID;
		this.personID = personID;
		this.certRecDate = certRecDate;
		this.certRenDate = certRenDate;
	}

	/**
	 * @return the personCertificateID
	 */
	public int getPersonCertificateID() {
		return personCertificateID;
	}

	/**
	 * @param personCertificateID the personCertificateID to set
	 */
	public void setPersonCertificateID(int personCertificateID) {
		this.personCertificateID = personCertificateID;
	}

	/**
	 * @return the certID
	 */
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
	 * @return the personID
	 */
	public int getPersonID() {
		return personID;
	}

	/**
	 * @param personID the personID to set
	 */
	public void setPersonID(int personID) {
		this.personID = personID;
	}

	/**
	 * @return the certRecDate
	 */
	public Date getCertRecDate() {
		return certRecDate;
	}

	/**
	 * @param certRecDate the certRecDate to set
	 */
	public void setCertRecDate(Date certRecDate) {
		this.certRecDate = certRecDate;
	}

	/**
	 * @return the certRenDate
	 */
	public Date getCertRenDate() {
		return certRenDate;
	}

	/**
	 * @param certRenDate the certRenDate to set
	 */
	public void setCertRenDate(Date certRenDate) {
		this.certRenDate = certRenDate;
	}
	
	
}
