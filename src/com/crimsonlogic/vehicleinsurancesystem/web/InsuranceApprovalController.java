package com.crimsonlogic.vehicleinsurancesystem.web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.crimsonlogic.vehicleinsurancesystem.dao.InsuranceDao;
import com.crimsonlogic.vehicleinsurancesystem.dao.InsuranceDaoImpl;
import com.crimsonlogic.vehicleinsurancesystem.model.Insurance;
import com.crimsonlogic.vehicleinsurancesystem.utils.JDBCUtils;

@WebServlet("/AdminInsuranceApproval")
public class InsuranceApprovalController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public InsuranceApprovalController() {
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

		if ("showPendingInsurances".equals(action)) {
			handleShowPendingInsurances(request, response); // Handling pending insurance requests
		} else {
			List<Insurance> pendingInsuranceList = insuranceDao.getPendingInsuranceRequests();
			request.setAttribute("pendingInsuranceList", pendingInsuranceList);
			request.getRequestDispatcher("/adminhome/admin_home.jsp").forward(request, response);
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");

		if ("approve".equals(action) || "reject".equals(action)) {
			handleInsuranceApproval(request, response); // Handling insurance approval/rejection
		} else {
			response.sendRedirect("error/error.jsp");
		}
	}

	private void handleInsuranceApproval(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Long insuranceId = Long.parseLong(request.getParameter("insurance_id"));

		String approvalStatus = null;
		if ("approve".equals(request.getParameter("action"))) {
			approvalStatus = "Approved";
		} else if ("reject".equals(request.getParameter("action"))) {
			approvalStatus = "Rejected";
		}

		try (Connection conn = JDBCUtils.getConnection();
				PreparedStatement stmt = conn
						.prepareStatement("UPDATE insurance SET approval_status = ? WHERE insurance_id = ?")) {

			stmt.setString(1, approvalStatus);
			stmt.setLong(2, insuranceId);
			System.out.println(stmt);
			int rowsUpdated = stmt.executeUpdate();
			if (rowsUpdated > 0) {
				response.sendRedirect("AdminInsuranceApproval?action=showPendingInsurances");
			} else {
				request.setAttribute("errorMessage", "Error updating approval status.");
				request.getRequestDispatcher("error/error.jsp").forward(request, response);
			}

		} catch (SQLException e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", "Error updating approval status.");
			request.getRequestDispatcher("error/error.jsp").forward(request, response);
		}
	}

	// This method handles the display of pending insurance requests
	private void handleShowPendingInsurances(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Fetch pending insurance requests using the DAO
		List<Insurance> pendingInsuranceList = insuranceDao.getPendingInsuranceRequests();
		System.out.println(pendingInsuranceList);
		request.setAttribute("pendingInsuranceList", pendingInsuranceList);

		// Forward the request to the admin JSP page for review
		request.getRequestDispatcher("/insurance/pendinginsurance.jsp").forward(request, response);
	}
}
