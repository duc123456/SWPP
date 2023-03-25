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
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import model.Data;
import model.Product;
import model.User;

/**
 *
 * @author Dell
 */
@WebServlet(name = "GoiYSanPham", urlPatterns = {"/goiysanpham"})
public class GoiYSanPham extends HttpServlet {

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
            out.println("<title>Servlet GoiYSanPham</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GoiYSanPham at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("acc");
        DAO d = new DAO();
         List<Product> list =  new ArrayList<>();
        if(u != null){
        List<Data> listData = d.xemData(u.getuId());
        List<Data> listDataOrder = d.xemDataOrder(u.getuId());
        if (listData != null && listDataOrder != null) {
            for (Data data : listDataOrder) {
                int i = 0;
                for (Data data1 : listData) {
                    if (data.getId() == data1.getId()) {
                        data1.setQuantity(data.getQuantity() + data1.getQuantity());
                        i++;
                    }
                }
                if (i == 0) {
                    listData.add(data);
                }

            }
        }
        
//        for (Data data : listData) {
//            System.out.println("" + d.getProductByID(data.getId()).getCat().getCid());
//        }

//        System.out.println("");

        // den day listdata 2 th : co hoac khong
        if (listData.size() != 0) {
            int m1 = d.getAllCat().size() + d.getAllType().size() + 8;

            int[][] productMatix = new int[listData.size()][m1];
            // den day productMatrix co roi
            // tao ma tran

            for (int i = 0; i < listData.size(); i++) {
                for (int j = 0; j < d.getAllCat().size(); j++) {

                    if (d.getProductByID(listData.get(i).getId()).getCat().getCid() == (j + 1)) {
                        productMatix[i][j] = 1 * listData.get(i).getQuantity();

                    } else {
                        productMatix[i][j] = 0;
                    }

                }
                int m2 = d.getAllCat().size() + d.getAllType().size();
                int t = 0;
                for (int j = d.getAllCat().size(); j < m2; j++) {
                    if (d.getProductByID(listData.get(i).getId()).getType().gettId() == (t + 1)) {
                        productMatix[i][j] = 1 * listData.get(i).getQuantity();

                    } else {
                        productMatix[i][j] = 0;
                    }
                    t++;
                }
                if (d.getProductByID(listData.get(i).getId()).getPriceOut() >= 3000000
                        && d.getProductByID(listData.get(i).getId()).getPriceOut() < 10000000) {
                    productMatix[i][m2] = 1 * listData.get(i).getQuantity();

                } else {
                    productMatix[i][m2] = 0;
                }
                m2++;
                if (d.getProductByID(listData.get(i).getId()).getPriceOut() >= 10000000
                        && d.getProductByID(listData.get(i).getId()).getPriceOut() < 25000000) {
                    productMatix[i][m2] = 1 * listData.get(i).getQuantity();

                } else {
                    productMatix[i][m2] = 0;
                }
                m2++;
                if (d.getProductByID(listData.get(i).getId()).getPriceOut() >= 25000000
                        && d.getProductByID(listData.get(i).getId()).getPriceOut() < 80000000) {
                    productMatix[i][m2] = 1 * listData.get(i).getQuantity();

                } else {
                    productMatix[i][m2] = 0;
                }
                m2++;
                if (d.getProductByID(listData.get(i).getId()).getPriceOut() >= 80000000
                        && d.getProductByID(listData.get(i).getId()).getPriceOut() < 125000000) {
                    productMatix[i][m2] = 1 * listData.get(i).getQuantity();

                } else {
                    productMatix[i][m2] = 0;
                }
                m2++;
                if (d.getProductByID(listData.get(i).getId()).getSize() >= 30
                        && d.getProductByID(listData.get(i).getId()).getSize() < 45) {
                    productMatix[i][m2] = 1 * listData.get(i).getQuantity();

                } else {
                    productMatix[i][m2] = 0;
                }
                m2++;
                if (d.getProductByID(listData.get(i).getId()).getSize() >= 45
                        && d.getProductByID(listData.get(i).getId()).getSize() < 60) {
                    productMatix[i][m2] = 1 * listData.get(i).getQuantity();

                } else {
                    productMatix[i][m2] = 0;
                }
                m2++;
                if (d.getProductByID(listData.get(i).getId()).getSize() >= 60
                        && d.getProductByID(listData.get(i).getId()).getSize() < 75) {
                    productMatix[i][m2] = 1 * listData.get(i).getQuantity();

                } else {
                    productMatix[i][m2] = 0;
                }
                m2++;
                if (d.getProductByID(listData.get(i).getId()).getSize() >= 75
                        && d.getProductByID(listData.get(i).getId()).getSize() < 90) {
                    productMatix[i][m2] = 1 * listData.get(i).getQuantity();

                } else {
                    productMatix[i][m2] = 0;
                }

            }
//            response.getWriter().print("" + m1);
//            response.getWriter().println(" " + listData.size());
//           response.getWriter().print("" + m1);
//            response.getWriter().println(" " + listData.size());

//            System.out.println("Ma tran de tinh do uu tien");
//            for (int i = 0; i < productMatix.length; i++) {
//                for (int j = 0; j < productMatix[i].length - 1; j++) {
//
//                    System.out.print("" + productMatix[i][j] + "  ");
//                }
//                System.out.println(productMatix[i][productMatix[i].length - 1]);
//
//            }
//              response.getWriter().println("Tai sao khong in duoc");
//            

            int[] userProfile = new int[m1];
////            response.getWriter().println(userProfile.length);
////            
//            System.out.println("");
//
            for (int i = 0; i < userProfile.length; i++) {
                int tong = 0;
                for (int j = 0; j < listData.size(); j++) {
                    tong = tong + productMatix[j][i];

                }
                userProfile[i] = tong;

            }
//
//            System.out.println("");
//
//            System.out.println("Mang tinh userProfile");
//            for (int i = 0; i < userProfile.length; i++) {
//                System.out.print("  " + userProfile[i]);
//
//            }
////
//           List<Product> listProduct = d.getAllProd();
//           int[][] allProductMatrix = new int[listProduct.size()][m1];
//            for (int i = 0; i < listProduct.size(); i++) {
//                for (int j = 0; j < d.getAllCat().size(); j++) {
//
//                    if (d.getProductByID(listProduct.get(i).getpId()).getCat().getCid() == (j + 1)) {
//                        allProductMatrix[i][j] =1;
//
//                    } else {
//                        allProductMatrix[i][j] =0;
//                    }
//
//                }
//            }
//            System.out.println("");
            List<Product> listProduct = d.getAllProd();
            // xu ly listProduct
            Iterator<Product> iter = listProduct.iterator();
            while (iter.hasNext()) {
                Product product = iter.next();
                for (Data data : listData) {
                    if (product.getpId() == data.getId()) {
                        iter.remove();
                        break;
                    }
                }
            }

//            for (int i = 0; i < d.getAllCat().size(); i++) {
//                for (int j = 0; j < listProduct.size(); j++) {
//
//                    if (d.getProductByID(listProduct.get(j).getpId()).getCat().getCid() == (i + 1)) {
//                        allProductMatrix[j][i] = 1 * userProfile[i];
//
//                    } else {
//                        allProductMatrix[j][i] = 0;
//                    }
//
//                }
//            }
            int[][] allProductMatrix = new int[listProduct.size()][m1];
            for (int i = 0; i < listProduct.size(); i++) {
                for (int j = 0; j < d.getAllCat().size(); j++) {

                    if (d.getProductByID(listProduct.get(i).getpId()).getCat().getCid() == (j + 1)) {
                        int t = userProfile[j];
                       allProductMatrix[i][j] = 1 * userProfile[j];

                    } else {
                        allProductMatrix[i][j] = 0;
                    }

                }
                int m2 = d.getAllCat().size() + d.getAllType().size();
                int t = 0;
                for (int j = d.getAllCat().size(); j < m2; j++) {
                    if (d.getProductByID(listProduct.get(i).getpId()).getType().gettId() == (t + 1)) {
                        allProductMatrix[i][j] = 1 * userProfile[m2 - d.getAllType().size() + t];

                    } else {
                        allProductMatrix[i][j] = 0;
                    }
                    t++;
                }
                if (d.getProductByID(listProduct.get(i).getpId()).getPriceOut() >= 3000000
                        && d.getProductByID(listProduct.get(i).getpId()).getPriceOut() < 10000000) {
                    allProductMatrix[i][m2] = 1 * userProfile[m2];

                } else {
                    allProductMatrix[i][m2] = 0;
                }
                m2++;
                if (d.getProductByID(listProduct.get(i).getpId()).getPriceOut() >= 10000000
                        && d.getProductByID(listProduct.get(i).getpId()).getPriceOut() < 25000000) {
                    allProductMatrix[i][m2] = 1 * userProfile[m2];

                } else {
                   allProductMatrix[i][m2] = 0;
                }
                m2++;
                if (d.getProductByID(listProduct.get(i).getpId()).getPriceOut() >= 25000000
                        && d.getProductByID(listProduct.get(i).getpId()).getPriceOut() < 80000000) {
                    allProductMatrix[i][m2] = 1 * userProfile[m2];

                } else {
                   allProductMatrix[i][m2] = 0;
                }
                m2++;
                if (d.getProductByID(listProduct.get(i).getpId()).getPriceOut() >= 80000000
                        && d.getProductByID(listProduct.get(i).getpId()).getPriceOut() < 125000000) {
                    allProductMatrix[i][m2] = 1 * userProfile[m2];

                } else {
                    allProductMatrix[i][m2] = 0;
                }
                m2++;
                if (d.getProductByID(listProduct.get(i).getpId()).getSize() >= 30
                        && d.getProductByID(listProduct.get(i).getpId()).getSize() < 45) {
                   allProductMatrix[i][m2] = 1 * userProfile[m2];

                } else {
                    allProductMatrix[i][m2] = 0;
                }
                m2++;
                if (d.getProductByID(listProduct.get(i).getpId()).getSize() >= 45
                        && d.getProductByID(listProduct.get(i).getpId()).getSize() < 60) {
                    allProductMatrix[i][m2] = 1 * userProfile[m2];

                } else {
                   allProductMatrix[i][m2] = 0;
                }
                m2++;
                if (d.getProductByID(listProduct.get(i).getpId()).getSize() >= 60
                        && d.getProductByID(listProduct.get(i).getpId()).getSize() < 75) {
                    allProductMatrix[i][m2] = 1 * userProfile[m2];

                } else {
                    allProductMatrix[i][m2] = 0;
                }
                m2++;
                if (d.getProductByID(listProduct.get(i).getpId()).getSize() >= 75
                        && d.getProductByID(listProduct.get(i).getpId()).getSize() < 90) {
                    allProductMatrix[i][m2] = 1 * userProfile[m2];

                } else {
                    allProductMatrix[i][m2] = 0;
                }
                m2++;

            }
//            for (int i = 0; i < allProductMatrix.length; i++) {
//                for (int j = 0; j < allProductMatrix[i].length - 1; j++) {
//
//                    System.out.print("" + allProductMatrix[i][j] + "  ");
//                }
//                System.out.println(allProductMatrix[i][allProductMatrix[1].length - 1]);
//
//            }
//            System.out.println("");
            Data[] productProfile = new Data[listProduct.size()];

            for (int j = 0; j < allProductMatrix.length; j++) {
                int tong = 0;
                for (int k = 0; k < allProductMatrix[j].length; k++) {
                    tong += allProductMatrix[j][k];

                }
                Data dt = new Data(listProduct.get(j).getpId(), tong);

                productProfile[j] = dt;

            }

            List<Data> listFinalData = new ArrayList<>();
            for (Data data : productProfile) {
                listFinalData.add(data);

            }
//            System.out.println(" list truoc cat" + listFinalData.size());
//            for (Data dt : listFinalData) {
//                System.out.println("" + dt.getId() + " " + dt.getQuantity());
//
//            }

            for (int i = 0; i < listFinalData.size(); i++) {
                if (listFinalData.get(i).getQuantity() == 0) {
                    listFinalData.remove(listFinalData.get(i));
                    i--;
                }

            }
//            System.out.println(" list sau cat" + listFinalData.size());
//
//            System.out.println("" + listFinalData.size());
            Collections.sort(listFinalData);

//            Collections.sort(listFinalData, new Comparator<Data>() {
//                @Override
//                public int compare(Data d1, Data d2) {
//                    // Your custom sorting logic here
//                    return d1.getQuantity().compareTo(d2.getQuantity());
//                }
//            });
//            for (Data dt : listFinalData) {
//                System.out.println("" + d.getProductByID(dt.getId()).getName() + dt.getId());
//
//            }

   
            for (Data dt : listFinalData) {
                Product p = d.getProductByID(dt.getId());
                list.add(p);
                
            }
    

        }}
        request.setAttribute("goiy", 1);
        request.setAttribute("product", list);
        request.getRequestDispatcher("index.jsp").forward(request, response);
        

        // tao mang trong so
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
