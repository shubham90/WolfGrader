<%-- 
    Document   : select_course
    Created on : Oct 13, 2014, 8:10:35 PM
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
        <title>Select Course</title>
    </head>
    <body>
        <form role="form" action="select_course.jsp" method="POST">
            <div class="form-group col-xs-4">
                <select class="form-control" name="course">
                    <!-- populate from courses table -->
                    <option value="CSC540">DBMS</option>
                    <option value="CSC515">Software Security</option>
                </select>
            </div>
            
            <button type="submit" class="btn btn-default">Submit</button>
        </form>
        <br />
        <a href="professor.jsp">Back</a>
    </body>
</html>
