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
            <h3>Image</h3>
            <ul>   
              <img src ="/Instagrim/Thumb/${ImageID}">
            </ul>
            </div>
            <br><br>
            
            
            <div class="contentbox">
            <form method="POST"  action="/Instagrim/Comments">
                
                <h3>Post a Comment:</h3><ul>
            <input type ="text" name="Comments">
            <input type="hidden" name="PicID" value =${ImageID}>
            <br>
            <input type="submit" name="Post Comment"> </ul>
            </form></div><br><br>
        <%
            java.util.LinkedList<UserComments> lsComments = (java.util.LinkedList<UserComments>) request.getAttribute("Comments");
            if (lsComments==null) {
        %>
        <div class ="contentbox">
            <h3><p>No Comments found</p></h3>
            </div>
        <%
        } else {
            Iterator<UserComments> iterator;
            iterator = lsComments.iterator();
            while (iterator.hasNext()) {
                UserComments c = (UserComments) iterator.next();

        %>
        <div class ="contentbox">
            <h3><%=c.getUser() %> </h3>
            <ul>
                <p><%=c.getComment()%></p>
            </ul>
        </div>
            <br><br>
     
        <%

            }
            }
        %>
        


        </article>
        <footer>
            <ul>
                <li class ="footer">&COPY; Andy C & Sean Stewart</li>
            </ul>
        </footer>
    </body>
</html