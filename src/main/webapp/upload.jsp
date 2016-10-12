<%-- 
    Document   : upload
    Created on : Sep 22, 2014, 6:31:50 PM
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
        <h1>InstaGrim ! </h1>
        <h2>Your world in Black and White</h2>
    </div>
        <div>
            <ul id="navbar">
                <li><a href="/Instagrim/index.jsp">Home</a></li>
                <li><a href="upload.jsp" class="active" >Upload</a></li>
                <li><a href="profile.jsp">Profile</a></li>
                 <li style ="float: right"><a href="LogOut" method="GET">Log Out</a></li>
            </ul>
        </div>
 
        <article id="content" class="contentproperties">
            <div class="contentbox">
            <h3>File Upload</h3>
            <ul>
            <form method="POST" enctype="multipart/form-data" action="Image">
                File to upload: <input type="file" name="upfile"><br/>

                <br/>
                <input type="submit" value="Click to Upload File">
            </form>
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
