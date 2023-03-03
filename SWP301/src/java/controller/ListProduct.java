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
import model.Category;
import model.Item;
import model.Product;
import model.Type;
import model.User;

/**
 *
 * @author Dell
 */
@WebServlet(name = "ListProduct", urlPatterns = {"/listproduct"})
public class ListProduct extends HttpServlet {

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
            out.println("<title>Servlet ListProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ListProduct at " + request.getContextPath() + "</h1>");
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
        String indexPage = request.getParameter("index");
        if (indexPage == null) {
            indexPage = "1";
        }
        int index = Integer.parseInt(indexPage);

        List<Product> list1 = d.pagingProduct(index);
<<<<<<< HEAD

=======
        String most = request.getParameter("most");
        
        
        
>>>>>>> main
        String cat1 = request.getParameter("cat1");
        if (cat1 != null) {
            try {
                int cid = Integer.parseInt(cat1);
                list1 = d.getAllProductByCat(cid);
                request.setAttribute("product", list1);
            } catch (NumberFormatException e) {
            }

        }
        String type = request.getParameter("type");
        if (type != null) {
            try {
                int tid = Integer.parseInt(type);
                list1 = d.getAllProductByType(tid);
                request.setAttribute("product", list1);
            } catch (NumberFormatException e) {
            }

        }

        ///search
        String find = request.getParameter("find");
        request.setAttribute("find", find);
        //gui ve front end
        List<Category> list2 = d.getAllCat();
        List<Type> list3 = d.getAllType();
        //gui ve front end

        if (find == null) {

        } else {
            list1 = d.search(find);
            request.setAttribute("find", find);
            request.setAttribute("product", list1);

        }
        //moi trang web chia san pham ra la 12
        int count = d.getTotalProduct();
        int endPage = count / 12;
        if (count % 12 != 0) {
            endPage++;
        }

        List<Product> list = d.getAllProd();
        Cookie[] arr = request.getCookies();
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("acc");
        if (u != null) {
            String cart1 = "cart" + u.getuId();
            String txt = "";
            if (arr != null) {
                for (Cookie o : arr) {
                    if (o.getName().equals(cart1)) {
                        txt += o.getValue();
                    }
                }
            }
            Cart cart = new Cart(txt, list);
            List<Item> listItem = cart.getItems();
            int n;
            if (listItem != null) {
                n = listItem.size();
            } else {
                n = 0;
            }
            request.setAttribute("size", n);
        }

        request.setAttribute("endP", endPage);
        request.setAttribute("tagw", index);

        request.setAttribute("cate", list2);
        request.setAttribute("product", list1);
        request.setAttribute("type", list3);
        // request.getRequestDispatcher("menu.jsp").forward(request, response);

        request.getRequestDispatcher("index.jsp").forward(request, response);
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
