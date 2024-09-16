package com.crimsonlogic.vehicleinsurancesystem.web;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.crimsonlogic.vehicleinsurancesystem.dao.UserDao;
import com.crimsonlogic.vehicleinsurancesystem.dao.UserDaoImpl;
import com.crimsonlogic.vehicleinsurancesystem.model.User;

import java.io.IOException;
import java.util.List;

@WebServlet("/userlist")
public class UserListController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDao userDao;

    @Override
    public void init() {
        userDao = new UserDaoImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action != null ? action : "") {
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                deleteUser(request, response);
                break;
            default:
                listUsers(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("update".equals(action)) {
            updateUser(request, response);
        } else {
            listUsers(request, response);
        }
    }

    private void listUsers(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<User> users = userDao.getNonAdminUsers();
        request.setAttribute("usersList", users);
        request.getRequestDispatcher("userlist/userlist.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Long userId = Long.parseLong(request.getParameter("userId"));
        User existingUser = userDao.getUserById(userId);
        request.setAttribute("user", existingUser);
        request.getRequestDispatcher("userlist/editUser.jsp").forward(request, response);
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Long userId = Long.parseLong(request.getParameter("userId"));
        String username = request.getParameter("username");
        String userEmail = request.getParameter("userEmail");
        String userPhone = request.getParameter("userPhone");
        String userFname = request.getParameter("userFname");
        String userLname = request.getParameter("userLname");

        User user = new User();
        user.setUserId(userId);
        user.setUsername(username);
        user.setUserEmail(userEmail);
        user.setUserPhone(userPhone);
        user.setUserFname(userFname);
        user.setUserLname(userLname);
        userDao.updateUser(user);
        response.sendRedirect("userlist");
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Long userId = Long.parseLong(request.getParameter("userId"));
        userDao.deleteUser(userId);
        response.sendRedirect("userlist");
    }
}
