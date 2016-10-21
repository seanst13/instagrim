<%-- 
    Document   : comments
    Created on : 19-Oct-2016, 22:07:10
    Author     : seans
--%>

<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>InstaGrim</title>
        <link rel="stylesheet" type="text/css" href="/Instagrim/Styles.css" />
    </head>
    <body>
      <div id ="header">
            <h1 id="main">InstaGrim ! </h1>
            <h2 id="main" >Your world in Black and White</h2>
        </div>
        <div >
            <ul id="navbar"> 
                <li> <a href ="/Instagrim">Home</a> 
                <li><a href="/Instagrim/Upload">Upload</a></li>
                    <%
                        
                        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
                        ProfileInfo pi = (ProfileInfo) session.getAttribute("ProfileInfo");
                        if (lg != null) {
                            String UserName = lg.getUsername();
                            if (lg.getlogedin()) {
                    %>
                <li><a href="/Instagrim/Profile">Profile</a></li>
                <li><a href="/Instagrim/Images/<%=lg.getUsername()%>" class ="active">Your Images</a></li>
                <li style ="float: right"><a href="LogOut" method="GET">Log Out</a></li>
                    <%}
                            }else{
                                %>
                 <li id = "menu"><a href="/Instagrim/Register">Register</a></li>
                <li id = "menu"><a href="/Instagrim/Login" method ="GET">Login</a></li>
                <%
                                        
                            
                    }%>
            </ul>
        </div>    
        <article id="content" class ="contentproperties">
            <div class ="contentbox">
            <h3>Image</h3>
            <ul>   
                
              THE IMAGE WILL DISPLAY HERE WHEN IT WORKS .... Hopefully
              <img src ="/Instagrim/Thumb/${ImageID}">
                
                
                
                
                
                
        <%
            java.util.LinkedList<UserComments> lsComments = (java.util.LinkedList<UserComments>) request.getAttribute("Comments");
            if (lsComments.isEmpty()) {
        %>
        <p>No Comments found</p>
        <%
        } else {
            Iterator<UserComments> iterator;
            iterator = lsComments.iterator();
            while (iterator.hasNext()) {
                UserComments c = (UserComments) iterator.next();

        %>
        <h4><% c.getUser(); %> Says: </h4>
        <p><%c.getComment();%></p>
        <hr> 
        <br>
     
        <%

            }
            }
        %>
        
        <form method="POST"  action="/Instagrim/Comments">
            <h3>Post a Comment:</h3>
            <input type ="text" name="comment">
            <input type="hidden" name="PicID" value ="${ImageID}">
            <br>
            <input type="submit" name="Post Comment"> 
        </form>
        
        
        
        
        
        
        
            </ul>
            </div>
        </article>
        <footer>
            <ul>
                <li class="footer"><a href="/Instagrim">Home</a></li>
            </ul>
        </footer>
    </body>
</html