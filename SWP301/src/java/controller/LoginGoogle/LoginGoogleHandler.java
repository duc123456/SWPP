/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.LoginGoogle;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import controller.LoginGoogle.Constants;
import controller.LoginGoogle.UserGoogleDTO;
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
import model.User;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;

/**
 *
 * @author ADMIN
 */
@WebServlet(name="LoginGoogleHandler", urlPatterns={"/logingg"})
public class LoginGoogleHandler extends HttpServlet {
   
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
    
        String code  = request.getParameter("code");
        
        String accessToken = getToken(code);
        
        
        UserGoogleDTO   user = getUserInfo(accessToken);
        DAO d= new DAO();
        User u = d.checkUsername(user.getId());
        if(u == null){
            Date date = new Date();
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat();
            simpleDateFormat.applyPattern("yyyy-MM-dd");
            String format = simpleDateFormat.format(date);
            d.register(1,  user.getGiven_name(),user.getFamily_name(), user.getId(), null, null, null, null, true , null, null, format, format);
            HttpSession session = request.getSession();
            User a = d.checkUsername(user.getId());
            session.setAttribute("acc", a);
            response.sendRedirect("index.jsp");
        }else{
            HttpSession session = request.getSession();
            session.setAttribute("acc", u);
            response.sendRedirect("index.jsp");
        }
    } 
    // khi dang nhap gg thi se co code gui ve
    
    public static String getToken(String code) throws ClientProtocolException, IOException {// su gung code do de gui 
        // lai cho gg de lay access token
		// call api to get token
		String response = Request.Post(Constants.GOOGLE_LINK_GET_TOKEN)
				.bodyForm(Form.form().add("client_id", Constants.GOOGLE_CLIENT_ID)
						.add("client_secret", Constants.GOOGLE_CLIENT_SECRET)
						.add("redirect_uri", Constants.GOOGLE_REDIRECT_URI).add("code", code)
						.add("grant_type", Constants.GOOGLE_GRANT_TYPE).build())
				.execute().returnContent().asString();
                // json la kieu cua cua trang web  khi tra text ve
		
                JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
                // loai bo may cai ki tu thua
		String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
		return accessToken;
	}
        // su dung access token de gui request moi
        // de gg gui du lieu nguoi dung
	public static UserGoogleDTO getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
		String link = Constants.GOOGLE_LINK_GET_USER_INFO + accessToken;
		String response = Request.Get(link).execute().returnContent().asString();

		UserGoogleDTO googlePojo = new Gson().fromJson(response, UserGoogleDTO.class);

		return googlePojo; // thong tin nguoi dung
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
