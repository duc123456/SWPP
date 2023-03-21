/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.OrderLog;
import model.User;

/**
 *
 * @author nhant
 */
@WebServlet(name = "FindStatus", urlPatterns = {"/findstatus"})
public class FindStatus extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();
        //ep string acc sang user
        User a = (User) session.getAttribute("acc");
        //bat buoc phai dang nhap 
        if (session.getAttribute("acc") == null) {
            request.getRequestDispatcher("login.jsp").forward(request, response);
            //neu role = 1 (Admin) thi moi duoc vao manager 
        } else if (a.getRoleId() == 3) {
            DAO dao = new DAO();
            int statusid = Integer.parseInt(request.getParameter("statusid"));

            List<OrderLog> list = dao.getStatusOrder(statusid);
            int productOrder = dao.getTotalOrder();
            request.setAttribute("totalorder", productOrder);

            int productOrder1 = dao.getOrder1();
            request.setAttribute("order1", productOrder1);

            int productOrder2 = dao.getOrder2();
            request.setAttribute("order2", productOrder2);

            int productOrder3 = dao.getOrder3();
            request.setAttribute("order3", productOrder3);

            int productOrder4 = dao.getOrder4();
            request.setAttribute("order4", productOrder4);

            request.setAttribute("listOD", list);

            request.getRequestDispatcher("ManagerOrder.jsp").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
