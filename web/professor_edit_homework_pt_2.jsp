<%-- 
    Document   : select_course
    Created on : Oct 13, 2014, 8:10:35 PM
    Author     : adam
--%>

<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*"%>


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
        <title>Edit Homework</title>
        
        <script type="text/javascript">

function changeFunc() {
var selectBox = document.getElementById("question_column");
var val = selectBox.options[selectBox.selectedIndex].value;
alert(val);
}

</script>
    </head>
    <body>
        <!-- Refer to 4A.3.1 -->
        <div class="form-group col-xs-4">
                <select class="form-control" name="course">
                    <!-- populate from courses table -->
                    <option value="CSC540">DBMS</option>
                    <option value="CSC515">Software Security</option>
                </select>
            </div>
        
        <form role="form" action="professor_edit_homework_pt_2_1.jsp" method="POST">
            <div class="form-group col-xs-4">
                <select class="form-control" name="question_column" onchange="professor_edit_homework_pt_2_1.jsp">
                    <option value="1">Start Date</option>
                    <option value="2">End Date</option>
                    <option value="3">Number of Attempts</option>
                    <option value="4">Topics</option>
                    <option value="5">Difficulty Range (1 to 6)</option>
                    <option value="6">Score Selection Scheme</option>
                    <option value="7">Number of Questions</option>
                    <option value="8">Correct Answer Points</option>
                    <option value="9">Incorrect Answer Points</option>
                </select>
                
<%@ include file="professor_edit_homework_pt_2_1.jsp" %>
                <input type="submit" value="Submit" class="btn btn-default">
            </div>
        </form>
       <a href="javascript:history.back()">Back</a>
    </body>
</html>
