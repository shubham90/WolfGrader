<%-- 
    Document   : homework
    Created on : Oct 27, 2014, 3:56:54 PM
    Author     : adam
--%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*" 
         import="java.util.Date"%>
<%!
Connection con;
	public void jspInit()
	{
		try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String conString="jdbc:oracle:thin:@ora.csc.ncsu.edu:1521:orcl";
		con=DriverManager.getConnection(conString,"agillfi","200024707");
		}
		catch(Exception e){}
	}
	public void jspDestroy()
	{
		try{
		con.close();
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
%>

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
        <title>Homework</title>
    </head>
    <body>
        
        <% 
            int num_of_questions = (Integer) session.getAttribute("num_of_questions");
            String[] str = new String[num_of_questions];
            
        %>
        
        
        <!-- could add query to get homework name based on exid to put in <h1> -->
        <h1>Homework for <%= session.getAttribute("token") %>!</h1>
        
        <div class="panel panel-default">
            <div class="panel-heading">Homework Questions</div>
            <div class="container">
                <%
                for(int i=0; i<num_of_questions; i++){
                    str[i] = request.getParameter(""+i);
                %>
                    Q<%= i+1 %> answer: <%= str[i] %>
                    <br />
                <%
                }
                %>
                <a href="javascript:history.back()">Back</a>
            </div>
        </div>
    </body>
</html>