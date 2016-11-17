package model;

public class Person {

	int personID;
	String fName;
	String lName;
	String position;
	String suffix;
	String gender;
	String streetAddress;
	String city;
	String county;
	String state;
	int zipCode;
	String wPhone;
	String mPhone;
	String email;
	int radioNum;
	int stationNum;
	String pActive;
		
	
	public Person(int personID, String fName, String lName, String position, String suffix, String gender, String streetAddress, String city, String county, String state, int zipCode, String wPhone, String mPhone, String email, int radioNum, int stationNum, String pActive) {
		this.personID = personID;
		this.fName = fName;
		this.lName = lName;
		this.position = position;
		this.suffix = suffix;
		this.gender = gender;
		this.streetAddress = streetAddress; 
		this.city = city;
		this.county = county;
		this.state = state;
		this.zipCode = zipCode;
		this.wPhone = wPhone;
		this.mPhone = mPhone;
		this.email = email;
		this.radioNum = radioNum;
		this.stationNum = stationNum;
		this.pActive = pActive;
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
	 * @return the fName
	 */
	public String getfName() {
		return fName;
	}


	/**
	 * @param fName the fName to set
	 */
	public void setfName(String fName) {
		this.fName = fName;
	}


	/**
	 * @return the lName
	 */
	public String getlName() {
		return lName;
	}


	/**
	 * @param lName the lName to set
	 */
	public void setlName(String lName) {
		this.lName = lName;
	}


	/**
	 * @return the position
	 */
	public String getPosition() {
		return position;
	}


	/**
	 * @param position the position to set
	 */
	public void setPosition(String position) {
		this.position = position;
	}


	/**
	 * @return the suffix
	 */
	public String getSuffix() {
		return suffix;
	}


	/**
	 * @param suffix the suffix to set
	 */
	public void setSuffix(String suffix) {
		this.suffix = suffix;
	}

	public String getGender(){
		return gender;
	}
	public void setGender(String gender){
		this.gender = gender;
	}
	/**
	 * @return the streetAddress
	 */
	public String getStreetAddress() {
		return streetAddress;
	}


	/**
	 * @param streetAddress the streetAddress to set
	 */
	public void setStreetAddress(String streetAddress) {
		this.streetAddress = streetAddress;
	}


	/**
	 * @return the city
	 */
	public String getCity() {
		return city;
	}


	/**
	 * @param city the city to set
	 */
	public void setCity(String city) {
		this.city = city;
	}


	/**
	 * @return the county
	 */
	public String getCounty() {
		return county;
	}


	/**
	 * @param county the county to set
	 */
	public void setCounty(String county) {
		this.county = county;
	}


	/**
	 * @return the state
	 */
	public String getState() {
		return state;
	}


	/**
	 * @param state the state to set
	 */
	public void setState(String state) {
		this.state = state;
	}


	/**
	 * @return the zipCode
	 */
	public int getZipCode() {
		return zipCode;
	}


	/**
	 * @param zipCode the zipCode to set
	 */
	public void setZipCode(int zipCode) {
		this.zipCode = zipCode;
	}


	/**
	 * @return the wPhone
	 */
	public String getwPhone() {
		return wPhone;
	}


	/**
	 * @param wPhone the wPhone to set
	 */
	public void setwPhone(String wPhone) {
		this.wPhone = wPhone;
	}


	/**
	 * @return the mPhone
	 */
	public String getmPhone() {
		return mPhone;
	}


	/**
	 * @param mPhone the mPhone to set
	 */
	public void setmPhone(String mPhone) {
		this.mPhone = mPhone;
	}


	/**
	 * @return the radioNum
	 */
	public int getRadioNum() {
		return radioNum;
	}


	/**
	 * @param radioNum the radioNum to set
	 */
	public void setRadioNum(int radioNum) {
		this.radioNum = radioNum;
	}


	/**
	 * @return the stationNum
	 */
	public int getStationNum() {
		return stationNum;
	}


	/**
	 * @param stationNum the stationNum to set
	 */
	public void setStationNum(int stationNum) {
		this.stationNum = stationNum;
	}


	/**
	 * @return the pActive
	 */
	public String getpActive() {
		return pActive;
	}


	/**
	 * @param pActive the pActive to set
	 */
	public void setpActive(String pActive) {
		this.pActive = pActive;
	}
	
	public String getEmail(){
		return email;
	}
	
	public void setEmail(String email){
		this.email = email;
	}
}