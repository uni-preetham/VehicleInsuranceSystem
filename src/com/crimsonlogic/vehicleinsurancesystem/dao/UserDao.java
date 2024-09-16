package com.crimsonlogic.vehicleinsurancesystem.dao;

import java.util.List;
import com.crimsonlogic.vehicleinsurancesystem.model.User;

public interface UserDao {
    List<User> getNonAdminUsers();
    User getUserById(Long userId); // Add this method
    void updateUser(User user); // Add this method
    void deleteUser(Long userId); // Add this method
}
