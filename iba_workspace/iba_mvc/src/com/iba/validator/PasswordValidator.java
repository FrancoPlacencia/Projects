package com.iba.validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.stereotype.Component;

@Component("passwordValidator")
public class PasswordValidator {

	private Pattern pattern;
	private Matcher matcher;

	/**
	 * <code>(?=.*[0-9])</code> a digit must occur at least once <br/>
	 * <code>(?=.*[a-z])</code> a lower case letter must occur at least once <br/>
	 * <code>(?=.*[A-Z])</code> an upper case letter must occur at least once <br/>
	 * <code>(?=.*[@#$%^&+=])</code> a special character must occur at least <br/>
	 * once <code>(?=\\S+$)</code> no whitespace allowed in the entire string <br/>
	 * <code>.{8,}</code> at least 8 characters
	 */
	private static final String PASS_PATTERN = "(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}";

	public PasswordValidator() {
		pattern = Pattern.compile(PASS_PATTERN);
	}

	public boolean valid(final String pass) {
		matcher = pattern.matcher(pass);
		return matcher.matches();
	}

}
