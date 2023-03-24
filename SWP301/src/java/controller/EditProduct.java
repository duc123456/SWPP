/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import static controller.AddProduct.SAVE_DIRECTORY;
import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import model.Product;
import model.ProductLog;
import model.User;

/**
 *
 * @author nhant
 */
@WebServlet(name = "EditProduct", urlPatterns = {"/editproduct"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB

public class EditProduct extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public static final String SAVE_DIRECTORY = "ProductImage";

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
            out.println("<title>Servlet EditProduct2</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditProduct2 at " + request.getContextPath() + "</h1>");
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
        request.setCharacterEncoding("UTF-8");
        String pid = request.getParameter("pid");
        String xd = request.getParameter("xd");
        DAO dao = new DAO();
        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat();
        simpleDateFormat.applyPattern("yyyy-MM-dd");
        String format = simpleDateFormat.format(date);
        if (xd != null && xd.equals("1")) {
            Product p = dao.getProductByID(Integer.parseInt(pid));
            String pquantity = request.getParameter("quantity");
            int quantity = p.getQuantity() + Integer.parseInt(pquantity);
            p.setQuantity(quantity);

            dao.updateQuantity(p);

            String pprice = request.getParameter("price");


            ProductLog pl = new ProductLog();
            HttpSession session = request.getSession();
            User a = (User) session.getAttribute("acc");
            pl.setUser(a);
            pl.setProduct(p);
            pl.setAction(4);
            pl.setPriceIn(Integer.parseInt(pprice));
            pl.setQuantity(Integer.parseInt(pquantity));
            pl.setDate(format);
            dao.addProductLog(pl);
        } else if (xd == null || xd.equals("")) {

            String paddby = request.getParameter("addby");
            String pcatid = request.getParameter("catid");
            String pprice = request.getParameter("price");
            String pname = request.getParameter("pname");
            String pcolor = request.getParameter("color");
            String pdescription = request.getParameter("description");
            String presolution = request.getParameter("resolution");
            String pinsurance = request.getParameter("insurance");

            String ptid = request.getParameter("tid");
            String pimage = request.getParameter("file");
            String psize = request.getParameter("size");
            String pquantity = request.getParameter("quantity");
            String pdiscount = request.getParameter("discount");
            String ppriceout = request.getParameter("priceout");
            HttpSession session = request.getSession();
            User a = (User) session.getAttribute("acc");

            String appPath = request.getServletContext().getRealPath("");
            appPath = appPath.replace('\\', '/');

            // Thư mục để save file tải lên.
            
            String fullSavePath = null;
            if (appPath.endsWith("/")) {
                fullSavePath = appPath + SAVE_DIRECTORY;
            } else {
                fullSavePath = appPath + "/" + SAVE_DIRECTORY;
            }

            // Tạo thư mục nếu nó không tồn tại.
            File fileSaveDir = new File(fullSavePath);
            if (!fileSaveDir.exists()) {
                fileSaveDir.mkdir();
            }

            // Danh mục các phần đã upload lên (Có thể là nhiều file).
            for (Part part : request.getParts()) {
                if (part.getName().equals("file")) {
                    if (part.getSubmittedFileName() != null ) {
                        String fileName = "product" + pid + (int) (Math.random() * 100000000) + ".jpg";

                        if (fileName != null && fileName.length() > 0) {
                            String filePath = fullSavePath + File.separator + fileName;
                            part.write(filePath);
                            dao.editProduct(pcatid, pprice, pname, pcolor, pdescription, presolution, pinsurance, format, ptid, fileName, psize, pquantity, pdiscount, ppriceout, Integer.parseInt(pid));
                        }
                       
                    

                     if(pimage == null){
                        Product p = dao.getProductByID(Integer.parseInt(pid));
             dao.editProduct(pcatid, pprice, pname, pcolor, pdescription, presolution, pinsurance, format, ptid, p.getImageDf() , psize, pquantity, pdiscount, ppriceout, Integer.parseInt(pid));

                    }
                            

                    // Thư mục để save file tải lên.
                }}}

            
            // dao.editProduct(pcatid, pprice, pname, pcolor, pdescription, presolution, pinsurance, format, ptid, pimage, psize, pquantity, pdiscount, ppriceout, Integer.parseInt(pid));

            ProductLog pl = new ProductLog();

            pl.setUser(a);
            pl.setProduct(dao.getProductByID(Integer.parseInt(pid)));
            pl.setAction(2);
            pl.setPriceOut(Integer.parseInt(ppriceout));

            pl.setDate(format);
            dao.addProductLog(pl);


        }
        

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
