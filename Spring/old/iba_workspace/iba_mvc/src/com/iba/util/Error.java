package com.iba.util;

public enum Error {
	LOGIN_ERROR ("Invalid email or password");
	
	private final String error;
	
	Error(String error){
		this.error = error;
	}
	
	@Override
    public String toString() {
        return this.error;
    }
}
