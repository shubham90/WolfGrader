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
        <title>View Reports</title>
    </head>
    <body>
        <h2>View Reports</h2>
        <!-- 5A.2 -->
        <!-- Provide text box for user to submit a query -->
        <!-- Post results of said query to ta_reports_pt_2.jsp -->
        <br />
        <form role="form" name="show_reports" action="ta_reports_pt_2.jsp" method="post">
            <div class="form-group">
                <h2>Please write your query here</h2>
                Query: <input type="text" class="form-control" placeholder="Enter Query" required name="query">
                <input type="submit" value="Submit">
            </div>
        </form>
        <a href="javascript:history.back()">Back</a>
    </body>
</html>