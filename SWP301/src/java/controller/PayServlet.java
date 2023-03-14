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
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Cart;
import model.Guest;
import model.Item;
import model.User;

/**
 *
 * @author Dell
 */
@WebServlet(name = "PayServlet", urlPatterns = {"/pay"})
public class PayServlet extends HttpServlet {

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
            out.println("<title>Servlet PayServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PayServlet at " + request.getContextPath() + "</h1>");
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
        String ho = request.getParameter("ho");
        String ten = request.getParameter("ten");
        String dia = request.getParameter("dia");
        String so = request.getParameter("so");
        String note = request.getParameter("note");
        Guest g = new Guest(0, ho, ten, dia, so);
        DAO d = new DAO();
        HttpSession session = request.getSession();
        Cart c = (Cart) session.getAttribute("cart");

        if (session.getAttribute("acc") != null) {
            User u = (User) session.getAttribute("acc");
            int uid = u.getuId();
            try {
                String s = d.insertOrderUser(uid, dia, c, note);
                request.setAttribute("mess", s);
                if (s.equals("Cam On")) {
                    Cookie[] cookie = request.getCookies();

                    String cart = "cart" + u.getuId();
                    for (Cookie cookie1 : cookie) {
                        if (cookie1.getName().equals(cart)) {
                            cookie1.setMaxAge(0);
                            response.addCookie(cookie1);
                        }
                        session.removeAttribute("cart");
                        session.removeAttribute("size");
                    }
                }

            } catch (SQLException ex) {
                Logger.getLogger(PayServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
//            try {
//                for (Item i : c.getItems()) {
//                    if (i.getProduct().getQuantity() > d.getProductByID(i.getProduct().getpId()).getQuantity()) {
//                        request.setAttribute("mess", "Loi");
//                        response.sendRedirect("listproduct");
//                    }
//
//                }

            if (g != null && c != null) {
                try {
                    String s = d.insertOrder(g, c, note);
                    request.setAttribute("mess", s);
                    if (s.equals("Cam On")) {
                        session.removeAttribute("cart");
                        session.removeAttribute("size");
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(PayServlet.class.getName()).log(Level.SEVERE, null, ex);
                }

            }

//            }catch (SQLException ex) {
//                
//            }
        }
        request.getRequestDispatcher("thankyou.jsp").forward(request, response);

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
