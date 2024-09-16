package com.crimsonlogic.vehicleinsurancesystem.dao;

import java.sql.SQLException;
import java.util.List;

import com.crimsonlogic.vehicleinsurancesystem.model.Vehicle;

public interface VehicleDao {
	void insertVehicle(Vehicle vehicle);
	
	Vehicle selectVehicle(Long vehicleId);
	
	List<Vehicle> showAllVehicles(Long userId);
	
	boolean removeVehicle(Long vehicleId) throws SQLException;
	
	boolean updateVehicle(Vehicle vehicle) throws SQLException;
	
	
}
