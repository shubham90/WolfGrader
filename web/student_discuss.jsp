<%--
    Document : student_discuss
    Created on : Oct 29, 2014, 8:45:19 PM
    Author : Shubham
--%>
<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.js"></script>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <title>Doubt Page</title>
    </head>
    
    <body>
        <% 
            String unityid=(session.getAttribute("unityid")).toString();
            session.setAttribute("unityid", unityid);
            String token=(session.getAttribute("token")).toString();
            session.setAttribute("token", token);
        %>
        
        <h1>Welcome to Doubt Page</h1>
        <div class="panel panel-default">
            <div class="panel-heading">Please select from the choices</div>
                <div class="panel-body">
                    <ul class="nav nav-pills nav-stacked">
                        <li><a href="student_discuss_new.jsp">New Doubt</a><br></li>
                       
                        <li><a href="student_discuss_view.jsp">View Doubts</a></li>
                    </ul>
                    <br />
                    <a href="javascript:history.back()">Back</a>
                </div>
        </div>
    </body>
</html>