/**
 * 
 */
package model;

/**
 * @author atlmtw
 *
 */
public class User {
	private String username, password;
	private int user_id;
	
	public User(int user_id, String username, String password){
		this.user_id = user_id;
		this.username = username;
		this.password = password;
	}
	public User(){}
	
	public int getUserID(){
		return user_id;
	}
	
	public void setUserID(int user_id){
		this.user_id = user_id;
	}
	/**
	 * @return the email
	 */
	public String getUsername() {
		return username;
	}

	/**
	 * @param email the email to set
	 */
	public void setUsername(String username) {
		this.username = username;
	}

	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}
	
	
}
