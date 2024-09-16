package com.crimsonlogic.vehicleinsurancesystem.web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.crimsonlogic.vehicleinsurancesystem.dao.InsuranceDao;
import com.crimsonlogic.vehicleinsurancesystem.dao.InsuranceDaoImpl;
import com.crimsonlogic.vehicleinsurancesystem.model.Insurance;
import com.crimsonlogic.vehicleinsurancesystem.model.Policy;
import com.crimsonlogic.vehicleinsurancesystem.utils.JDBCUtils;

@WebServlet("/UserInsuranceController")
public class UserInsuranceController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserInsuranceController() {
		super();
	}

	private InsuranceDao insuranceDao;

	@Override
	public void init() {
		insuranceDao = new InsuranceDaoImpl();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		switch (action) {
		case "showinsurances":
			handleShowInsurances(request, response);
			break;
		case "editinsurance":
			showEditInsuranceForm(request, response);
			break;
		case "deleteinsurance":
			handleDeleteInsurance(request, response);
			break;
		case "showallinsurances":
			handleShowAllInsurances(request, response);
			break;
		case "rejectinsurance":
			handleRejectInsurance(request, response); // New reject action
			break;

		default:
			handleDefaultAction(request, response);
			break;
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		switch (action) {
		case "buyinsurance":
			handleBuyInsurance(request, response);
			break;
		case "updateinsurance":
			handleUpdateInsurance(request, response);
			break;
		case "showinsurances":
			handleShowInsurances(request, response);
			break;
		default:
			response.sendRedirect("error.jsp");
			break;
		}
	}

	// Handle rejecting an insurance policy by updating the approval status to
	// "rejected"
	private void handleRejectInsurance(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			Long insuranceId = Long.parseLong(request.getParameter("insuranceId"));

			// SQL query to update the approval status to "rejected"
			String sql = "UPDATE insurance SET approval_status = 'rejected' WHERE insurance_id = ?";

			try (Connection conn = JDBCUtils.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
				stmt.setLong(1, insuranceId);
				int rowsUpdated = stmt.executeUpdate();

				if (rowsUpdated > 0) {
					response.sendRedirect("UserInsuranceController?action=showallinsurances");
				} else {
					request.setAttribute("errorMessage", "Failed to reject insurance. Please try again.");
					request.getRequestDispatcher("/insurance/admininsurancelist.jsp").forward(request, response);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			response.sendRedirect("error/error.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("error/error.jsp");
		}
	}

	// Handle buying a new insurance policy
	private void handleBuyInsurance(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			Long vehicleId = Long.parseLong(request.getParameter("vehicle_id"));
			String policyNumber = request.getParameter("policy_type");
			LocalDate todayDate = LocalDate.now();

			Insurance insurance = new Insurance(vehicleId, policyNumber);
			boolean result = insuranceDao.insertInsurance(insurance);

			if (result) {
				response.sendRedirect("home/home.jsp");
			} else {
				request.setAttribute("errorMessage", "Failed to add insurance. Please try again.");
				request.getRequestDispatcher("/insurance/newinsurance.jsp").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("error/error.jsp");
		}
	}

	// Show the edit insurance form
	private void showEditInsuranceForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Long insuranceId = Long.parseLong(request.getParameter("insuranceId"));
		Insurance existingInsurance = insuranceDao.getInsuranceById(insuranceId);
		request.setAttribute("existingInsurance", existingInsurance);
		request.getRequestDispatcher("/insurance/editinsurance.jsp").forward(request, response);
	}

	// Handle updating an existing insurance policy
	private void handleUpdateInsurance(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			Long insuranceId = Long.parseLong(request.getParameter("insuranceId"));
			String policyNumber = request.getParameter("policy_type");
			LocalDate startDate = LocalDate.parse(request.getParameter("insurance_start_date"));
			Insurance insurance = new Insurance(insuranceId, policyNumber, startDate);
			boolean result = insuranceDao.updateInsurance(insurance);

			if (result) {
				response.sendRedirect("UserInsuranceController?action=showallinsurances");
			} else {
				request.setAttribute("errorMessage", "Failed to update insurance. Please try again.");
				request.getRequestDispatcher("/insurance/editinsurance.jsp").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("error/error.jsp");
		}
	}

	// Handle deleting an insurance policy
	private void handleDeleteInsurance(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			Long insuranceId = Long.parseLong(request.getParameter("insuranceId"));
			boolean result = insuranceDao.deleteInsurance(insuranceId);

			if (result) {
				response.sendRedirect("UserInsuranceController?action=showallinsurances");
			} else {
				request.setAttribute("errorMessage", "Failed to delete insurance. Please try again.");
				request.getRequestDispatcher("/insurance/admininsurancelist.jsp").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("error/error.jsp");
		}
	}

	// Handle displaying the list of insurances
	private void handleShowInsurances(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Map<String, Object>> insuranceList = new ArrayList<>();
		HttpSession sessionObj = request.getSession();
		Long userId = (Long) sessionObj.getAttribute("userId");

		if (userId == null) {
			response.sendRedirect("error.jsp");
			return;
		}

		String sql = "SELECT v.vehicle_type, ip.policy_type, i.insurance_start_date, i.insurance_end_date, i.insurance_validity, ip.idv, i.approval_status  "
				+ "FROM users u " + "JOIN vehicle v ON u.user_id = v.user_id "
				+ "JOIN insurance i ON v.vehicle_id = i.vehicle_id "
				+ "JOIN insurance_policy ip ON i.policy_number = ip.policy_number " + "WHERE u.user_id = ?;";

		try (Connection conn = JDBCUtils.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
			stmt.setLong(1, userId);
			try (ResultSet rs = stmt.executeQuery()) {
				while (rs.next()) {
					Map<String, Object> insurance = new HashMap<>();
					insurance.put("vehicleType", rs.getString("vehicle_type"));
					insurance.put("policyType", rs.getString("policy_type"));
					insurance.put("insuranceStartDate", rs.getDate("insurance_start_date").toLocalDate());
					insurance.put("insuranceEndDate", rs.getString("insurance_end_date"));
					insurance.put("idv", rs.getFloat("idv"));
					insurance.put("insuranceApprovalStatus", rs.getString("approval_status"));

					insuranceList.add(insurance);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			response.sendRedirect("error/error.jsp");
			return;
		}

		request.setAttribute("insuranceList", insuranceList);
		request.getRequestDispatcher("/insurance/insurancelist.jsp").forward(request, response);
	}

	// Handle the default action, which loads policy types and forwards to the buy
	// insurance page
	private void handleDefaultAction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Policy> policyTypes = new ArrayList<>();
		try (Connection conn = JDBCUtils.getConnection();
				PreparedStatement stmt = conn
						.prepareStatement("SELECT policy_number, policy_type FROM insurance_policy;");
				ResultSet rs = stmt.executeQuery()) {
			while (rs.next()) {
				policyTypes.add(new Policy(rs.getString("policy_number"), rs.getString("policy_type")));
			}
			request.getSession().setAttribute("users_policyTypes", policyTypes);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher("/insurance/newinsurance.jsp").forward(request, response);
	}

	private void handleShowAllInsurances(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Map<String, Object>> allInsuranceList = new ArrayList<>();

		String sql = "SELECT u.user_fname, v.vehicle_id, i.insurance_id, u.username, v.vehicle_type, ip.policy_type, i.insurance_start_date, i.insurance_end_date, i.insurance_validity, ip.idv "
				+ "FROM users u " + "JOIN vehicle v ON u.user_id = v.user_id "
				+ "JOIN insurance i ON v.vehicle_id = i.vehicle_id "
				+ "JOIN insurance_policy ip ON i.policy_number = ip.policy_number where i.approval_status ILIKE 'approved'";

		try (Connection conn = JDBCUtils.getConnection();
				PreparedStatement stmt = conn.prepareStatement(sql);
				ResultSet rs = stmt.executeQuery()) {

			while (rs.next()) {
				Map<String, Object> insurance = new HashMap<>();
				insurance.put("userFname", rs.getString("user_fname"));
				insurance.put("insuranceId", rs.getLong("insurance_id"));
				insurance.put("vehicleId", rs.getLong("vehicle_id"));
				insurance.put("vehicleType", rs.getString("vehicle_type"));
				insurance.put("policyType", rs.getString("policy_type"));
				insurance.put("insuranceStartDate", rs.getDate("insurance_start_date").toLocalDate());
				insurance.put("insuranceEndDate", rs.getDate("insurance_end_date").toLocalDate());
				insurance.put("insuranceValidity", rs.getString("insurance_validity"));
				insurance.put("idv", rs.getFloat("idv"));

				allInsuranceList.add(insurance);
			}

		} catch (SQLException e) {
			e.printStackTrace();
			response.sendRedirect("error/error.jsp");
			return;
		}

		request.setAttribute("allInsuranceList", allInsuranceList);
		request.getRequestDispatcher("/insurance/admininsurancelist.jsp").forward(request, response);
	}
}
