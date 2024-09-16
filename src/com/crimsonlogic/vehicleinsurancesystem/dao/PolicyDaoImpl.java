package com.crimsonlogic.vehicleinsurancesystem.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.crimsonlogic.vehicleinsurancesystem.model.Policy;
import com.crimsonlogic.vehicleinsurancesystem.utils.JDBCUtils;
public class PolicyDaoImpl implements PolicyDao {


    @Override
    public void insertPolicy(Policy policy) throws SQLException {
        String sql = "INSERT INTO insurance_policy(policy_number, policy_type, premium_amount, idv) VALUES (?, ?, ?, ?);";
        
        try (Connection connection = JDBCUtils.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, policy.getPolicyNumber());
            preparedStatement.setString(2, policy.getPolicyType());
            preparedStatement.setBigDecimal(3, policy.getPremiumAmount());
            preparedStatement.setBigDecimal(4, policy.getIdv());

            preparedStatement.executeUpdate();
        }
    }

    @Override
    public void updatePolicy(Policy policy) throws SQLException {
        String sql = "UPDATE insurance_policy SET policy_type = ?, premium_amount = ?, idv = ? WHERE policy_number = ?;";
        
        try (Connection connection = JDBCUtils.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
             
            preparedStatement.setString(1, policy.getPolicyType());
            preparedStatement.setBigDecimal(2, policy.getPremiumAmount());
            preparedStatement.setBigDecimal(3, policy.getIdv());
            preparedStatement.setString(4, policy.getPolicyNumber());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        }
    }

    @Override
    public void deletePolicy(String policyNumber) throws SQLException {
        String sql = "DELETE FROM insurance_policy WHERE policy_number = ?;";
        
        try (Connection connection = JDBCUtils.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
             
            preparedStatement.setString(1, policyNumber);
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        }
    }

    @Override
    public Policy getPolicyByNumber(String policyNumber) throws SQLException {
        String sql = "SELECT * FROM insurance_policy WHERE policy_number = ?;";
        Policy policy = null;
        
        try (Connection connection = JDBCUtils.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
             
            preparedStatement.setString(1, policyNumber);
            ResultSet resultSet = preparedStatement.executeQuery();
            
            if (resultSet.next()) {
                policy = new Policy();
                policy.setPolicyNumber(resultSet.getString("policy_number"));
                policy.setPolicyType(resultSet.getString("policy_type"));
                policy.setPremiumAmount(resultSet.getBigDecimal("premium_amount"));
                policy.setIdv(resultSet.getBigDecimal("idv"));
            }
        }
        
        return policy;
    }

    @Override
    public List<Policy> getAllPolicies() throws SQLException {
        String sql = "SELECT * FROM insurance_policy;";
        List<Policy> policies = new ArrayList<>();
        
        try (Connection connection = JDBCUtils.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
        	System.out.println(preparedStatement);
             
            ResultSet resultSet = preparedStatement.executeQuery();
            
            while (resultSet.next()) {
                Policy policy = new Policy();
                policy.setPolicyNumber(resultSet.getString("policy_number"));
                policy.setPolicyType(resultSet.getString("policy_type"));
                policy.setPremiumAmount(resultSet.getBigDecimal("premium_amount"));
                policy.setIdv(resultSet.getBigDecimal("idv"));
                policies.add(policy);
            }
        }
        
        return policies;
    }


}
