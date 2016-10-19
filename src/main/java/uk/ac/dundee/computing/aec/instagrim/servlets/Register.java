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
@WebServlet(name = "Register", urlPatterns = {"/Register"})
public class Register extends HttpServlet {
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
        String password1 = request.getParameter("password1");
        String first_name = request.getParameter("forename");
        String last_name = request.getParameter("surname");
        String email = request.getParameter("email");
        
        HttpSession session=request.getSession();
        session.setAttribute("error", "" ); 
        username.toLowerCase();
        
//        if (username.length() <=16){
//            
//            
//            
//            }
        
        User us=new User();
        us.setCluster(cluster);
        if (us.IsUsernameTaken(username) == true){            
            if(us.passwordCheck(password, password1) == true){
                us.RegisterUser(username, password, first_name, last_name, email);
                response.sendRedirect("/Instagrim");
            } else { 

                
                request.setAttribute("error", "ERROR: Passwords don't Match!"); 
                session.setAttribute("error", "ERROR: Passwords don't Match!");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            
            }
            
        } else {
        
           
            request.setAttribute("error", "ERROR: Username is already in use!"); 
            session.setAttribute("error", "ERROR: Username is already in use!");
            request.getRequestDispatcher("register.jsp").forward(request, response);

        
        }
        
	
        
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        session.setAttribute("error", "" ); 
        RequestDispatcher rd=request.getRequestDispatcher("register.jsp");
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
