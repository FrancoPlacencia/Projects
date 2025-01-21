package db.sql;

import javax.annotation.PostConstruct;
import javax.sql.DataSource;

import org.hsqldb.util.DatabaseManagerSwing;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabase;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseBuilder;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseType;

@Configuration
public class SpringDBConfig {

	@Autowired
	DataSource dataSource;
	
	@Bean
	public NamedParameterJdbcTemplate getNamedParameterJdbcTemplate() {
		return new NamedParameterJdbcTemplate(dataSource);
	}
	/**
	 *
	 * Usage: java DatabaseManagerSwing [--options]
			where options include:
			    --help                show this message
			    --driver <classname>  jdbc driver class
			    --url <name>          jdbc url
			    --user <name>         username used for connection
			    --password <password> password for this user
			    --urlid <urlid>       use url/user/password/driver in rc file
			    --rcfile <file>       (defaults to 'dbmanager.rc' in home dir)
			    --dir <path>          default directory
			    --script <file>       reads from script file
			    --noexit              do not call system.exit()
	 */
	@PostConstruct
	public void startDBManager() {
		DatabaseManagerSwing.main(new String[] { 
//				"--help",
				"--url", "jdbc:hsqldb:hsql://localhost/ibadb", 
				"--user", "SA", 
				"--password", "",
				"--noexit"
				});
	}
	
	@Bean 
	DataSource getDataSource() {
		EmbeddedDatabaseBuilder builder = new EmbeddedDatabaseBuilder();
		EmbeddedDatabase db = builder
//				.setName("ibadb")
				.setType(EmbeddedDatabaseType.HSQL)
//				.addScript("db/sql/create-db.sql")
//				.addScript("db/sql/insert-data.sql")
				.build();
		return db;
	}
	
}
