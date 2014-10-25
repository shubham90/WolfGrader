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
        <form role="form" action="professor_add_course_2.jsp" method="POST">
            <div class="form-group col-xs-4">
                Course ID: <input type="text" class="form-control" placeholder="CSC440" required name='cid'>
                Name: <input type="text" class="form-control" placeholder="Database Systems" required name='name'>
                Start Date: <input type="text" class="form-control" placeholder="25 August 2014" required name='start_date'>
                End Date: <input type="text" class="form-control" placeholder="10 December 2014" required name='end_date'>
                <input type="hidden" class="form-control" value='<%= session.getAttribute("name") %>' required name='unityid'>
                <input type="hidden" class="form-control" value='0' required name='enrolled_students'>
                Max Enrolled Students: <input type="text" class="form-control" placeholder="20" required name='max_enrolled_students'>
                Grad Status: <input type="text" class="form-control" placeholder="1 for undergrad, 2 for grad" required name='grad_status'>
                Token: <input type="text" class="form-control" placeholder="CSC440FALL14" required name='token'>
                <input type="submit" value="Submit" class="btn btn-default">
            </div>
        </form>
        <br />
        <a href="professor.jsp">Back</a>
    </body>
</html>