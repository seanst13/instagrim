<%-- 
    Document   : upload
    Created on : Sep 22, 2014, 6:31:50 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Instagrim</title>
        <link rel="stylesheet" type="text/css" href="Styles.css" />
    </head>
    <body>
    <div id="header">    
        <h1>InstaGrim ! </h1>
        <h2>Your world in Black and White</h2>
    </div>
        <div>
            <ul id="navbar">
                <li> <a href ="/Instagrim">Home</a> 
                <li><a href="/Instagrim/Upload" class ="active">Upload</a></li>
                    <%
                        
                        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
                        ProfileInfo pi = (ProfileInfo) session.getAttribute("ProfileInfo");
                        if (lg != null) {
                            String UserName = lg.getUsername();
                            if (lg.getlogedin()) {
                    %>
                <li><a href="/Instagrim/Profile/<%=lg.getUsername()%>">Profile</a></li>
                <li><a href="/Instagrim/Images/<%=lg.getUsername()%>">Your Images</a></li>
                <li style ="float: right"><a href="LogOut" method="GET">Log Out</a></li>
                    <%}
                            }else{
                                %>
                 <li id = "menu"><a href="/Instagrim/Register">Register</a></li>
                <li id = "menu"><a href="/Instagrim/Login">Login</a></li>
                <%
                                        
                            
                    }%>
            </ul>
        </div>
 
        <article id="content" class="contentproperties">
            <div class="contentbox">
            <h3>File Upload</h3>
            <ul>
                <form method="POST" enctype="multipart/form-data" action="Image">
                File to upload: <input type="file" name="upfile"><br/>
                Filter for Image:
                  <input type="radio" name="filter" value="gray"> Grayscale Filter
                  <input type="radio" name="filter" value="dark"> Dark Filter
                  <input type="radio" name="filter" value="light"> Bright Filter
                  <input type="radio" name="filter" value="none"> No Filter<br>
                  
                <input type="hidden" name ="check" value="false">
                <br/>
                <input type="submit" value="Click to Upload File">
            </form> 
            </ul>
            </div>
        </article>
        <footer>
            <ul>
                <li class ="footer">&COPY; Andy C & Sean Stewart</li>
            </ul>
        </footer>
    </body>
</html>
