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
        <script>
//            function validateForm() {
//                var x = document.forms["add_course"]["fname"].value;
//                if (x==null || x=="") {
//                    alert("First name must be filled out");
//                    return false;
//                }
//            }
        </script>
        
        <form role="form" name="add_course" action="token.jsp" method="post">
            <div class="form-group">
                Add Course: <input type="text" class="form-control" placeholder="Enter Token" required>
                <input type="submit" value="Submit">
            </div>
        </form>
    </body>
</html>