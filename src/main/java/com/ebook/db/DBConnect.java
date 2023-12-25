package com.ebook.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	private static Connection connection;

	public static Connection getConnection() {
		String dbUrl = "jdbc:mysql://127.0.0.1:3306/?user=excelr";
		String user = "excelr";
		String password = "excelr@123";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(dbUrl, user, password);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return connection;
	}
}
