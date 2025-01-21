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

import com.iba.dao.RegistryDao;
import com.iba.model.Category;
import com.iba.model.Registry;
import com.iba.model.User;

@Repository
public class RegistryDaoImpl implements RegistryDao {

	private final Logger logger = LoggerFactory.getLogger(CategoryDaoImpl.class);

	NamedParameterJdbcTemplate namedParameterJdbcTemplate;

	@Autowired
	public void setNamedParameterJdbcTemplate(
			NamedParameterJdbcTemplate namedParameterJdbcTemplate) {
		this.namedParameterJdbcTemplate = namedParameterJdbcTemplate;
	}
	
	@Override
	public List<Registry> getAllRegistries() {
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT * ");
		sql.append("  FROM t_registry registry ");
		sql.append(" INNER JOIN t_category category ");
		sql.append("	ON category.category_id = registry.category_id ");
		sql.append(" INNER JOIN t_user user ");
		sql.append("    ON user.user_id = registry.created_by ");
		List<Registry> result = namedParameterJdbcTemplate.query(sql.toString(), new Mapper());
		return result;
	}

	@Override
	public void addRegistry(Registry registry) {
		KeyHolder keyHolder = new GeneratedKeyHolder();
		String sql = "INSERT INTO t_registry (amount, created_on, created_time, category_id, created_by) VALUES (:amount, :createdOn, :createdTime, :categoryId, :createdBy) ";
		try {
			namedParameterJdbcTemplate.update(sql, getSqlParameterByModel(registry), keyHolder);
			registry.setRegistryId(keyHolder.getKey().intValue());
		} catch (DuplicateKeyException e) {
			registry = null;
			logger.error("Registry already exists");
		} catch (Exception e) {
			logger.error("Unexpected error", e);
		}
	}
	
	private SqlParameterSource getSqlParameterByModel(Registry registry) {
		MapSqlParameterSource paramSource = new MapSqlParameterSource();
		paramSource.addValue("registryId", registry.getRegistryId());
		paramSource.addValue("amount", registry.getAmount());
		paramSource.addValue("createdOn", registry.getCreatedOn());
		paramSource.addValue("createdTime", registry.getCreatedTime());
		paramSource.addValue("categoryId", registry.getCategory().getCategoryId());
		paramSource.addValue("createdBy", registry.getCreatedBy().getUserId());
		return paramSource;
	}
	
	private static final class Mapper implements RowMapper<Registry> {

		public Registry mapRow(ResultSet rs, int rowNum) throws SQLException {
			Registry registry = new Registry();
			registry.setRegistryId(rs.getInt("registry_id"));
			registry.setAmount(rs.getBigDecimal("amount"));
			registry.setCreatedOn(rs.getDate("created_on"));
			registry.setCreatedTime(rs.getString("created_time"));
			
			Category category = new Category();
			category.setCategoryId(rs.getInt("category_id"));
			category.setCategoryName(rs.getString("category_name"));
			category.setCategoryDescription(rs.getString("category_description"));
			registry.setCategory(category);
			
			User user = new User();
			user.setUserId(rs.getInt("user_id"));
			user.setFirstName(rs.getString("first_name"));
			user.setLastName(rs.getString("last_name"));
			registry.setCreatedBy(user);
			return registry;
		}
	}

}
