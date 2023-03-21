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
import model.OrderLog;
import model.Product;
import model.User;

/**
 *
 * @author nhant
 */
@WebServlet(name = "LoginControl", urlPatterns = {"/login"})
public class LoginControl extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("login.jsp").forward(request, response);

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

        String username = request.getParameter("user");
        String password = request.getParameter("pass");

        DAO dao = new DAO();
        User a = dao.login(username, password);
        if (a == null) {
            String ms = "Sai tài khoản hoặc mật khẩu!";
            request.setAttribute("ms", ms);
//            PrintWriter out = response.getWriter();
//            out.println("sadasd");
            request.getRequestDispatcher("login.jsp").forward(request, response);

        } else if (a.getRoleId() == 2) {

            HttpSession session = request.getSession();
            session.setAttribute("acc", a);

            List<Product> list = dao.getAllProd();
            // List<Category> listC = dao.getAllCategory();

            int productList = dao.getProductCount();
            request.setAttribute("numberOfProducts", productList);

            int productListIn = dao.getProductCountInurance();
            request.setAttribute("ProductInsurance", productListIn);

            int productListSum = dao.getProductCountQuantity();
            request.setAttribute("ProductSum", productListSum);

            request.setAttribute("listP", list);
            request.getRequestDispatcher("ManagerProduct.jsp").forward(request, response);
        } else if (a.getRoleId() == 3) {

            HttpSession session = request.getSession();
            session.setAttribute("acc", a);

            List<OrderLog> list = dao.getAllOrderLog();

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
        } else if (a.getRoleId() == 4) {
            String role = request.getParameter("role");
            List<User> list = null;
            if (role == null || role.equalsIgnoreCase("0")) {
                role = "0";
                list = dao.getAllUser();
            } else {
                int role_ = Integer.parseInt(role);
                list = dao.getUserbyRole(role_);
            }
            request.setAttribute("role", role);
            int numberOfUser = list.size();
            request.setAttribute(role, dao);

            request.setAttribute("users", list);
            request.setAttribute("total", numberOfUser);
            request.getRequestDispatcher("user.jsp").forward(request, response);
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("acc", a);
            session.removeAttribute("cart");

            Cookie[] cookie = request.getCookies();
            String cart = "cart" + a.getuId();
            if (cookie != null) {
                for (Cookie o : cookie) {
                    if (o.getName().equals(cart)) {
                        String txt = o.getValue();
                        Cart c = new Cart(txt);
                        session.setAttribute("cart", c);
                        session.setAttribute("size", c.getItems().size());
                    }
                }
                response.sendRedirect("listproduct");

            }
        }
        //// request.getRequestDispatcher("home").forward(request, response);

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
