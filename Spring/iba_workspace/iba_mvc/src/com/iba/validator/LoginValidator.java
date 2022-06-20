package com.iba.validator;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.iba.controller.LoginController;
import com.iba.model.User;
import com.iba.service.UserService;

@Component
public class LoginValidator implements Validator {
	private final Logger logger = LoggerFactory.getLogger(LoginValidator.class);
	
	@Autowired
	UserService userService;
	
	@Override
	public boolean supports(Class<?> clazz) {
		return User.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		User user = (User) target;
		// Validate empty fields
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "NotEmpty.user.email");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "NotEmpty.user.password");
		// Only validate data, if all the fields are filled
		if(errors.getErrorCount() == 0) {
//			Encryptor.encryptPassword(user);
			if(!userService.validateUser(user)) {
				errors.rejectValue("password", "Invalid.user.login");
			}
		}
	}

}
