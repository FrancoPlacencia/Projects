package com.iba.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.iba.model.User;
import com.iba.service.UserService;

@Component
public class RegisterFormValidator implements Validator {

	@Autowired
	EmailValidator emailValidator;
	
	@Autowired
	PasswordValidator passwordValidator;
	
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
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "firstName", "NotEmpty.user.firstName");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "lastName", "NotEmpty.user.lastName");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "NotEmpty.user.email");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "NotEmpty.user.password");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "confirmPassword", "NotEmpty.user.confirmPassword");
		// Validate Email Pattern only if email is not empty
		if(user != null && !user.getEmail().isEmpty()) {
			if(!emailValidator.valid(user.getEmail())){
				errors.rejectValue("email", "Pattern.user.email");
			}
		}
		// Validate the passwords only if password is not empty
		if(user != null && !user.getPassword().isEmpty()) {
			// validate if the passwords are the same
			if (!user.getPassword().equals(user.getConfirmPassword())) {
				errors.rejectValue("confirmPassword", "Diff.user.confirmPassword");
			} else {
				// Validate Password Pattern
//				if(!passwordValidator.valid(user.getPassword())) {
//					errors.rejectValue("password", "Pattern.user.password");
//				}
			}
		}
		
		// If the form has error, the application will not validate if the user exists
		if(!errors.hasErrors()) {
			if (userService.userExists(user)) {
				errors.rejectValue("email", "Already.Exists.user.email");
			}
		}
		
	}

}
