<%-- 
    Document   : index
    Created on : Sep 28, 2014, 7:01:44 PM
    Author     : Administrator
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>InstaGrim</title>
        <link rel="stylesheet" type="text/css" href="Styles.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        
        <div id ="header">
            <h1>InstaGrim ! </h1>
            <h2>Your world in Black and White</h2>
        </div>
        <div >
            <ul id="navbar"> 
                <li> <a class ="active" href ="/Instagrim">Home</a> 
                <li><a href="/Instagrim/Upload">Upload</a></li>
                    <%
                        
                        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
                        ProfileInfo pi = (ProfileInfo) session.getAttribute("ProfileInfo");
                        if (lg != null) {
                            String UserName = lg.getUsername();
                            if (lg.getlogedin()) {
                    %>
                <li><a href="/Instagrim/Profile/<%=lg.getUsername()%>" >Profile</a></li>
                <li><a href="/Instagrim/Images/<%=lg.getUsername()%>">Your Images</a></li>
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
            <div id ="content" class = "contentproperties">
                <div class ="contentbox">
                    <h3>Welcome to InstaGrim!</h3>
                    <ul>
                        <% 
                        if (lg!=null){%>
                            Welcome to Instagrim, <%=pi.getFirst_name()%> <%=pi.getLast_name()%>
                            <br>
                        <%}
                        %>
                        
                        
                        <p>This is some test text</p>
                    
                    
                    
                    
                    
                    </ul>
                </div>
                
                </div>
        <footer>
            <ul>
                <li class ="footer">&COPY; Andy C & Sean Stewart</li>
            </ul>
        </footer>
    </body>
</html>
