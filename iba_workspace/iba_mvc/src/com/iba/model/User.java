package com.iba.model;

/**
 * T_USER
 * @author francisco.placencia
 *
 */
public class User {
	// form:hidden - hidden value
	private Integer userId;

	// form:input - textbox
	private String firstName;
	
	// form:input - textbox
	private String lastName;

	// form:input - textbox
	private String email;

	// form:input - password
	private String password;

	// form:input - password
	private String confirmPassword;

//	// form:input - password
//	private Role role;
	
	// 
	private boolean enable;
	
	// Check if this is for New of Update
	public boolean isNew() {
		return (this.userId == null);
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lasttName) {
		this.lastName = lasttName;
	}

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

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
	
//	public Role getRole() {
//		return role;
//	}
//
//	public void setRole(Role role) {
//		this.role = role;
//	}
	
	public boolean isEnable() {
		return enable;
	}

	public void setEnable(boolean enable) {
		this.enable = enable;
	}

	@Override
	public String toString() {
		return "User [id=" + userId + ", firstName=" + firstName + ", lasttName="
				+ lastName + ", email=" + email + ", password=" + password
				+ ", confirmPassword=" + confirmPassword 
				+ ", enable=" + enable + "]";
	}

}
