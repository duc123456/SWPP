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
import model.Item;
import model.Product;
import model.User;

/**
 *
 * @author Dell
 */
@WebServlet(name = "AddCart", urlPatterns = {"/addcart"})
public class AddCart extends HttpServlet {

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
            out.println("<title>Servlet AddCart</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddCart at " + request.getContextPath() + "</h1>");
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
        DAO d = new DAO();
        String id_raw = request.getParameter("product");
        String quantity_raw = request.getParameter("quantity");
        
        String price_raw = request.getParameter("price");

        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("acc");

        if (id_raw != null && quantity_raw != null && price_raw != null
                && id_raw != "" && quantity_raw != "" && price_raw != "") {
            try {
                int id = Integer.parseInt(id_raw);
                int quantity = Integer.parseInt(quantity_raw);
                int price = Integer.parseInt(price_raw);
                Product p = d.getProductByID(id);
                Item t = new Item(p, quantity, price);
                // Chac chan tao duoc item

                Cart c = (Cart) session.getAttribute("cart");
                if (c != null) {
                    c.addItem(t);

                } else {
                    c = new Cart();
                    c.addItem(t);
                    session.setAttribute("cart", c);

                }
                if (u != null) {
                    String txt = c.cartToTxt(c);
                    Cookie[] cookie = request.getCookies();
                   String cart = "cart" + u.getuId();
                    for (Cookie o : cookie) {
                        if (o.getName().equals(cart)) {
                            txt += o.getValue();
                            o.setMaxAge(0);
                            response.addCookie(o);
                        }
                    }
                    Cookie cookie1 = new Cookie(cart, c.cartToTxt(c));
                    cookie1.setMaxAge(60*60*24*30);
                    response.addCookie(cookie1);
                }

                session.setAttribute("size", c.getItems().size());
            } catch (NumberFormatException e) {
            }

            response.sendRedirect("detail?pid=" + id_raw);

        }
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
