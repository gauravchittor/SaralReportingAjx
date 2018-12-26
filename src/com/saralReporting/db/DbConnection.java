package com.saralReporting.db;

import java.sql.Connection;
import java.sql.DriverManager;
//import java.sql.ResultSet;
import java.sql.SQLException;
//import java.sql.Statement;

public class DbConnection {

	public static Connection initiateCon() {
		Connection conn = null;
		try {
			
			//String driver = "org.postgresql.Driver";
			try {
				Class.forName("org.postgresql.Driver");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			conn = DriverManager.getConnection("jdbc:postgresql://127.0.0.1:5432/SaralDatabase",
					"postgres", "gaurav");
			/*conn = DriverManager.getConnection("jdbc:postgresql://10.88.29.175:5432/",
					"postgres", "postgres");*/
			System.out.println("Java JDBC PostgreSQL Example");
			return conn;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
		
		/*try (Connection connection = DriverManager.getConnection("jdbc:postgresql://127.0.0.1:5432/testSaral",
				"postgres", "gaurav")) {
			System.out.println("Java JDBC PostgreSQL Example");
			return connection;
		} catch (SQLException e) {
			System.out.println("Connection failure.");
			e.printStackTrace();
		}
		return null;*/
	}
}