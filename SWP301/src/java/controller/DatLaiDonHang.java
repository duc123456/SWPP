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
import java.util.List;
import model.Cart;
import model.OrderDetail;
import model.Product;
import model.User;

/**
 *
 * @author Dell
 */
@WebServlet(name = "DatLaiDonHang", urlPatterns = {"/datlaidonhang"})
public class DatLaiDonHang extends HttpServlet {

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
            out.println("<title>Servlet DatLaiDonHang</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DatLaiDonHang at " + request.getContextPath() + "</h1>");
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
        DAO d = new DAO();
        String oId_raw = request.getParameter("oId");
        try {
            int oId = Integer.parseInt(oId_raw);
            List<OrderDetail> orderDetail = d.getODDTbyOId(oId);

            Cookie[] arr = request.getCookies();
            HttpSession session = request.getSession();
            User u = (User) session.getAttribute("acc");
            String txt = "";
            String cart = "cart" + u.getuId();
            if (arr != null) {
                for (Cookie o : arr) {
                    if (o.getName().equals(cart)) {
                        txt += o.getValue();
                        o.setMaxAge(0);
                        response.addCookie(o);
                    }
                }
            }

            if (orderDetail != null) {
                for (OrderDetail od : orderDetail) {

                    if (txt.isEmpty()) {
                        txt = od.getProduct().getpId() + ":" + od.getAmount() + ":" + od.getPrice();

                    } else {

                        txt += "/" + od.getProduct().getpId() + ":" + od.getAmount() + ":" + od.getPrice();

                    }
                }

            }
            Cart c1 = new Cart(txt);
            session.setAttribute("cart", c1);
            session.setAttribute("size1", c1.getItems().size());

            Cookie c = new Cookie(cart, txt);
            c.setMaxAge(2 * 24 * 60 * 60);
            response.addCookie(c);

            request.getRequestDispatcher("cartsession").forward(request, response);
            // response.sendRedirect("cartsession");//thay cai duoi
            //request.getRequestDispatcher("shop").forward(request, response);
        } catch (NumberFormatException e) {
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
