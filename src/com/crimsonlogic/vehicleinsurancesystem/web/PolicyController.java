package com.crimsonlogic.vehicleinsurancesystem.web;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.crimsonlogic.vehicleinsurancesystem.dao.PolicyDao;
import com.crimsonlogic.vehicleinsurancesystem.dao.PolicyDaoImpl;
import com.crimsonlogic.vehicleinsurancesystem.model.Policy;

@WebServlet("/PolicyController")
public class PolicyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PolicyDao policyDao;

	@Override
	public void init() {
		policyDao = new PolicyDaoImpl();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		switch (action != null ? action : "") {
		case "editpolicy":
			showEditForm(request, response);
			break;
		case "deletepolicy":
			try {
				deletePolicy(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;

		case "insertpolicy":
			try {
				insertPolicy(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "updatepolicy":
			try {
				updatePolicy(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		default:
			listPolicies(request, response);
			break;
		}
	}

	private void listPolicies(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			List<Policy> policies = policyDao.getAllPolicies();
			request.setAttribute("policyList", policies);
			request.getRequestDispatcher("policies/policieslist.jsp").forward(request, response);
		} catch (SQLException e) {
			throw new ServletException("Database error", e);
		}
	}

	private void showEditForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String policyNumber = request.getParameter("policyNumber");
		try {
			Policy existingPolicy = policyDao.getPolicyByNumber(policyNumber);
			request.setAttribute("policy", existingPolicy);
			request.getRequestDispatcher("policies/addpolicy.jsp").forward(request, response);
		} catch (SQLException e) {
			throw new ServletException("Database error", e);
		}
	}

	private void insertPolicy(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		String policyType = request.getParameter("policyType");
		BigDecimal premiumAmount = new BigDecimal(request.getParameter("premiumAmount"));
		BigDecimal idv = new BigDecimal(request.getParameter("idv"));
		String policyNumber = generateRandomPolicyNumber();

		Policy policy = new Policy(policyNumber, policyType, premiumAmount, idv);
		policyDao.insertPolicy(policy);
		response.sendRedirect(request.getContextPath() + "/PolicyController?action=viewpolicies");
	}

	private void updatePolicy(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		String policyNumber = request.getParameter("policyNumber");
		String policyType = request.getParameter("policyType");
		BigDecimal premiumAmount = new BigDecimal(request.getParameter("premiumAmount"));
		BigDecimal idv = new BigDecimal(request.getParameter("idv"));

		Policy policy = new Policy();
		policy.setPolicyNumber(policyNumber);
		policy.setPolicyType(policyType);
		policy.setPremiumAmount(premiumAmount);
		policy.setIdv(idv);

		policyDao.updatePolicy(policy);
		response.sendRedirect(request.getContextPath() + "/PolicyController?action=viewpolicies");
	}

	private void deletePolicy(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		String policyNumber = request.getParameter("policyNumber");
		policyDao.deletePolicy(policyNumber);
		response.sendRedirect("PolicyController");
	}

	private String generateRandomPolicyNumber() {
		return String.format("%010d", (int) (Math.random() * 1000000000));
	}
}
