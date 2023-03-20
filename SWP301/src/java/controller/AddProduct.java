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
import java.text.SimpleDateFormat;
import java.util.Date;
import model.ProductLog;
import model.User;

/**
 *
 * @author nhant
 */
@WebServlet(name = "AddProduct", urlPatterns = {"/addproduct"})
public class AddProduct extends HttpServlet {

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
            out.println("<title>Servlet AddProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddProduct at " + request.getContextPath() + "</h1>");
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
        //add product  theo thu tu name, image, price, title ,,.. 
        String paddby = request.getParameter("addby");
        String pcatid = request.getParameter("catid");
        String pprice = request.getParameter("price");
        String pname = request.getParameter("name");
        String pcolor = request.getParameter("color");
        String pdescription = request.getParameter("description");
        String presolution = request.getParameter("resolution");
        String pinsurance = request.getParameter("insurance");
        DAO dao = new DAO();
        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat();
        simpleDateFormat.applyPattern("yyyy-MM-dd");
        String format = simpleDateFormat.format(date);

        String ptid = request.getParameter("tid");
        String pimage = request.getParameter("image");
        String psize = request.getParameter("size");
        String pquantity = request.getParameter("quantity");
        String pdiscount = request.getParameter("discount");
        String ppriceout = request.getParameter("priceout");
        
        HttpSession session = request.getSession();
        User a = (User) session.getAttribute("acc");
       dao.insertProduct(a.getuId(), pcatid, pprice, pname, pcolor, pdescription, presolution, pinsurance, format, ptid, pimage, psize, pquantity, pdiscount, ppriceout);
        /// Add ProductLog ///
        ProductLog pl = new ProductLog();
        pl.setUser(a);
        pl.setProduct(dao.getProductNewMost());
        pl.setAction(1);
        pl.setPriceIn(Integer.parseInt(pprice));
        pl.setPriceOut(Integer.parseInt(ppriceout));
        pl.setQuantity(Integer.parseInt(pquantity));
        pl.setDate(format);
        dao.addProductLog(pl);
        
        
        
        
        
        response.sendRedirect("managerProduct");
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
