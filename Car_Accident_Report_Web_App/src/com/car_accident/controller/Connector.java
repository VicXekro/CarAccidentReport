package com.car_accident.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connector {
	private static final String DB_URL = "jdbc:mysql://localhost:3306/car_accident";/*
																					 * +
																					 * "?verifyServerCertificate=false"+
																					 * "&useSLL=true"+
																					 * "&requireSLL=true";
																					 */
	private static final String DRIVER_NAME = "com.mysql.jdbc.Driver";
	private static final String DB_USERNAME = "root";
	private static final String DB_PWD = "asdfgh";

	/*
	 * public static Connection getConnection() throws NamingException,
	 * SQLException{
	 * 
	 * Context initContext = new InitialContext(); Context envContext = (Context)
	 * initContext.lookup("java:comp/env"); DataSource ds = (DataSource)
	 * envContext.lookup("jdbc/bookstoreDB"); Connection conn = ds.getConnection();
	 * return conn; }
	 */

	public static Connection getConnection() throws SQLException {
		try {
			Class.forName(DRIVER_NAME);
		} catch (ClassNotFoundException e) {
// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Connection conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PWD);
		return conn;
	}
}
