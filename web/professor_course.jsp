<%-- 
    Document   : token
    Created on : Oct 13, 2014, 8:45:19 PM
    Author 1   : Adam Gillfian
    Author 2   : Shubham Bhawsinka
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
                        <li><a href="professor_add_homework.jsp">Add Homework</a></li>
         <!--               <li><a href="professor_add_questions.jsp">Add/Remove Questions to Homework</a></li>   -->
                        <li><a href="professor_edit_homework.jsp">Edit Homework</a></li>
                        <li><a href="professor_view_homework.jsp">View Homework</a></li>
                        <li><a href="professor_view_notification.jsp">View Notification</a></li>
                        <li><a href="professor_reports.jsp">Reports</a></li>
                        <li><a href="professor_discuss.jsp">Doubt Forum</a></li>
                        <li><a href="javascript:history.back()">Back</a></li>
                    </ul>
                    <br />
     <!--               <a href="professor_select_course.jsp">Back</a>                   -->
                    
                </div>
        </div>
        
    </body>
</html>