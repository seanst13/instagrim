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
            <h1 id="main">InstaGrim ! </h1>
            <h2 id="main" >Your world in Black and White</h2>
        </div>
        <div >
            <ul id="navbar"> 
                <li> <a class ="active" href ="index.jsp">Home</a> 
                <li id = "menu"><a href="upload.jsp">Upload</a></li>
                    <%
                        
                        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
                        if (lg != null) {
                            String UserName = lg.getUsername();
                            if (lg.getlogedin()) {
                    %>

                <li id = "menu"><a href="/Instagrim/Images/<%=lg.getUsername()%>">Your Images</a></li>
                <li id="menu" style ="float: right"><a href="/profile">Log Out</a></li>
                    <%}
                            }else{
                                %>
                 <li id = "menu"><a href="register.jsp">Register</a></li>
                <li id = "menu"><a href="login.jsp">Login</a></li>
                <%
                                        
                            
                    }%>
            </ul>
        </div>
            <div id ="content">This is some test text</div>
        <footer style ="bottom: 0">
            <ul>
                <li class ="footer">&COPY; Andy C & Sean Stewart</li>
            </ul>
        </footer>
    </body>
</html>
