package com.crimsonlogic.vehicleinsurancesystem.utils;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.time.LocalDate;

public class JDBCUtils {
	private static String jdbcUrl = "jdbc:postgresql://localhost:5432/VehicleInsuranceSystem";
	private static String jdbcUserName = "postgres";
	private static String jdbcPassword = "crimson@123";

	public static Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName("org.postgresql.Driver");
			conn = DriverManager.getConnection(jdbcUrl, jdbcUserName, jdbcPassword);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException ce) {
			ce.printStackTrace();
		}
		return conn;
	}

	public static Date getSQLDate(LocalDate dt) { // LocalDate(Java) to sql Date
		return java.sql.Date.valueOf(dt);
	}

	public static LocalDate getUtilDate(Date dt) { // sql Date to LocalDate(Java
		return dt.toLocalDate();
	}

	public static void printSQLException(SQLException se) {
		for (Throwable te : se) {
			if (te instanceof SQLException) {
				te.printStackTrace(System.err);
				System.err.println("SQLState: " + ((SQLException) te).getSQLState());
				System.err.println("Error Code: " + ((SQLException) te).getErrorCode());
				System.err.println("Message: " + te.getMessage());
				Throwable t = se.getCause();
				while (t != null) {
					System.out.println("Cause: " + t.getCause());
				}
			}
		}
	}
}
