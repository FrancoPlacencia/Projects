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

import com.iba.model.Role;
import com.iba.model.User;
import com.iba.service.RoleService;

@Controller
public class RoleController {

	private final Logger LOGGER = LoggerFactory.getLogger(RoleController.class);

	// ****************************************************
	// 		Autowired beans
	// ****************************************************
	@Autowired
	private RoleService roleService;

	@Autowired
	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
	}

//	@Autowired
//	private UserFormValidator userFormValidator;
//
//	// Set a form validator
//	@InitBinder
//	protected void initBinder(WebDataBinder binder) {
//		binder.setValidator(userFormValidator);
//	}
	
	// ****************************************************
	// 		Actions
	// ****************************************************
	@RequestMapping(value = "/role", method = RequestMethod.GET)
	public String index(Model model) {
		LOGGER.info("role()");
		// Adding role object for new roles
		model.addAttribute("newRole", new Role());

		// Get all the roles to be displayed
		List<Role> roles = roleService.getAllRoles();
		model.addAllAttributes(roles);
		model.addAttribute("roles", roles);
		return "role";
	}

	@RequestMapping(value = "/newRole", method = RequestMethod.POST)
	public String newRole(@ModelAttribute("newRole") @Validated Role role,  Model model) {
		LOGGER.info("newRole()" + role);
		roleService.addRole(role);
		return "redirect: role";
	}

}
