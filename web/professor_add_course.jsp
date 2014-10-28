<%--
    Document : add_course
    Created on : Oct 13, 2014, 8:34:08 PM
    Author : adam
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
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
        <title>Add Course</title>
    </head>
    <body>
        <script>
            //function validateForm() {
                //var x = document.forms["add_course"]["fname"].value;
                //if (x==null || x=="") {
                    //alert("First name must be filled out");
                    //return false;
                //}
            //}
            //$('#add_course').submit(function(ev) {
                //ev.preventDefault(); // to stop the form from submitting
                /* Validations go here */
                
                //this.submit(); // If all the validations succeeded
            //});
            $(function() {
                $("#datepicker1").datepicker({ dateFormat: "dd MM yy" });
                $("#datepicker2").datepicker({ dateFormat: "dd MM yy" });
            });
        </script>
        
        <form id="add_course" role="form" action="professor_add_course_2.jsp" method="POST">
            <div class="form-group col-xs-4">
                Course ID: <input type="text" class="form-control" placeholder="CSC440" required name='cid'>
                Name: <input type="text" class="form-control" placeholder="Database Systems" required name='name'>
                <!-- Start Date: <input type="text" class="form-control" placeholder="25 August 2014" required name='start_date'>-->
                <!--End Date: <input type="text" class="form-control" placeholder="10 December 2014" required name='end_date'>-->
                <br>
                <p>Start Date: <input type="text" id="datepicker1" required name='start_date'></p>
                <p>End Date: <input type="text" id="datepicker2" required name='end_date'></p>
                <input type="hidden" class="form-control" value='<%= session.getAttribute("name") %>' required name='unityid'>
                <input type="hidden" class="form-control" value='0' required name='enrolled_students'>
                Max Enrolled Students: <input type="text" class="form-control" placeholder="20" required name='max_enrolled_students'>
                Grad Status:
                <br>
                <select size="1" id="grad_status" required name='grad_status'>
                    <option value="2">Graduate</option>
                    <option value="1">Undergraduate</option>
                </select>
                <br>
                <br>
                <!-- <Grad Status: <input type="text" class="form-control" placeholder="1 for undergrad, 2 for grad" required name='grad_status'>-->
                Token: <input type="text" class="form-control" placeholder="CSC440FALL14" required name='token'>
                <br>
                <input type="submit" value="Submit" class="btn btn-default">
            </div>
        </form>
        <a href="javascript:history.back()">Back</a>
    </body>
</html>