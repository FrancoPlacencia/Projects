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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.iba.validator.LoginValidator;
import com.iba.model.User;
import com.iba.service.UserService;

@Controller
@SessionAttributes("user")
public class LoginController {

	private final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	private UserService userService;

	@Autowired
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	@Autowired
	private LoginValidator loginValidator;

	// Set a form validator
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		binder.setValidator(loginValidator);
	}
	
	
	@ModelAttribute("user")
	public User setUpUserForm() {
		return new User();
	}

	/**
	 * Root URL of the application this will display the login page
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String root(Model model) {
		logger.info("root()");
		model.addAttribute("user", new User());
//		model.addAttribute("newUser", new User());
		return "login";
	}
	
	/**
	 * Controlls the action of the login form, this method validate the input of the login form, 
	 * and redirect to error or to dashboard
	 * @param user
	 * @param result
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@ModelAttribute("user") @Validated User user, BindingResult result, Model model, RedirectAttributes redirectAttributes) {
		logger.info("login() " + user);
		logger.info("encrypt pass");
		if (result.hasErrors()) {
			logger.error("validated errors" + result.toString());
			model.addAttribute("newUser", new User());
			return "login";
		} else {
			logger.info("validated ok");
			user = userService.getUserByEmail(user.getEmail());
			model.addAttribute("user", user);
			return "redirect:/dashboard";
		}
	}

}
