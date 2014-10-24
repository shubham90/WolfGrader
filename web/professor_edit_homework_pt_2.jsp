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
        <title>Edit Homework</title>
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
                <select class="form-control" name="question_column">
                    <option value="start_date">Start Date</option>
                    <option value="end_date">End Date</option>
                    <option value="number_of_attempts">Number of Attempts</option>
                    <option value="topics">Topics</option>
                    <option value="difficulty">Difficulty Range (1 to 6)</option>
                    <option value="score_selection">Score Selection Scheme</option>
                    <option value="num_of_questions">Number of Questions</option>
                    <option value="correct_ans_pts">Correct Answer Points</option>
                    <option value="incorrect_ans_pts">Incorrect Answer Points</option>
                </select>
                <input type="submit" value="Submit" class="btn btn-default">
            </div>
        </form>
        <a href="professor_edit_homework.jsp">Back</a>
    </body>
</html>
