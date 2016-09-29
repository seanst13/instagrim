<%-- 
    Document   : register.jsp
    Created on : Sep 28, 2014, 6:29:51 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Instagrim</title>
        <link rel="stylesheet" type="text/css" href="Styles.css" />
    </head>
    <body>
        <div id="header">
        <h1 id="main">InstaGrim! </h1>
        <h2 id ="main">Your world in Black and White</h2>
        </div>
        <div>
            <ul id="navbar">
                <li id = "menu"><a href="index.jsp">Home</a></li>
                <li id = "menu"><a href="/Instagrim/Images/majed">Sample Images</a></li>
            </ul>
        </div>
       
        <div id ="content">
            <h3>Register as user</h3>

            <form method="POST"  action="Register">
                <ul id="menu">
                    <p>User Name</p>
                    <input type="text" name="username">
                    <p>Password</p>
                    <input type="password" name="password">
                <br/>
                <input type="submit" value="Register">
                </ul>
            </form>

        </div>
        <footer>
            <ul>
                <li class="footer"><a href="/Instagrim">Home</a></li>
            </ul>
        </footer>
    </body>
</html>
