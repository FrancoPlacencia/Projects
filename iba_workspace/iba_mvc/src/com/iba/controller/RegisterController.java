package com.iba.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.iba.validator.RegisterFormValidator;
import com.iba.model.User;
import com.iba.service.UserService;

@Controller
public class RegisterController {

	private final Logger logger = LoggerFactory.getLogger(RegisterController.class);

	@Autowired
	private UserService userService;

	@Autowired
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	@Autowired
	private RegisterFormValidator registerFormValidator;

	// Set a form validator
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		binder.setValidator(registerFormValidator);
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register(Model model) {
		logger.info("register()");
		model.addAttribute("newUser", new User());
		return "register";
	}
	
	@RequestMapping(value = "/newUser", method = RequestMethod.POST)
	public String newUser(@ModelAttribute("newUser") @Validated User user, BindingResult result, Model model, final RedirectAttributes redirectAttributes) {
		logger.info("newUser()" + user);
		if (result.hasErrors()) {
			logger.error("validated errors");
			return "register";
		} else {
			logger.info("validated ok");
			User loginUser = new User();
			loginUser.setEmail(user.getEmail());
			model.addAttribute("user", loginUser);
			model.addAttribute("registerSuccess", "User sucessfully registered");
			user.setEnable(false);
			userService.addUser(user);
			return "login";
		}
	}
	
	@RequestMapping(value="/dashboard", method = RequestMethod.GET)
	public String dashboard(Model model) {
		List<User> users = userService.getAllUsers();
		model.addAllAttributes(users);
		model.addAttribute("users", users);
		return "dashboard";
	}

}
