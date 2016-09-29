<%-- 
    Document   : login.jsp
    Created on : Sep 28, 2014, 12:04:14 PM
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
        <h1>InstaGrim! </h1>
        <h2>Your world in Black and White</h2>
        </div>
        <div>
            <ul id="navbar">
                <li id = "menu"><a href="index.jsp">Home</a></li>
                <li><a href="/Instagrim/Images/majed">Sample Images</a></li>
            </ul>
        </div>
       
        <article id="content">
            <h3>Login</h3>
            <form method="POST"  action="Login">
                <ul id="menu">
                        <p>User Name</p> 
                        <input type="text" name="username">
                        <p>Password</p> 
                        <input type="password" name="password">
                <br/>
                <input type="submit" value="Login">
                </ul>
            </form>

        </article>
        <footer>
            <ul>
                <li class="footer"><a href="/Instagrim">Home</a></li>
            </ul>
        </footer>
    </body>
</html>
