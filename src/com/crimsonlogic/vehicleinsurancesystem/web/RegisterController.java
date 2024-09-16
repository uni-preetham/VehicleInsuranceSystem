package com.crimsonlogic.vehicleinsurancesystem.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.crimsonlogic.vehicleinsurancesystem.dao.RegisterDao;
import com.crimsonlogic.vehicleinsurancesystem.model.User;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private RegisterDao registerDao;

	public void init() {
		registerDao = new RegisterDao();
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegisterController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("register/register.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		register(request, response);
	}

	private void register(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		HttpSession userSession = request.getSession();
		String firstName = request.getParameter("user_fname");
		String lastName = request.getParameter("user_lname");
		String email = request.getParameter("user_email");
		String phone = request.getParameter("user_phone");
		String username = request.getParameter("username");
		String password = request.getParameter("user_password");
		User user = new User();
		user.setUserFname(firstName);
		user.setUserLname(lastName);
		user.setUserEmail(email);
		user.setUserPhone(phone);
		user.setUsername(username);
		user.setPassword(password);
		try {
			int result = registerDao.registerUser(user);
			 if (result == 1) {
		            request.setAttribute("NOTIFICATION", "User Registered Successfully!");
		        } else {
		            request.setAttribute("NOTIFICATION", "Registration failed. Please try again.");
		        }
		    } catch (Exception e) {
		        // Log the exception (optional)
		        e.printStackTrace();
		        // Pass the exception message to the JSP
		        request.setAttribute("NOTIFICATION", "Registration failed: " + e.getMessage());
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher("register/register.jsp");
		dispatcher.forward(request, response);
	}

}
