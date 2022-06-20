package com.iba.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.iba.dao.CategoryDao;
import com.iba.model.Category;

@Repository
public class CategoryDaoImpl implements CategoryDao {

	private final Logger logger = LoggerFactory.getLogger(CategoryDaoImpl.class);

	NamedParameterJdbcTemplate namedParameterJdbcTemplate;

	@Autowired
	public void setNamedParameterJdbcTemplate(
			NamedParameterJdbcTemplate namedParameterJdbcTemplate) {
		this.namedParameterJdbcTemplate = namedParameterJdbcTemplate;
	}

	@Override
	public List<Category> getAllCategories() {
		String sql = "SELECT * FROM t_category";
		List<Category> categories = namedParameterJdbcTemplate.query(sql, new Mapper());
		return categories;
	}
	
	@Override
	public Category getCategory(String categoryName) {
		String sql = "SELECT * FROM t_category where category_name = :categoryName";
		SqlParameterSource namedParameters = new MapSqlParameterSource().addValue("categoryName", categoryName);
		Category category = namedParameterJdbcTemplate.queryForObject(sql.toString(), namedParameters, new Mapper());
		return category;
	}

	@Override
	public Category getCategory(int categoryId) {
		String sql = "SELECT * FROM t_category where category_id = :categoryId";
		SqlParameterSource namedParameters = new MapSqlParameterSource().addValue("categoryId", categoryId);
		Category category = namedParameterJdbcTemplate.queryForObject(sql.toString(), namedParameters, new Mapper());
		return category;
	}

	@Override
	public void addCategory(Category category) {
		KeyHolder keyHolder = new GeneratedKeyHolder();
		String sql = "INSERT INTO t_category (category_name, category_description ) VALUES ( :categoryName, :categoryDescription)";
		try {
			namedParameterJdbcTemplate.update(sql, getSqlParameterByModel(category), keyHolder);
			category.setCategoryId(keyHolder.getKey().intValue());
		} catch (DuplicateKeyException e) {
			category = null;
			logger.error("Category already exists");
		} catch (Exception e) {
			logger.error("Unexpected error", e);
		}
	}

	private SqlParameterSource getSqlParameterByModel(Category category) {
		MapSqlParameterSource paramSource = new MapSqlParameterSource();
		paramSource.addValue("categoryId", category.getCategoryId());
		paramSource.addValue("categoryName", category.getCategoryName());
		paramSource.addValue("categoryDescription", category.getCategoryDescription());
		return paramSource;
	}
	
	private static final class Mapper implements RowMapper<Category> {

		public Category mapRow(ResultSet rs, int rowNum) throws SQLException {
			Category category = new Category();
			category.setCategoryId(rs.getInt("category_id"));
			category.setCategoryName(rs.getString("category_name"));
			category.setCategoryDescription(rs.getString("category_description"));
			return category;
		}
	}

	

}
