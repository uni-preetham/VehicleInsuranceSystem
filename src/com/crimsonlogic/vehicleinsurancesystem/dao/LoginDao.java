package com.crimsonlogic.vehicleinsurancesystem.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.crimsonlogic.vehicleinsurancesystem.exception.IncorrectUsernamePasswordException;
import com.crimsonlogic.vehicleinsurancesystem.model.LoginBean;
import com.crimsonlogic.vehicleinsurancesystem.model.User;
import com.crimsonlogic.vehicleinsurancesystem.utils.JDBCUtils;

public class LoginDao {
	public User validate(LoginBean loginBean) throws ClassNotFoundException, IncorrectUsernamePasswordException {
		boolean status = false;
		User user = null;
		
		try (Connection connection = JDBCUtils.getConnection();
				PreparedStatement preparedStatement = connection
						.prepareStatement("select * from users where username = ? and user_password = ?")) {
			preparedStatement.setString(1, loginBean.getUsername());
			preparedStatement.setString(2, loginBean.getPassword());

			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			status = rs.next();
			 if (status) {
	                user = new User();
	                user.setUserId(rs.getLong("user_id"));
	                user.setUserFname(rs.getString("user_fname"));
	                user.setUserLname(rs.getString("user_lname"));
	                user.setUserEmail(rs.getString("user_email"));
	                user.setUserPhone(rs.getString("user_phone"));
	                user.setPassword(rs.getString("user_password"));
	                user.setUsername(rs.getString("username"));
	                user.setAdmin(rs.getBoolean("isadmin"));
	            } else {
	                throw new IncorrectUsernamePasswordException("Incorrect username or password");
	            }

		} catch (SQLException e) {
			JDBCUtils.printSQLException(e);
		}
		return user;
	}
	
	

}
