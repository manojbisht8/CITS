package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.apache.log4j.Logger;

import controller.CitsController;

public class ConnectionManager {
	
	private static Logger LOGGER = Logger.getLogger(ConnectionManager.class);
	
	/** DB connection*/
    public static Connection connect = null;
	
	/** Connect to Database. */
	public static void connectionToMySQL() {
		connection();
		//String host = "jdbc:mysql://localhost/employee_project";
		String host = CitsPropertiesHandler.getInstance().getProperty("DB_HOST");
		//String username = "root";
		String username = CitsPropertiesHandler.getInstance().getProperty("DB_USER_NAME");
		//String password = "MySql@Oct02";
		String password = CitsPropertiesHandler.getInstance().getProperty("DB_PASSWRD");
		try {
			connect = DriverManager.getConnection(host, username, password);		
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/** Connect using Database driver. */
	public static void connection() {
		try {
			//Class.forName("com.mysql.jdbc.Driver");
			Class.forName(CitsPropertiesHandler.getInstance().getProperty("DB_DRIVER"));
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

}
