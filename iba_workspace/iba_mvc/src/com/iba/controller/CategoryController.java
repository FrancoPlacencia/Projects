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
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.iba.model.Category;
import com.iba.model.User;
import com.iba.service.CategoryService;
//import com.iba.util.ExcelReportView;

@Controller
public class CategoryController {

	private final Logger logger = LoggerFactory.getLogger(CategoryController.class);

	// ****************************************************
	// 		Autowired beans
	// ****************************************************
	@Autowired
	private CategoryService categoryService;

	@Autowired
	public void setRoleService(CategoryService categoryService) {
		this.categoryService = categoryService;
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
	@RequestMapping(value = "/category", method = RequestMethod.GET)
	public String category(@SessionAttribute("user") User user, Model model) {
		logger.info("category()");
		// Adding role object for new roles
		model.addAttribute("newCategory", new Category());
		model.addAttribute("user", user);

		// Get all the roles to be displayed
		List<Category> categories = categoryService.getAllCategories();
		model.addAttribute("categories", categories);
		return "category";
	}

	@RequestMapping(value = "/newCategory", method = RequestMethod.POST)
	public String newCategory(@ModelAttribute("newCategory") @Validated Category category,  Model model) {
		logger.info("newCategory()" + category);
		categoryService.addCategory(category);
		return "redirect:/category";
	}
	
//	 @RequestMapping(value = "/categoryReport", method = RequestMethod.GET)
//     public ModelAndView categoryReport(){
//		 List<Category> categories = categoryService.getAllCategories();
//        return new ModelAndView(new ExcelReportView(), "categories", categories);
//     }

}
