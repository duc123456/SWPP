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
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import model.Order;
import model.ProductLog;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "Export", urlPatterns = {"/export"})
public class Export extends HttpServlet {

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
            out.println("<title>Servlet Export</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Export at " + request.getContextPath() + "</h1>");
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
        HSSFWorkbook workbook = new HSSFWorkbook();
        Sheet sheet = workbook.createSheet("Sheet1");
        Row headerRow = sheet.createRow(0);
        Cell cell0 = headerRow.createCell(0);
        cell0.setCellValue("Column 1");
        Cell cell1 = headerRow.createCell(1);
        cell1.setCellValue("Column 2");
        Cell cell2 = headerRow.createCell(2);
        cell2.setCellValue("Column 3");
        Cell cell3 = headerRow.createCell(3);
        cell3.setCellValue("Column 4");
        Cell cell4 = headerRow.createCell(4);
        cell4.setCellValue("Column 5");
        
        String to = request.getParameter("to");
        String _xd = request.getParameter("xd");
        int xd = Integer.parseInt(_xd);
        String from = request.getParameter("from");
        if (from != null) {
            request.setAttribute("from", from);
        }
        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat();
        simpleDateFormat.applyPattern("yyyy-MM-dd");
        String now = simpleDateFormat.format(date);
        request.setAttribute("now", now);
        if (from != null && to == null) {
            request.setAttribute("from", from);
            request.setAttribute("to", now);
        }
        if (from != null && to != null) {
            request.setAttribute("from", from);
            request.setAttribute("to", to);
        }
        // create data rows
        DAO d = new DAO();
        if(xd == 1 ){
            List<Order> list = d.getAllOrder(from, now, to, "3");
        for (int i = 0; i < list.size(); i++) {

            Row row = sheet.createRow(i);
            Cell dataCell0 = row.createCell(0);
            if(list.get(i).getUser()==null){
                dataCell0.setCellValue(list.get(i).getGuest().getfName());
            }else {
                dataCell0.setCellValue(list.get(i).getUser().getfName());
            }
            Cell dataCell1 = row.createCell(1);
            dataCell1.setCellValue(list.get(i).getDate());
            Cell dataCell2 = row.createCell(2);
            dataCell2.setCellValue(list.get(i).getPhone());
            Cell dataCell3 = row.createCell(3);
            dataCell3.setCellValue(list.get(i).getTotalPrice());

        }
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-Disposition", "attachment; filename=\"OrderList.xls\"");

        // ghi workbook vào OutputStream
        OutputStream outputStream = response.getOutputStream();
        workbook.write(outputStream);
        outputStream.flush();
        outputStream.close();
        response.sendRedirect("dash");
        }else if (xd == 2){
            List<ProductLog> list = d.getLogAddProduct(from, to);
        for (int i = 0; i < list.size(); i++) {

            Row row = sheet.createRow(i);
            Cell dataCell0 = row.createCell(0);
            dataCell0.setCellValue(list.get(i).getProduct().getName());
            Cell dataCell1 = row.createCell(1);
            dataCell1.setCellValue(list.get(i).getPriceIn());
            Cell dataCell2 = row.createCell(2);
            dataCell2.setCellValue(list.get(i).getPriceOut());
            Cell dataCell3 = row.createCell(3);
            dataCell3.setCellValue(list.get(i).getQuantity());
            Cell dataCell4 = row.createCell(4);
            dataCell3.setCellValue(list.get(i).getDate());

        }
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-Disposition", "attachment; filename=\"LogProductList.xls\"");

        // ghi workbook vào OutputStream
        OutputStream outputStream = response.getOutputStream();
        workbook.write(outputStream);
        outputStream.flush();
        outputStream.close();
        response.sendRedirect("import");
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
