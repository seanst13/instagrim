/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uk.ac.dundee.computing.aec.instagrim.servlets;

import com.datastax.driver.core.Cluster;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uk.ac.dundee.computing.aec.instagrim.lib.CassandraHosts;
import uk.ac.dundee.computing.aec.instagrim.models.User;
import uk.ac.dundee.computing.aec.instagrim.stores.*;

/**
 *
 * @author seans
 */
@WebServlet(name = "Update", urlPatterns = {"/Update"})
public class Update extends HttpServlet {
        Cluster cluster=null;
    public void init(ServletConfig config) throws ServletException {
        // TODO Auto-generated method stub
        cluster = CassandraHosts.getCluster();
    }

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateDetails</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateDetails at " + request.getContextPath() + "</h1>");
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
        RequestDispatcher rd=request.getRequestDispatcher("update.jsp");
	rd.forward(request,response);
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
        
        User us=new User();
        us.setCluster(cluster);
       
        HttpSession session=request.getSession();
        ProfileInfo pi =(ProfileInfo)session.getAttribute("ProfileInfo");
        
        String username=request.getParameter("username");
        String first_name = request.getParameter("forename");
        String last_name = request.getParameter("surname");
        String email = request.getParameter("email");
        
        username = username.toLowerCase();
        
        
        
        System.out.println(pi.getFirst_name());
        System.out.println(pi.getLast_name());
        System.out.println(pi.getEmail());
        
        
        
        //Reset the picid so that it is not refreshed when updating
        java.util.UUID picid = us.getProfilePicUUID(username);
        
        //If any of the fields for the input are empty, retain their current values.
        if(first_name.isEmpty()){
            first_name=pi.getFirst_name();
        }
        if(last_name.isEmpty()){
            last_name=pi.getLast_name();
        }
        if(email.isEmpty()){
            email=pi.getEmail();
        }
            
        //Update the DB with the details
        us.updateUser(username, first_name, last_name, email);
        
        //Update the ProfileInfo stores with the details
        pi.update(first_name, last_name, email); //This method just does all the set methods
        pi.setProfilePic(picid);
        
        //Set the session attributes again. 
        request.setAttribute("ProfileInfo", pi);
        session.setAttribute("ProfileInfo", pi);
        
        
	RequestDispatcher rd = request.getRequestDispatcher("profile.jsp");
        rd.forward(request, response);
        
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
