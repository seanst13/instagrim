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
 * @author Administrator
 */
@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {

    Cluster cluster=null;


    public void init(ServletConfig config) throws ServletException {
        // TODO Auto-generated method stub
        cluster = CassandraHosts.getCluster();
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
        
        
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        
        //Convert the username to lowercase
        username = username.toLowerCase();
        
        
        User us=new User();
        us.setCluster(cluster);
        
        HttpSession session=request.getSession();
        session.setAttribute("LoginError", "");
        
        
        //Input validation for empty fields
        if(username.isEmpty()){
            request.setAttribute("LoginError", "ERROR: Username must contain a value!"); 
            session.setAttribute("LoginError", "ERROR: Username must contain a value!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } 
        if(password.isEmpty()){
            request.setAttribute("LoginError", "ERROR: Passwords must contain a value!"); 
            session.setAttribute("LoginError", "ERROR: Passwords must contain a value!");
            request.getRequestDispatcher("login.jsp").forward(request, response);   
        }
        
        boolean isValid=us.IsValidUser(username, password);
        
        System.out.println("Session in servlet "+session);
        
        if (isValid){
            LoggedIn lg= new LoggedIn();
            lg.setLogedin();
            lg.setUsername(username);
            request.setAttribute("LoggedIn", lg);            
            session.setAttribute("LoggedIn", lg);
            System.out.println("Session in servlet "+session);
            
            
            //Retrieve the forename, surname, email address and profile picture uuid from the DB
            //And apply them to the ProfileInfo store
            ProfileInfo profileInfo = new ProfileInfo();
            profileInfo.setFirst_name(us.getUserInformation(username)[0]);
            profileInfo.setLast_name(us.getUserInformation(username)[1]);
            profileInfo.setEmail(us.getUserInformation(username)[2]);
            profileInfo.setProfilePic(us.getProfilePicUUID(username));
            
            
            session.setAttribute("ProfileInfo", profileInfo);
            
            
            
            
            RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
	    rd.forward(request,response);
            
        }else{
            
            RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
	    rd.forward(request,response);
        }
        
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        session.setAttribute("LoginError", ""); //Reset the display errors for input validation.
        RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
	rd.forward(request,response);
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
