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
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Cart;
import model.Item;
import model.Product;
import model.User;

/**
 *
 * @author Dell
 */
@WebServlet(name = "Process", urlPatterns = {"/process"})
public class Process extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Process</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Process at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        String id_raw = request.getParameter("id");
        String num_raw = request.getParameter("num");
        HttpSession session = request.getSession();

        try {
            int id = Integer.parseInt(id_raw);
            int num = Integer.parseInt(num_raw);
            Cart c = (Cart) session.getAttribute("cart");
            DAO d = new DAO();
            Product p = d.getProductByID(id);
            Item t = c.getItemById(id);
            int t1 = t.getQuantity() + num;
            if (t1 > 0 && t1 <= p.getQuantity()) {
                t.setQuantity(t.getQuantity() + num);
            }
            if (session.getAttribute("acc") != null) {
               
        User u = (User)session.getAttribute("acc");
        String cart = "cart" + u.getuId();
                Cookie[] cookie = request.getCookies();
                for (Cookie cookie1 : cookie) {
                    if (cookie1.getName().equals(cart)) {
                        cookie1.setMaxAge(0);
                        response.addCookie(cookie1);
                        String txt = c.cartToTxt(c);
                        Cookie c1 = new Cookie(cart, txt);
                        c1.setMaxAge(2 * 24 * 60 * 60);
                        response.addCookie(c1);
                    }
                }
            }
            session.setAttribute("cart", c);
            response.sendRedirect("cart.jsp");

        } catch (Exception e) {
        }
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
