package com.iba.login;

import com.iba.model.Category;
import com.iba.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.List;

@Controller
public class CategoryController {

    @Autowired
    CategoryService categoryService;

    @GetMapping("/category")
    public String category(Model model){
        List<Category> categories = categoryService.findAllCategories();
        System.out.println("Categories");
        for(Category category: categories) {
            System.out.println(category.toString());
        }
        model.addAttribute("category", new Category());
        model.addAttribute("categories", categories);
        return "category";
    }

    @PostMapping("/newCategory")
    public ModelAndView newCategory(@Valid Category category, BindingResult bindingResult) {
        ModelAndView modelAndView = new ModelAndView();
        Category categoryExists = categoryService.findCategpryByCategoryName(category.getCategoryName());
        if (categoryExists != null) {
            bindingResult
                    .rejectValue("categoryName", "error.categoryName",
                            "There is already a category registered with that name");
        }

        if (bindingResult.hasErrors()) {
            modelAndView.addObject("categories", categoryService.findAllCategories());
            modelAndView.setViewName("category");
        } else {
            categoryService.saveCategory(category);
            modelAndView.addObject("successMessage", "User has been registered successfully");
            modelAndView.addObject("category", new Category());
            modelAndView.addObject("categories", categoryService.findAllCategories());
            modelAndView.setViewName("category");
        }
        return modelAndView;
    }



}
