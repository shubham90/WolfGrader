<%-- 
    Document   : add_course
    Created on : Oct 13, 2014, 8:34:08 PM
    Author     : adam
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
        <title>Add Course</title>
    </head>
    <body>
        
        <form role="form" name="token_form" action="student_token.jsp" method="post">
            <div class="form-group">
                Add Course: <input type="text" class="form-control" placeholder="Enter Token (ex: CSC540FALL14" name="token" required>
                <input type="submit" value="Submit">
            </div>
        </form>
        <a href="javascript:history.back()">Back</a>
    </body>
</html>