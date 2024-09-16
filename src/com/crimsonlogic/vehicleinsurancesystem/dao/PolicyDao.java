package com.crimsonlogic.vehicleinsurancesystem.dao;

import java.sql.SQLException;
import java.util.List;

import com.crimsonlogic.vehicleinsurancesystem.model.Policy;

public interface PolicyDao {
	void insertPolicy(Policy policy) throws SQLException;
	void updatePolicy(Policy policy) throws SQLException;
	void deletePolicy(String policyNumber) throws SQLException;
	Policy getPolicyByNumber(String policyNumber) throws SQLException;
	List<Policy> getAllPolicies() throws SQLException;

}
