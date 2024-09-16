package com.crimsonlogic.vehicleinsurancesystem.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.crimsonlogic.vehicleinsurancesystem.model.User;
import com.crimsonlogic.vehicleinsurancesystem.utils.JDBCUtils;

public class UserDaoImpl implements UserDao {

    @Override
    public List<User> getNonAdminUsers() {
        List<User> users = new ArrayList<>();
        String sql = "SELECT * FROM users WHERE isAdmin = false";

        try (Connection conn = JDBCUtils.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                User user = new User();
                user.setUserId(rs.getLong("user_id"));
                user.setUserFname(rs.getString("user_fname"));
                user.setUserLname(rs.getString("user_lname"));
                user.setUserEmail(rs.getString("user_email"));
                user.setUserPhone(rs.getString("user_phone"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("user_password"));
                user.setAdmin(rs.getBoolean("isAdmin"));

                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    @Override
    public User getUserById(Long userId) {
        User user = null;
        String sql = "SELECT * FROM users WHERE user_id = ?";

        try (Connection conn = JDBCUtils.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setLong(1, userId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setUserId(rs.getLong("user_id"));
                user.setUserFname(rs.getString("user_fname"));
                user.setUserLname(rs.getString("user_lname"));
                user.setUserEmail(rs.getString("user_email"));
                user.setUserPhone(rs.getString("user_phone"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("user_password"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public void updateUser(User user) {
        String sql = "UPDATE users SET username = ?, user_email = ?, user_phone = ?, user_fname = ?, user_lname = ? WHERE user_id = ?";

        try (Connection conn = JDBCUtils.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getUserEmail());
            stmt.setString(3, user.getUserPhone());
            stmt.setString(4, user.getUserFname());
            stmt.setString(5, user.getUserLname());
            stmt.setLong(6, user.getUserId());
            System.out.println(stmt.toString());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteUser(Long userId) {
        String sql = "DELETE FROM users WHERE user_id = ?";

        try (Connection conn = JDBCUtils.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setLong(1, userId);
            System.out.println(stmt.toString());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
