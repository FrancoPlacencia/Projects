package com.iba.config;

import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;

@Configuration
public class SpringDBConfig {

	private static final String ORG_HSQLDB_JDBC_DRIVER = "org.hsqldb.jdbcDriver";
	
	@Autowired
	DataSource dataSource;
	
	@Bean 
	DataSource getDataSource() {
		BasicDataSource dataSource = new BasicDataSource();
		dataSource.setDriverClassName(ORG_HSQLDB_JDBC_DRIVER);
		dataSource.setUrl("jdbc:hsqldb:hsql://localhost/ibadb");
		return dataSource;
	}
	
	@Bean
	public NamedParameterJdbcTemplate getNamedParameterJdbcTemplate() {
		return new NamedParameterJdbcTemplate(dataSource);
	}
	
}
