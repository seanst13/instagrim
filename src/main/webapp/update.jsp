<%-- 
    Document   : update
    Created on : 09-Oct-2016, 15:16:43
    Author     : seans
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
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
                <li><a href="index.jsp">Home</a></li>
                <li><a href="profile.jsp">Profile</a></li>
                <% 
                   LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
                   ProfileInfo pi = (ProfileInfo) session.getAttribute("ProfileInfo"); 
                
                %>
                <li><a href="/Instagrim/Images/<%=lg.getUsername()%>">Your Images</a></li>
            </ul>
        </div>
       
        <div id ="content" class ="contentproperties">
            
            <div class ="contentbox">        
            <h3>Edit Your Profile Picture</h3>
            <ul>
            <form method="POST" enctype="multipart/form-data" action="Image">
                File to upload: <input type="file" name="upfile"><br/>
                
                Filter for Image:
                  <input type="radio" name="filter" value="gray"> Grayscale Filter
                  <input type="radio" name="filter" value="dark"> Dark Filter
                  <input type="radio" name="filter" value="light"> Bright Filter
                  <input type="radio" name="filter" value="none"> No Filter<br>
                  <input type="hidden" name ="check" value="true">
                <br/>
                <input type="submit" value="Click to Upload File">
            </form> 
            </div><br><br><br>  
                
            <div class ="contentbox">      
            <h3>Update Your Account Details</h3>    
                <form method="POST"  action="Update">
                <ul>
                    <p>Username</p>
                    <input type ="text" name="username" value="<%=lg.getUsername()%>" readonly>
                    <h4>Personal Details</h4>
                    <p>Forename</p>
                    <input type ="text" name="forename">
                    <p>Surname</p>
                    <input type ="text" name="surname">
                    <p>Email Address</p>
                    <input type ="text" name="email">
                    
                <br/>
                
                <input type="submit" value="Update Details">
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