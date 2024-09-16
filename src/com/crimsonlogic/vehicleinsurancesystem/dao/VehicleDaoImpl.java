package com.crimsonlogic.vehicleinsurancesystem.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import com.crimsonlogic.vehicleinsurancesystem.model.Vehicle;
import com.crimsonlogic.vehicleinsurancesystem.utils.JDBCUtils;

public class VehicleDaoImpl implements VehicleDao {

	private static final String INSERT_VEHICLE_SQL = "INSERT INTO vehicle(user_id, vehicle_type, vehicle_color, vehicle_plate_number, vehicle_registration_date) VALUES (?, ?, ?, ?, ?);";
	private static final String SELECT_ALL_VEHICLES = "SELECT * FROM vehicle WHERE vehicle_id=?;";
	private static final String SELECT_VEHICLE_BY_ID = "SELECT * FROM vehicle WHERE user_id=?;";
	private static final String DELETE_VEHICLE_BY_ID = "DELETE FROM vehicle WHERE vehicle_id=?;";
	private static final String UPDATE_VEHICLE = "UPDATE vehicle SET vehicle_type=?, vehicle_color=?, vehicle_plate_number=?, vehicle_registration_date=? WHERE vehicle_id=?;";

	@Override
	public void insertVehicle(Vehicle vehicle) {

		try {
			Connection conn = JDBCUtils.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(INSERT_VEHICLE_SQL);
			pstmt.setLong(1, vehicle.getUserId());
			pstmt.setString(2, vehicle.getVehicleType());
			pstmt.setString(3, vehicle.getVehicleColor());
			pstmt.setString(4, vehicle.getVehiclePlateNumber());
			pstmt.setDate(5, JDBCUtils.getSQLDate(vehicle.getVehicleRegistrationDate()));
			pstmt.executeUpdate();
			System.out.println(pstmt);

		} catch (SQLException exception) {
			JDBCUtils.printSQLException(exception);
		}

	}

	@Override
	public List<Vehicle> showAllVehicles(Long userId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		List<Vehicle> vehicleList = null;
		try {
			conn = JDBCUtils.getConnection();
			pstmt = conn.prepareStatement(SELECT_VEHICLE_BY_ID);
			pstmt.setLong(1, userId);
			vehicleList = new ArrayList<Vehicle>();
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				long vehicle_id = rs.getLong(1);
				long user_id = rs.getLong(2);
				String vehicle_type = rs.getString(3);
				String vehicle_color = rs.getString(4);
				String vehicle_plate_number = rs.getString(5);
				LocalDate vehicle_registration_date = JDBCUtils.getUtilDate(rs.getDate(6));
				vehicleList.add(new Vehicle(vehicle_id, user_id, vehicle_type, vehicle_color, vehicle_plate_number,
						vehicle_registration_date));
			}
		} catch (SQLException exception) {
			JDBCUtils.printSQLException(exception);
		} finally {
			try {
				conn.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return vehicleList;
	}

	public boolean removeVehicle(Long vehicle_id) throws SQLException {
		boolean rowDeleted = false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = JDBCUtils.getConnection();
			pstmt = conn.prepareStatement(DELETE_VEHICLE_BY_ID);
			pstmt.setLong(1, vehicle_id);
			System.out.println(pstmt);
			rowDeleted = pstmt.executeUpdate() > 0;
		} catch (SQLException exception) {
			JDBCUtils.printSQLException(exception);
		} finally {
			try {
				conn.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return rowDeleted;
	}

	// UPDATE vehicle SET vehicle_type=?, vehicle_color=?, vehicle_plate_number=?,
	// vehicle_registration_date=? WHERE vehicle_id=?;

	@Override
	public boolean updateVehicle(Vehicle vehicle) throws SQLException {
		boolean rowUpdated = false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = JDBCUtils.getConnection();
			pstmt = conn.prepareStatement(UPDATE_VEHICLE);
			pstmt.setString(1, vehicle.getVehicleType());
			pstmt.setString(2, vehicle.getVehicleColor());
			pstmt.setString(3, vehicle.getVehiclePlateNumber());
			pstmt.setDate(4, JDBCUtils.getSQLDate(vehicle.getVehicleRegistrationDate()));
			pstmt.setLong(5, vehicle.getVehicleId());
			System.out.println(pstmt);
			rowUpdated = pstmt.executeUpdate() > 0;
		} catch (SQLException exception) {
			JDBCUtils.printSQLException(exception);
		} finally {
			try {
				conn.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return rowUpdated;
	}

	@Override
	public Vehicle selectVehicle(Long vehicleId) {
		Vehicle vehicle = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = JDBCUtils.getConnection();
			pstmt = conn.prepareStatement(SELECT_ALL_VEHICLES);
			pstmt.setLong(1, vehicleId);
			System.out.println(pstmt);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				long vehicle_id = rs.getLong(1);
				long user_id = rs.getLong(2);
				String vehicle_type = rs.getString(3);
				String vehicle_color = rs.getString(4);
				String vehicle_plate_number = rs.getString(5);
				LocalDate vehicle_registration_date = JDBCUtils.getUtilDate(rs.getDate(6));
				vehicle = new Vehicle(vehicle_id, user_id, vehicle_type, vehicle_color, vehicle_plate_number,
						vehicle_registration_date);
			}
		} catch (SQLException exception) {
			JDBCUtils.printSQLException(exception);
		} finally {
			try {
				conn.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return vehicle;
	}

}
