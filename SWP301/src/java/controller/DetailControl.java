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
import model.Category;
import model.FeedBack;
import model.Product;
import model.Type;
import model.User;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "DetailControl", urlPatterns = {"/detail"})
public class DetailControl extends HttpServlet {

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
            out.println("<title>Servlet DetailControl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DetailControl at " + request.getContextPath() + "</h1>");
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
        String pid = request.getParameter("pid");
        String xd = request.getParameter("xd");
        if (xd == null) {

        } else {
            request.setAttribute("xd", xd);
        }
        int id = Integer.parseInt(pid);
        DAO d = new DAO();
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("acc");
        if (u != null) {

            List<Product> sanPhamDaXem = d.sanPhamDaXem(u.getuId());
            if (sanPhamDaXem.size() == 0) {
                d.insertSanPhamDaXem(u.getuId(), id);
            } else {
                int n = 0;
                for (Product product : sanPhamDaXem) {
                    if (product.getpId() == id) {
                        n++;
                        break;
                    }

                }
                if (n == 0) {
                    d.insertSanPhamDaXem(u.getuId(), id);
                }
            }

        }

        Product p = d.getProductByID(id);
        String type = d.getTypebyPID(id);
        // truyen feedback sang detail jsp
        List<Type> list3 = d.getAllType();
        request.setAttribute("type", list3);
        //List<Size> sizes =d.getAllSizeById(id);
        List<Product> list4 = d.get4Product();
        int star = d.getStar(id);
        request.setAttribute("star", star);
        // request.setAttribute("sizes", sizes);
        request.setAttribute("list4", list4);
        List<FeedBack> feedbacks = d.getFBbyPID(id);

        request.setAttribute("feedbacks", feedbacks);
        request.setAttribute("type1", type);
        request.setAttribute("product", p);
        List<Category> list2 = d.getAllCat();
        request.setAttribute("cate", list2);
        request.getRequestDispatcher("detail.jsp").forward(request, response);
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
