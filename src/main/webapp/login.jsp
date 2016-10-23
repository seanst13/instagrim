<%-- 
    Document   : login.jsp
    Created on : Sep 28, 2014, 12:04:14 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Instagrim</title>
        <link rel="stylesheet" type="text/css" href="/Instagrim/Styles.css" />

    </head>
    <body>
        <div id="header">
        <h1>InstaGrim! </h1>
        <h2>Your world in Black and White</h2>
        </div>
        <div>
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
                <li><a href="/Instagrim/Images/<%=lg.getUsername()%>">Your Images</a></li>
                <li style ="float: right"><a href="LogOut" method="GET">Log Out</a></li>
                    <%}
                            }else{
                                %>
                 <li id = "menu"><a href="/Instagrim/Register">Register</a></li>
                <li id = "menu"><a href="/Instagrim/Login"  class ="active">Login</a></li>
                <%
                                        
                            
                    }%>
            </ul>
        </div>
       
        <article id="content" class ="contentproperties">
            <div class = "contentbox">
            <h3>Login</h3>
            <form method="POST"  action="/Instagrim/Login">
                <ul>
                    <h2 style="font-size: large; color: red; text-align: center;">${LoginError}</h2>
                        <p>User Name</p> 
                        <input type="text" name="username">
                        <p>Password</p> 
                        <input type="password" name="password">
                <br/>
                <input type="submit" value="Login">
                </ul>
            </form>
            </div>
        </article>
        <footer>
            <ul>
                <li class ="footer">&COPY; Andy C & Sean Stewart</li>
            </ul>
        </footer>
    </body>
</html>
