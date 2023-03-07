/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.DAO;
import jakarta.servlet.RequestDispatcher;
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
import model.User;

/**
 *
 * @author Dell
 */

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
       maxFileSize = 1024 * 1024 * 10, // 10MB
       maxRequestSize = 1024 * 1024 * 50) // 50MB
@WebServlet(name="ChangeAvarta", urlPatterns={"/changeavarta"})
public class ChangeAvarta extends HttpServlet {
     private static final long serialVersionUID = 1L;

   public static final String SAVE_DIRECTORY = "uploadDir";
   
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
            out.println("<title>Servlet ChangeAvarta</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangeAvarta at " + request.getContextPath () + "</h1>");
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
        processRequest(request, response);
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
        try {

            HttpSession session = request.getSession();
            User u  = (User) session.getAttribute("acc");
           // Đường dẫn tuyệt đối tới thư mục gốc của web app.
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
           DAO d = new DAO();
 
           // Danh mục các phần đã upload lên (Có thể là nhiều file).
           for (Part part : request.getParts()) {
               String fileName = "avatar" + u.getuId() +(int)(Math.random()*100000000)+  ".jpg";
               if (fileName != null && fileName.length() > 0) {
                   String filePath = fullSavePath + File.separator + fileName;
                   System.out.println("Write attachment to file: " + filePath);
 
                   // Ghi vào file.
                  
                   part.write(filePath);
                   d.changAvarta(fileName,u.getuId() );
               }
           }
            
           // Upload thành công.
           response.sendRedirect("orderofuser");
       } catch (Exception e) {
           e.printStackTrace();
           request.setAttribute("errorMessage", "Error: " + e.getMessage());
           RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/jsps/editprofile.jsp");
           dispatcher.forward(request, response);
       }
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
