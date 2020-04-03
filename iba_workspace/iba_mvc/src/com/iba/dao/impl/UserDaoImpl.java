package com.iba.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.iba.dao.UserDao;
import com.iba.model.User;

@Repository
public class UserDaoImpl implements UserDao {

	private static final Logger logger = LoggerFactory.getLogger(UserDaoImpl.class);

	NamedParameterJdbcTemplate namedParameterJdbcTemplate;

	@Autowired
	public void setNamedParameterJdbcTemplate(
			NamedParameterJdbcTemplate namedParameterJdbcTemplate) {
		this.namedParameterJdbcTemplate = namedParameterJdbcTemplate;
	}

	@Override
	public List<User> getAllUsers() {
		String sql = "SELECT * FROM t_user user";
		List<User> result = namedParameterJdbcTemplate.query(sql, new UserMapper());
		return result;
	}

	@Override
	public void addUser(User user) {
		KeyHolder keyHolder = new GeneratedKeyHolder();
		String sql = "INSERT INTO t_user (FIRST_NAME, LAST_NAME, EMAIL, PASSWORD, ENABLE) VALUES ( :firstName, :lastName, :email, :password, :enable)";
		namedParameterJdbcTemplate.update(sql, getSqlParameterByModel(user), keyHolder);
		user.setUserId(keyHolder.getKey().intValue());
	}
	
	
	@Override
	public User getUser(User user) {
		User userDb;
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT * ");
		sql.append("  FROM t_user user ");
		sql.append(" WHERE email = :email");
		sql.append("   AND password = :password");
		logger.info("script " + sql.toString());
		try {
			logger.info("email "+ user.getEmail());
			logger.info("passw "+ user.getPassword());
			SqlParameterSource namedParameters = new MapSqlParameterSource()
			.addValue("email", user.getEmail())
			.addValue("password", user.getPassword());
			userDb = namedParameterJdbcTemplate.queryForObject(sql.toString(), namedParameters, new UserMapper());
		} catch (EmptyResultDataAccessException e) {
			logger.error("No Records found");
			userDb = null;
		} catch (Exception e) {
			logger.error("Error retriving the user", e);
			userDb = null;
		}
		return userDb;
	}

	@Override
	public User getUserByEmail(String email) {
		User user;
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT * ");
		sql.append("  FROM t_user user ");
		sql.append(" WHERE email = :email");
		logger.info("script " + sql.toString());
		try {
			logger.info("email ["+ email + "]");
			SqlParameterSource namedParameters = new MapSqlParameterSource().addValue("email", email);
			user = namedParameterJdbcTemplate.queryForObject(sql.toString(), namedParameters, new UserMapper());
		} catch (Exception e) {
			logger.error("Error retriving the user by email", e);
			user = null;
		}
		return user;
	}
	
	private SqlParameterSource getSqlParameterByModel(User user) {
		MapSqlParameterSource paramSource = new MapSqlParameterSource();
		paramSource.addValue("userId", user.getUserId());
		paramSource.addValue("firstName", user.getFirstName());
		paramSource.addValue("lastName", user.getLastName());
		paramSource.addValue("email", user.getEmail());
		paramSource.addValue("password", user.getPassword());
		paramSource.addValue("enable", user.isEnable());
//		paramSource.addValue("role", user.getRole());
		return paramSource;
	}

	private static final class UserMapper implements RowMapper<User> {

		public User mapRow(ResultSet rs, int rowNum) throws SQLException {
			User user = new User();
			
			user.setUserId(rs.getInt("user_id"));
			user.setFirstName(rs.getString("first_name"));
			user.setLastName(rs.getString("last_name"));
			user.setEmail(rs.getString("email"));
			user.setPassword(rs.getString("password"));
			user.setEnable(rs.getBoolean("enable"));
			
//			Role role = new Role();
//			try {
//			role.setRoleId(rs.getInt("role_id"));
//			role.setRoleName(rs.getString("role_name"));
//			role.setRoleDescription(rs.getString("role_description"));
//			} catch (Exception e) {
//				logger.error("error trying to set role ", e);
//			}
//			user.setRole(role);
			return user;
		}

	}

	@Override
	public User getLoginUser(User user) {
		User userDB = null;
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT * ");
		sql.append("  FROM t_user user ");
		sql.append(" WHERE email = :email");
//		sql.append("   AND password = :password");
		logger.info("script " + sql.toString());
		try {
			logger.info("email "+ user.getEmail());
			logger.info("passw "+ user.getPassword());
			SqlParameterSource namedParameters = new MapSqlParameterSource()
			.addValue("email", user.getEmail())
			.addValue("password", user.getPassword());
			userDB = namedParameterJdbcTemplate.queryForObject(sql.toString(), namedParameters, new UserMapper());
		} catch (EmptyResultDataAccessException e) {
			logger.error("No Records found");
		} catch (Exception e) {
			logger.error("Error retriving the user", e);
		}
		return userDB;
	}

	
}
