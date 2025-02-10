package org.example;

import java.sql.*;

public class Main {
    static final String JDBC_DRIVER = "org.mariadb.jdbc.Driver";
    static final String DB_URL = "jdbc:mariadb://localhost:3306/tvmtz_dev";
    static final String USER = "root";
    static final String PASSWORD = "M4r1@Db_R0ot_P4$sw0rd";

    public static void main(String[] args) throws SQLException {
        Connection connection = null;
        Statement statement = null;
        try {
            // Class.forName("org.mariadb.jdbc.Driver");
            System.out.println("Connect to DB...");
            connection = DriverManager.getConnection(DB_URL,USER,PASSWORD);
            statement = connection.createStatement();
            String sql = "DESCRIBE games";
            ResultSet resultSet = statement.executeQuery(sql);
            while(resultSet.next()) {
                System.out.println(resultSet);
            }
        } catch (SQLException sqlException) {
            //Handle errors for JDBC
            sqlException.printStackTrace();
        } catch (Exception exception) {
            //Handle errors for Class.forName
            exception.printStackTrace();
        } finally {
            try{
                if (statement != null) {
                    connection.close();
                }
            } catch (SQLException sqlException) {
                // DON'T PROPAGATE
                sqlException.printStackTrace();
            }
            try{
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException sqlException) {
                sqlException.printStackTrace();
            }
        }
    }
}