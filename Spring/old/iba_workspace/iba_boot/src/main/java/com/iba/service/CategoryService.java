package com.iba.service;

import com.iba.model.Category;
import com.iba.repository.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service("categoryService")
public class CategoryService {

    @Autowired
    private CategoryRepository categoryRepository;


    public Category saveCategory(Category category) {
        return categoryRepository.save(category);
    }

    public List<Category> findAllCategories() {
        return categoryRepository.findAll();
    }

    public Category findCategpryByCategoryName(String categoryName) {
        return categoryRepository.findByCategoryName(categoryName);
    }
}
