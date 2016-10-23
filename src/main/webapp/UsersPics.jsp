<%-- 
    Document   : UsersPics
    Created on : Sep 24, 2014, 2:52:48 PM
    Author     : Administrator
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
                <li><a href="/Instagrim/Profile/<%=lg.getUsername()%>">Profile</a></li>
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
            <h3>Your Pics</h3>
            <ul>   
        <%
            java.util.LinkedList<Pic> lsPics = (java.util.LinkedList<Pic>) request.getAttribute("Pics");
            if (lsPics == null) {
        %>
        <p>No Pictures found</p>
        <%
        } else {
            Iterator<Pic> iterator;
            iterator = lsPics.iterator();
            while (iterator.hasNext()) {
                Pic p = (Pic) iterator.next();

        %>
        
        <a href="/Instagrim/Comments/<%=p.getSUUID()%>" ><img style="display:block" src="/Instagrim/Thumb/<%=p.getSUUID()%>"></a><br>

        <%

            }
            }
        %>
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
