package com.iba.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iba.dao.CategoryDao;
import com.iba.model.Category;
import com.iba.service.CategoryService;

@Service("categoryService")
public class CategoryServiceImpl implements CategoryService {

	CategoryDao categoryDao;
	
	@Autowired
	public void setCategoryDao(CategoryDao categoryDao){
		this.categoryDao = categoryDao;
	}

	@Override
	public List<Category> getAllCategories() {
		return categoryDao.getAllCategories();
	}

	@Override
	public void addCategory(Category category) {
		categoryDao.addCategory(category);
	}

	@Override
	public Category getCategory(String categoryName) {
		return categoryDao.getCategory(categoryName);
	}

	@Override
	public Category getCategory(int categoryId) {
		// TODO Auto-generated method stub
		return null;
	}

}
