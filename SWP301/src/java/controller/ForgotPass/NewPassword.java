package com.uniquedeveloper.registration;

import dal.DAO;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class NewPassword
 */
@WebServlet("/newPassword")
public class NewPassword extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DAO d = new DAO();
        HttpSession session = request.getSession();
        String newPassword = request.getParameter("password");
        String confPassword = request.getParameter("confPassword");

        if (newPassword != null && confPassword != null && newPassword.equals(confPassword)) {
            d.changePass(newPassword, (String) session.getAttribute("user"));
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            String ms = "Mật khẩu không hợp lệ!";
            request.setAttribute("ms", ms);
            request.getRequestDispatcher("newPassword.jsp").forward(request, response);
        }

    }

}
