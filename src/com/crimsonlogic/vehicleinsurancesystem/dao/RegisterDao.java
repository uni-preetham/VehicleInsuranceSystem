package com.crimsonlogic.vehicleinsurancesystem.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.crimsonlogic.vehicleinsurancesystem.model.User;
import com.crimsonlogic.vehicleinsurancesystem.utils.JDBCUtils;

public class RegisterDao {
	public int registerUser(User user) throws ClassNotFoundException {
		String INSERT_USERS_SQL = "insert into users(user_fname,user_lname,user_email,isAdmin,user_phone,username,user_password) values(?, ?, ?, false, ?, ?, ?);";

		int result = 0;
		try (Connection connection = JDBCUtils.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
			preparedStatement.setString(1, user.getUserFname());
			preparedStatement.setString(2, user.getUserLname());
			preparedStatement.setString(3, user.getUserEmail());
			preparedStatement.setString(4, user.getUserPhone());
			preparedStatement.setString(5, user.getUsername());
			preparedStatement.setString(6, user.getPassword());
			

			System.out.println(preparedStatement);
			result = preparedStatement.executeUpdate();

		} catch (SQLException e) {
			JDBCUtils.printSQLException(e);
		}
		return result;
	}
}
