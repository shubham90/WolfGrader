<%--
    Document : student_course
    Created on : Oct 13, 2014, 8:45:19 PM
    Author : adam, maria (10/16)
--%>

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
        <title>Course</title>
    </head>
    <body>
        <% String token=request.getParameter("course"); 
        session.setAttribute( "token", token ); 
        %>
        
        <!-- follow rules on page -->
        <h1>Welcome to <%= token %></h1>
        <div class="panel panel-default">
            <div class="panel-heading">Course Options</div>
                <div class="panel-body">
                    <ul class="nav nav-pills nav-stacked">
                        <li><a href="ta_view_homework.jsp">View Homework</a></li>
                        <li><a href="ta_reports.jsp">Reports</a></li>
                        <li><a href="ta_discuss.jsp">Doubt Forum</a></li>
                    </ul>
                    <br />
                    <a href="javascript:history.back()">Back</a>
                </div>
        </div>
    </body>
</html>