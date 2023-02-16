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
import java.util.List;
import model.Category;
import model.Product;

/**
 *
 * @author Dell
 */
@WebServlet(name="SearchCheckBox", urlPatterns={"/searchproduct"})
public class SearchCheckBox extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SearchCheckBox</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchCheckBox at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       DAO d = new DAO();
       
        String[] cat_raw = request.getParameterValues("cat");
        String[] pri_raw = request.getParameterValues("pri");
        String[] size_raw = request.getParameterValues("size");
        if (cat_raw == null && pri_raw == null && size_raw == null) {
             response.sendRedirect("listproduct");
        } else {
            int[] pri = null;
            int[] size = null;
            int[] cat = null;
            if (pri_raw != null) {
                pri = new int[pri_raw.length * 2];
                int j = 0;
                for (int i = 0; i < pri_raw.length; i++) {
                    String[] preA = pri_raw[i].split(",");
                    try {
                        for (int k = 0; k < preA.length; k++) {
                            pri[j] = Integer.parseInt(preA[k]);
                            j++;

                        }
                    } catch (NumberFormatException e) {
                    }

                }
            }
            if (size_raw != null) {

                size = new int[size_raw.length * 2];
                int j = 0;
                for (int i = 0; i < size_raw.length; i++) {
                    String[] preS = size_raw[i].split(",");
                    try {
                        for (int k = 0; k < preS.length; k++) {
                            size[j] = Integer.parseInt(preS[k]);
                            j++;

                        }
                    } catch (NumberFormatException e) {
                    }

                }
            }
            if (cat_raw != null) {
                cat = new int[cat_raw.length];
                for (int i = 0; i < cat_raw.length; i++) {
                    try {
                        cat[i] = Integer.parseInt(cat_raw[i]);
                    } catch (NumberFormatException e) {
                    }

                }

            }
            List<Category> list2 = d.getAllCat();
            request.setAttribute("cate", list2);

            List<Product> list1 = d.searchCheckBox(cat, pri);
            request.setAttribute("product", list1);
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
       
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        

    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
