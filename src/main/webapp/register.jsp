<%-- 
    Document   : register.jsp
    Created on : Sep 28, 2014, 6:29:51 PM
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
                <li><a href="/Instagrim/Profile/<%=lg.getUsername()%>">Profile</a></li>
                <li><a href="/Instagrim/Images/<%=lg.getUsername()%>">Your Images</a></li>
                <li style ="float: right"><a href="LogOut" method="GET">Log Out</a></li>
                    <%}
                            }else{
                                %>
                 <li id = "menu"><a href="/Instagrim/Register" class ="active">Register</a></li>
                <li id = "menu"><a href="/Instagrim/Login" method ="GET">Login</a></li>
                <%
                                        
                            
                    }%>
            </ul>
        </div>
       
        <div id ="content" class ="contentproperties">
            <div class ="contentbox">
            <h3>Register as user</h3>
            
            <form method="POST"  action="Register">
                <ul>
                    <h4>Personal Details</h4>
                    <p>Forename</p>
                    <input type ="text" name="forename">
                    <p>Surname</p>
                    <input type ="text" name="surname">
                    <p>Email Address</p>
                    <input type ="text" name="email">
                    <h4>Account Details</h4>
                    <p>User Name</p>
                    <input type="text" name="username">
                    <p>Password</p>
                    <input type="password" name="password">
                <br/>
                <input type="submit" value="Register">
                </ul>
            </form>
            </div>

        </div>
        <footer>
            <ul>
                <li class ="footer">&COPY; Andy C & Sean Stewart</li>
            </ul>
        </footer>
    </body>
</html>
