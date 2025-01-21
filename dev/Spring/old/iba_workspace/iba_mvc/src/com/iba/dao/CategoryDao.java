package com.iba.dao;

import java.util.List;

import com.iba.model.Category;

public interface CategoryDao {

	public List<Category> getAllCategories();
	
	public Category getCategory(String categoryName);
	
	public Category getCategory(int categoryId);
	
	public void addCategory(Category category);
	
}
