package com.crimsonlogic.vehicleinsurancesystem.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.crimsonlogic.vehicleinsurancesystem.dao.LoginDao;
import com.crimsonlogic.vehicleinsurancesystem.exception.IncorrectUsernamePasswordException;
import com.crimsonlogic.vehicleinsurancesystem.model.LoginBean;
import com.crimsonlogic.vehicleinsurancesystem.model.User;

/**
 * Servlet implementation class login
 */
@WebServlet("/Login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private LoginDao loginDao;
	
	public void init() {
		loginDao = new LoginDao();
	}
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("login/login.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		authenticate(request, response);
	}
	
	private void authenticate(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		LoginBean loginBean = new LoginBean();
		loginBean.setUsername(username);
		loginBean.setPassword(password);

		try {
			User user = loginDao.validate(loginBean);
			if (user != null) {
				HttpSession sessionObj = request.getSession(true);
			    sessionObj.setAttribute("userId", user.getUserId());
				sessionObj.setAttribute("userfname", user.getUserFname());
				RequestDispatcher dispatcher;
	            if (user.isAdmin()) {
	                dispatcher = request.getRequestDispatcher("adminhome/admin_home.jsp");
	            } else {
	                dispatcher = request.getRequestDispatcher("home/home.jsp");
	            }
	            dispatcher.forward(request, response);
	        } else {
	        	throw new IncorrectUsernamePasswordException("Incorrect username or password");
	        }
		} catch (IncorrectUsernamePasswordException e) {
//			HttpSession sessionObj = request.getSession();
			 request.setAttribute("errorMessage", e.getMessage());
	            RequestDispatcher dispatcher = request.getRequestDispatcher("login/login.jsp");
	            dispatcher.forward(request, response);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} 

	}

}
