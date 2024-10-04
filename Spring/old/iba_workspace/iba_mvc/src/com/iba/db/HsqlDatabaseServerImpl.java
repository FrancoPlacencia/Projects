package com.iba.db;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;
import org.hsqldb.Server;
import org.hsqldb.server.ServerConstants;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class HsqlDatabaseServerImpl implements HsqlDatabaseServer {

	private static final Logger LOGGER = LoggerFactory.getLogger(HsqlDatabaseServerImpl.class);
	
	private static final String ORG_HSQLDB_JDBC_DRIVER = "org.hsqldb.jdbcDriver";
	
	private Server server;
	
	@PostConstruct
	public void startServer(){
		if(server == null) {
			LOGGER.info("Stargin HSQL Server");
			server = new Server();
			try {
				server.setPort(0);
//				server.setDatabaseName(index, name);
				
			} catch (Exception e) {
				LOGGER.error("Error during HSQL Server startup...", e);
			}
		}
	}
	
	@PreDestroy
	public void shutdownServer() {
		if (server.getState() == ServerConstants.SERVER_STATE_ONLINE) {
			server.shutdown();
			LOGGER.info("HSQL Server at target stopped");
		}
	}
	
	@Override
	public String getJdbcConnectionString() {
		
		return null;
	}

	@Override
	public DataSource getDataSource() {
		BasicDataSource dataSource = new BasicDataSource();
		dataSource.setDriverClassName(ORG_HSQLDB_JDBC_DRIVER);
		String jdbcConnectionString = this.getJdbcConnectionString();
		dataSource.setUrl(jdbcConnectionString);
		return dataSource;
	}

}
