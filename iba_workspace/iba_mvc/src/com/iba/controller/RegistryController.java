package com.iba.controller;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.iba.model.Category;
import com.iba.model.Registry;
import com.iba.model.User;
import com.iba.service.CategoryService;
import com.iba.service.RegistryService;
import com.iba.service.UserService;
//import com.iba.util.ExcelReportView;

@Controller
public class RegistryController {

	private final Logger logger = LoggerFactory.getLogger(RegistryController.class);

	@Autowired
	private RegistryService registryService;

	@Autowired
	public void setRegistryService(RegistryService registryService) {
		this.registryService = registryService;
	}
	
	@Autowired
	private CategoryService categoryService;

	@Autowired
	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}
	
	@Autowired
	private UserService userService;
	
	@Autowired
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

//	@Autowired
//	private UserFormValidator userFormValidator;
//
//	// Set a form validator
//	@InitBinder
//	protected void initBinder(WebDataBinder binder) {
//		binder.setValidator(userFormValidator);
//	}
	
	

	@RequestMapping(value = "/registry", method = RequestMethod.GET)
	public String registry(Model model) {
		logger.info("registry()");
		Registry registry = new Registry();
		
		
		model.addAttribute("newRegistry", registry);
		
		
		List<Registry> registries = registryService.getAllRegistries();
		model.addAttribute("registries", registries);
		populateCategories(model);
		
		return "registry";
	}

	@RequestMapping(value = "/newRegistry", method = RequestMethod.POST)
	public String newRegistry(@ModelAttribute("newRegistry") Registry registry,  Model model) {
		logger.info("newRegistry()" + registry);
		Category category = categoryService.getCategory(registry.getCategoryInput());
		User user = new User();
		user.setEmail("test@mail.com");
		user = userService.getUserByEmail(user.getEmail());
		logger.info(user.toString());
		registry.setCreatedBy(user);
		logger.info(category.toString());
		registry.setCategory(category);
		registryService.addRegistry(registry);
		return "redirect:/registry";
	}
	
	private void populateCategories(Model model){
		List<Category> categories = categoryService.getAllCategories();
		Map<String, Category> categoryMap = new LinkedHashMap<String, Category>();
		for(Category category: categories) {
			categoryMap.put(category.getCategoryName(), category);
		}
		model.addAttribute("categoryList", categoryMap);
	}

}
