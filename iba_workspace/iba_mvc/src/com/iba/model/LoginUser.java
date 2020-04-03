package com.iba.model;

/**
 * T_USER minimal
 * @author francisco.placencia
 *
 */
public class LoginUser {

	// form:input - textbox
	private String email;

	// form:input - password
	private String password;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "LoginUser [email=" + email + ", password=" + password + "]";
	}

}
