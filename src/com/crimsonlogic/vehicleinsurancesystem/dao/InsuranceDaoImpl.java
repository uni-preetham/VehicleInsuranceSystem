package com.crimsonlogic.vehicleinsurancesystem.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import com.crimsonlogic.vehicleinsurancesystem.model.Insurance;
import com.crimsonlogic.vehicleinsurancesystem.utils.JDBCUtils;

public class InsuranceDaoImpl implements InsuranceDao {

	@Override
	public boolean insertInsurance(Insurance insurance) {
		// Generate a random 8-digit insurance ID
		Random random = new Random();
		long randomInsuranceId = 10000000L + (Math.abs(random.nextLong()) % 90000000L); // Ensure positive and within
																						// range

		// Set the start and end date
		LocalDate startDate = LocalDate.now();
		LocalDate endDate = startDate.plusYears(1);

		// Determine insurance validity based on the dates
		String validity = startDate.isAfter(endDate) ? "Expired" : "Valid";

		// SQL query with insurance_id
		String sql = "INSERT INTO insurance(insurance_id, vehicle_id, policy_number, insurance_start_date, insurance_end_date, insurance_validity) "
				+ "VALUES (?, ?, ?, ?, ?, ?);";

		try (Connection connection = JDBCUtils.getConnection();
				PreparedStatement stmt = connection.prepareStatement(sql)) {
			// Set parameters for the query
			stmt.setLong(1, randomInsuranceId); // Set generated insurance ID
			stmt.setFloat(2, insurance.getVehicleId());
			stmt.setString(3, insurance.getPolicyNumber());
			stmt.setDate(4, java.sql.Date.valueOf(startDate));
			stmt.setDate(5, java.sql.Date.valueOf(endDate));
			stmt.setString(6, validity);


			// Execute update and return the result
			return stmt.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean updateInsurance(Insurance insurance) {
		String sql = "UPDATE insurance SET policy_number = ? , insurance_start_date = ?, insurance_end_date = ? , insurance_validity=? WHERE insurance_id = ?";
		try (Connection conn = JDBCUtils.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
			LocalDate startDate = insurance.getInsuranceStartDate();
			LocalDate endDate = startDate.plusYears(1);
			LocalDate todayDate = LocalDate.now();
			String validity = todayDate.isAfter(endDate) ? "Expired" : "Valid";
			stmt.setString(1, insurance.getPolicyNumber());
			stmt.setDate(2, java.sql.Date.valueOf(startDate));
			stmt.setDate(3, java.sql.Date.valueOf(endDate));
			stmt.setString(4, validity);
			stmt.setLong(5, insurance.getInsuranceId());
			System.out.println(stmt);
			return stmt.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean deleteInsurance(Long insuranceId) {
		String sql = "DELETE FROM insurance WHERE insurance_id = ?";
		try (Connection conn = JDBCUtils.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
			stmt.setLong(1, insuranceId);
			return stmt.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public Insurance getInsuranceById(Long insuranceId) {
		String sql = "SELECT * FROM insurance WHERE insurance_id = ?";
		try (Connection conn = JDBCUtils.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
			stmt.setLong(1, insuranceId);
			try (ResultSet rs = stmt.executeQuery()) {
				if (rs.next()) {
					return new Insurance(rs.getLong("insurance_id"), rs.getLong("vehicle_id"),
							rs.getString("policy_number"), rs.getDate("insurance_start_date").toLocalDate(),
							rs.getString("insurance_validity"));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public List<Insurance> getPendingInsuranceRequests() {
		List<Insurance> pendingInsurances = new ArrayList<>();
		try (Connection conn = JDBCUtils.getConnection();
				PreparedStatement stmt = conn
						.prepareStatement("SELECT * FROM insurance WHERE approval_status = 'Pending';")) {

			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Insurance insurance = new Insurance(rs.getLong("insurance_id"), rs.getLong("vehicle_id"),
						rs.getString("policy_number"), rs.getDate("insurance_start_date").toLocalDate(),
						rs.getDate("insurance_end_date").toLocalDate(), rs.getString("insurance_validity"),
						rs.getString("approval_status"));
				pendingInsurances.add(insurance);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return pendingInsurances;
	}

}
