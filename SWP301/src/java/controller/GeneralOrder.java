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
import model.Order;
import model.OrderLog;
import model.Product;
import model.User;

/**
 *
 * @author Dell
 */
@WebServlet(name="GeneralOrder", urlPatterns={"/generalorder"})
public class GeneralOrder extends HttpServlet {
   
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
            out.println("<title>Servlet GeneralOrder</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GeneralOrder at " + request.getContextPath () + "</h1>");
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
       HttpSession session = request.getSession();
        DAO d = new DAO();
        User u = (User) session.getAttribute("acc");
     
        List<Order> list2 = d.getAllOrderByUID(u.getuId());
        int nDangXuLy = 0, nDaXacNhan =0, nDaNhan = 0, nDaHuy = 0;
        if(list2 != null){
            for (Order order : list2) {
            if(order.getStatus() == 1){
                nDangXuLy ++;
            }
            if(order.getStatus() == 2){
                nDaXacNhan ++;
            }
            if(order.getStatus() == 3){
                nDaNhan ++;
            }
            if(order.getStatus() == 4){
                nDaHuy ++;
            }
            
        }
        }
        List<Product> list4 = d.sanPhamDaXem(u.getuId());
        request.setAttribute("sanPhamDaXem", list4);
        request.setAttribute("soSanPhamDaXem", list4.size());
        List<OrderLog> list5 = d.getAllOrderLogByUser(u.getuId());
        int thongBao = 0;
        for (OrderLog orderLog : list5) {
            if(orderLog.getConfirm() == false)
                thongBao++;
        }
        ThanhNgang thanhNgang = new ThanhNgang();
        thanhNgang.doPost(request, response);
        request.setAttribute("thongBao", thongBao);
        request.setAttribute("xemThongBao", list5);
              
        
        request.setAttribute("DangXuLy", nDangXuLy);
        request.setAttribute("DaNhan", nDaNhan);
        request.setAttribute("DaXacNhan", nDaXacNhan);
        request.setAttribute("DaHuy", nDaHuy);
       
        request.setAttribute("orderByUId", list2);
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
        processRequest(request, response);
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
