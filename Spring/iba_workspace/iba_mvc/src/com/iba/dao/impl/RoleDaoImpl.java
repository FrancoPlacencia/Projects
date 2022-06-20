package com.iba.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;




//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.iba.dao.RoleDao;
import com.iba.model.Role;
import com.iba.model.User;

@Repository
public class RoleDaoImpl implements RoleDao {

//	private final Logger LOGGER = LoggerFactory.getLogger(UserDaoImpl.class);

	NamedParameterJdbcTemplate namedParameterJdbcTemplate;

	@Autowired
	public void setNamedParameterJdbcTemplate(
			NamedParameterJdbcTemplate namedParameterJdbcTemplate) {
		this.namedParameterJdbcTemplate = namedParameterJdbcTemplate;
	}

	@Override
	public List<Role> getAllRoles() {
		String sql = "SELECT * FROM t_role";
		List<Role> result = namedParameterJdbcTemplate.query(sql, new RoleMapper());
		return result;
	}

	@Override
	public void addRole(Role role) {
		KeyHolder keyHolder = new GeneratedKeyHolder();
		String sql = "INSERT INTO t_role (ROLE_NAME, ROLE_DESCRIPTION ) VALUES ( :roleName, :roleDescription)";
		namedParameterJdbcTemplate.update(sql, getSqlParameterByModel(role), keyHolder);
		role.setRoleId(keyHolder.getKey().intValue());
	}

	private SqlParameterSource getSqlParameterByModel(Role role) {
		MapSqlParameterSource paramSource = new MapSqlParameterSource();
		paramSource.addValue("roleId", role.getRoleId());
		paramSource.addValue("roleName", role.getRoleName());
		paramSource.addValue("roleDescription", role.getRoleDescription());
		return paramSource;
	}

	private static final class RoleMapper implements RowMapper<Role> {

		public Role mapRow(ResultSet rs, int rowNum) throws SQLException {
			Role role = new Role();
			role.setRoleId(rs.getInt("role_id"));
			role.setRoleName(rs.getString("role_name"));
			role.setRoleDescription(rs.getString("role_description"));
			return role;
		}

	}

}
