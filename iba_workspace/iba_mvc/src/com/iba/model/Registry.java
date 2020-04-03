package com.iba.model;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;

public class Registry {
	
	private int registryId;
	
	private BigDecimal amount;
	
	private Date createdOn;
	
	private String createdTime;
	
	private Category category;
	
	private String categoryInput;
//	
//	private List<String> categoriesInput;
	
	private User createdBy;
	
	public int getRegistryId() {
		return registryId;
	}

	public void setRegistryId(int registryId) {
		this.registryId = registryId;
	}

	public BigDecimal getAmount() {
		return amount;
	}

	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}

	public Date getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Date createdOn) {
		this.createdOn = createdOn;
	}

	public String getCreatedTime() {
		return createdTime;
	}

	public void setCreatedTime(String createdTime) {
		this.createdTime = createdTime;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public String getCategoryInput() {
		return categoryInput;
	}

	public void setCategoryInput(String categoryInput) {
		this.categoryInput = categoryInput;
	}
//
//	public List<String> getCategoriesInput() {
//		return categoriesInput;
//	}
//
//	public void setCategoriesInput(List<String> categoriesInput) {
//		this.categoriesInput = categoriesInput;
//	}

	public User getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(User createdBy) {
		this.createdBy = createdBy;
	}

	@Override
	public String toString() {
		return "Registry [registryId=" + registryId + ", amount=" + amount
				+ ", createdOn=" + createdOn + ", createdTime=" + createdTime
				+ ", category=" + category 
				+ ", categoryInput="+ categoryInput
//				+ ", categoriesInput=" + categoriesInput 
				+ ", createdBy="
				+ createdBy + "]";
	}
}
