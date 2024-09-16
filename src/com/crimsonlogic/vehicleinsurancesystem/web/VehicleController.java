package com.crimsonlogic.vehicleinsurancesystem.web;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.crimsonlogic.vehicleinsurancesystem.dao.VehicleDao;
import com.crimsonlogic.vehicleinsurancesystem.dao.VehicleDaoImpl;
import com.crimsonlogic.vehicleinsurancesystem.model.Vehicle;

/**
 * Servlet implementation class BikeController
 */
@WebServlet("/")
public class VehicleController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private VehicleDao vehicleDao;

	public void init() {
		vehicleDao = new VehicleDaoImpl();
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public VehicleController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getServletPath();
		switch (action) {
		case "/insert":
			insertVehicle(request, response);
			break;

		case "/list":
			listVehicles(request, response);
			break;

		case "/remove":
			try {
				removeVehicle(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;

		case "/update":
			try {
				updateVehicle(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;

		case "/edit":
			try {
				showEditForm(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "logout": // Add this case for logout
			handleLogout(request, response);
			break;

		default:
			RequestDispatcher rd = request.getRequestDispatcher("landing.jsp");
			rd.forward(request, response);
			break;
		}
	}

	private void handleLogout(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false); // Fetch session if exists
		if (session != null) {
			session.invalidate(); // Invalidate the session to log the user out
		}
		// Redirect the user to the landing page or login page
		response.sendRedirect(request.getContextPath() + "/Login"); // or /landing.jsp
	}

	private void removeVehicle(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		String vehicleIdStr = request.getParameter("vehicle_id");
		if (vehicleIdStr != null) {
			Long vehicle_id = Long.parseLong(vehicleIdStr);
			boolean isDeleted = vehicleDao.removeVehicle(vehicle_id);
			if (isDeleted) {
				System.out.println("Vehicle with ID " + vehicle_id + " was deleted.");
			} else {
				System.out.println("Vehicle with ID " + vehicle_id + " was not found.");
			}
			response.sendRedirect("list");
		} else {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Vehicle ID is missing");
		}
	}

	private void listVehicles(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession sessionObj = request.getSession();
		Long userId = (Long) sessionObj.getAttribute("userId");
		List<Vehicle> vehicleList = vehicleDao.showAllVehicles(userId);
		sessionObj.setAttribute("vehicleList", vehicleList);
		RequestDispatcher rd = request.getRequestDispatcher("vehiclelist/vehiclelist.jsp");
		rd.forward(request, response);

	}

	private void insertVehicle(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession sessionObj = request.getSession();
		Long userId = (Long) sessionObj.getAttribute("userId");
		String vehicle_type = request.getParameter("vehicle_type");
		String vehicle_color = request.getParameter("vehicle_color");
		String vehicle_plate_number = request.getParameter("vehicle_plate_number");
		LocalDate vehicle_registration_date = LocalDate.parse(request.getParameter("vehicle_registration_date"));
		Vehicle newVehicleObj = new Vehicle(vehicle_type, vehicle_color, vehicle_plate_number,
				vehicle_registration_date, userId);
		vehicleDao.insertVehicle(newVehicleObj);
		response.sendRedirect("list");
	}

	private void updateVehicle(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException, SQLException {
		Long vehicleId = Long.parseLong(req.getParameter("vehicle_id"));
		String vehicle_type = req.getParameter("vehicle_type");
		String vehicle_color = req.getParameter("vehicle_color");
		String vehicle_plate_number = req.getParameter("vehicle_plate_number");
		Vehicle newVehicleObj = new Vehicle(vehicleId, vehicle_type, vehicle_color, vehicle_plate_number,
				LocalDate.now());
		vehicleDao.updateVehicle(newVehicleObj);
		resp.sendRedirect("list");
	}

	private void showEditForm(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException, SQLException {
		Long vehicleId = Long.parseLong(req.getParameter("vehicle_id"));
		Vehicle existingVehicle = vehicleDao.selectVehicle(vehicleId);
		RequestDispatcher rd = req.getRequestDispatcher("vehicle/vehicle.jsp");
		req.setAttribute("existingVehicle", existingVehicle);
		rd.forward(req, resp);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
