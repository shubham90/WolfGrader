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
        <!-- 4A.6 -->
        <!-- Provide text box for user to submit a query -->
        <!-- Post results of said query to professor_reports_pt_2.jsp -->
     
        <form role="form" name="show_reports" action="professor_reports_pt_2.jsp" method="post">
            
                <div class="col-md-8">
                    <h2> Please write your query here</h2>
                    <textarea rows="5" cols="100" placeholder="Enter Query" required name="query"></textarea>
               <br> <input type="submit" value="Submit"><br><br>
                
           
        </form>
        <form role="form" name="bonus_reports" action="bonus_query.jsp" method="post">
            <% String token=(session.getAttribute("token")).toString();
            session.setAttribute("token",token);
            
            %>
            <div class="form-group">
                <h3> Students for Participation marks</h3>
                <input type="submit" value="Submit" class="active">  
            </div>
        </form>
            
            
        <!--    <form role="form" name="query 4" action="query_4.jsp" method="post">
          <% //  String token1=(session.getAttribute("token")).toString(); 
      //      session.setAttribute("token",token1);
            
            %>
            <div class="form-group">
                <h3> Query 4</h3>
                <input type="submit" value="Query 4" class="active">  
            </div>
        </form> -->
            <a href="javascript:history.back()">Back</a>
            </div>
        
    </body>
</html>