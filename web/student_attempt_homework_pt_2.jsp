<%-- 
    Document   : homework
    Created on : Oct 16, 2014, 11:46:54 PM
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
        <title>Homework</title>
    </head>
    <body>
        <!-- follow rules on page -->
        <!-- Loop through result query set and post questions in format below-->
        <!-- <h1>[INSERT COURSE NAME]</h1> -->
        <div class="panel panel-default">
            <div class="panel-heading">Homework Questions</div>
                <div class="panel-body">
                    <div class="alert alert-info">
                        <div class="form">
                            <label class="control-label">[Q#.] What is your name?</label>
                            <label class="radio">
                            <input value="1" type="radio">a) Bob
                            </label>
                            <label class="radio">
                            <input value="2" type="radio">b) Suzy
                            </label>
                            <label class="radio">
                            <input value="3" type="radio">c) Sparky
                            </label>
                            <label class="radio">
                            <input value="4" type="radio">d) Edward Snowden
                            </label>
                        </div>
                    </div>
                    <br />
                    <a href="student_attempt_homework.jsp">Back</a>
                </div>
        </div>
    </body>
</html>