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
        <!-- perhaps have an add homework success page.. -->
        <form role="form" action="professor_add_homework_success.jsp" method="POST">
            <div class="form-group col-xs-4">
                Start Date: <input type="text" class="form-control" placeholder="Enter Start Date" required>
                End Date: <input type="text" class="form-control" placeholder="Enter End Date" required>
                Number of Attempts: <input type="text" class="form-control" placeholder="Enter Number of Attempts" required>
                Topics: <input type="text" class="form-control" placeholder="Enter Topics" required>
                Difficulty Range (1 to 6): <input type="text" class="form-control" placeholder="Enter Difficulty Range" required>
                Score Selection Scheme: <input type="text" class="form-control" placeholder="Enter Score Selection Scheme" required>
                Number of Questions: <input type="text" class="form-control" placeholder="Enter Number of Questions" required>
                Correct Answer Points: <input type="text" class="form-control" placeholder="Enter Correct Answer Points" required>
                Incorrect Answer Points: <input type="text" class="form-control" placeholder="Enter Incorrect Answer Points" required>
                <input type="submit" value="Submit" class="btn btn-default">
            </div>
        </form>
        <br />
        <a href="professor.jsp">Back</a>
    </body>
</html>
