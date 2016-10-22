/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uk.ac.dundee.computing.aec.instagrim.servlets;

import com.datastax.driver.core.Cluster;
import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;
import uk.ac.dundee.computing.aec.instagrim.lib.CassandraHosts;
import uk.ac.dundee.computing.aec.instagrim.lib.Convertors;
import uk.ac.dundee.computing.aec.instagrim.models.PicModel;
import uk.ac.dundee.computing.aec.instagrim.models.User;
import uk.ac.dundee.computing.aec.instagrim.stores.LoggedIn;
import uk.ac.dundee.computing.aec.instagrim.stores.*;

/**
 *
 * @author seans
 */
@WebServlet(name = "Comments", urlPatterns = {"/Comments/*", "/Comments"})
public class Comments extends HttpServlet {
    private Cluster cluster;

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
            out.println("<title>Servlet Comments</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Comments at " + request.getContextPath() + "</h1>");
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
        
        String args[] = Convertors.SplitRequestPath(request);
        
        String UUID = args[2];
        System.out.println("THIS IS THE VALUE OF UUID:" + UUID);
        request.setAttribute("ImageID", UUID);
        
        java.util.UUID picid = null;
        picid = picid.fromString(UUID);
        System.out.println("THIS IS THE VALUE OF picid:" + picid);
        
        DisplayCommentsList(picid, request, response);
        
        
        RequestDispatcher rd=request.getRequestDispatcher("/comments.jsp");
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
        HttpSession session=request.getSession();
        
        
        String comment = request.getParameter("Comments");
        String username = request.getParameter("username");
       String imageid = request.getParameter("PicID");
       
       System.out.println("Value of Comment: " + comment);
       
       java.util.UUID picid = null;
       
       picid = picid.fromString(imageid);
       System.out.println("VALUE OF PICID: " + picid);
        
       
       PicModel tm = new PicModel();
       
       LoggedIn lg= (LoggedIn)session.getAttribute("LoggedIn");
       
       if (lg.getlogedin()){
                username=lg.getUsername();
            }
       
       request.setAttribute("ImageID", imageid);
       session.setAttribute("ImageID", imageid);
       
       
       tm.setCluster(cluster);
       tm.insertComments(username, comment, picid);
       DisplayCommentsList(picid, request, response);
        
        
        RequestDispatcher rd=request.getRequestDispatcher("comments.jsp");
	rd.forward(request,response);
//                  
    }

    
        private void DisplayCommentsList (java.util.UUID picid, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PicModel tm = new PicModel();
        tm.setCluster(cluster);
        System.out.println("PICID IN DISPLAYCOMMENTSLIST:" + picid);
        
        java.util.LinkedList<UserComments> lsComments = tm.getComments(picid);
        request.setAttribute("Comments", lsComments);
        request.setAttribute("ImageID", picid);
        RequestDispatcher rd = request.getRequestDispatcher("/comments.jsp");       
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
