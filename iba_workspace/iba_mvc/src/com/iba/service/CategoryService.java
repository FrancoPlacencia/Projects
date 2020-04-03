package com.iba.service;

import java.util.List;

import com.iba.model.Category;

public interface CategoryService {

	public List<Category> getAllCategories();
	
	public Category getCategory(String categoryName);
	
	public Category getCategory(int categoryId);
	
	public void addCategory(Category category);
}
