<%-- 
    Document   : attempt_homework
    Created on : Oct 16, 2014, 11:36:48 PM
    Author     : Maria
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
        <title>Attempt Homework</title>
    </head>
    <body>
        <!-- follow rules on page -->
        <h1>[INSERT COURSE NAME]</h1>
        <div class="panel panel-default">
            <div class="panel-heading">View Homework Attempts</div>
                <div class="panel-body">
                    <ul class="nav nav-pills nav-stacked">
                        <!-- If number attempts for selected H/W are exhausted, print "No more attempts" and go back -->
                        <li><a href="#">1. [HOMEWORK NUMBER] [NUMBER REMAINING ATTEMPTS/Unlimited/No more attempts]</a></li>
                    </ul>
                    <br />
                    <!-- not sure where goes back to -->
                    <a href="student_course.jsp">Back</a>
                </div>
        </div>
    </body>
</html>