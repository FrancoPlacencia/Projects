package com.iba.db;

import javax.sql.DataSource;

public interface HsqlDatabaseServer {
	
	public String getJdbcConnectionString();
	
	public DataSource getDataSource();

}
