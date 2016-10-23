<%-- 
    Document   : profile
    Created on : 29-Sep-2016, 15:50:22
    Author     : seans
--%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>InstaGrim</title>
        <link rel="stylesheet" type="text/css" href="/Instagrim/Styles.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        
        <div id ="header">
            <h1>InstaGrim ! </h1>
            <h2>Your world in Black and White</h2>
        </div>
        <div >
            <ul id="navbar"> 
                <li> <a href ="/Instagrim">Home</a> 
                <li><a href="/Instagrim/Upload">Upload</a></li>
                    <%
                        
                        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
                        GuestProfileInfo gi = (GuestProfileInfo)session.getAttribute("GuestInfo");
                        if (lg != null) {
                            String UserName = lg.getUsername();
                            if (lg.getlogedin()) {
                    %>
                <li><a href="/Instagrim/Profile/<%=lg.getUsername()%>" class="active" >Profile</a></li>
                <li><a href="/Instagrim/Images/<%=lg.getUsername()%>">Your Images</a></li>
                <li style ="float: right"><a href="/Instagrim/LogOut" method="GET">Log Out</a></li>
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
                    <h3> Profile</h3> 
                    <ul>
                        <% 
                        if (lg!=null){%>
                        <span style="float: right"> <a href="/Instagrim/Comments/<%=gi.getProfilePic()%>" ><img style="display:inline" src="/Instagrim/Thumb/<%=gi.getProfilePic()%>"></a></span>
                        <p><b>Username:</b> <%=gi.getUsername()%></p>
                        <p><b>Name:</b> <%=gi.getFirst_name()%> <%=gi.getLast_name()%></p>
                        <p><b>Email Address:</b> <%=gi.getEmail()%></p>
                        
 
                            <br><br><br>
 
                   
                        <%} else if(lg == null){
                        %>
                        <p>You cannot view the profile of a user without being logged in.</p> <% } %>                   
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
